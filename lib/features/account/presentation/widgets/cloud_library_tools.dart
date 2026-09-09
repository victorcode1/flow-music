import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/backend/backend_providers.dart';
import 'package:flow_music/features/account/application/library_export.dart';
import 'package:flow_music/features/account/data/cloud_library_api.dart';
import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:flow_music/features/account/presentation/providers/user_data_sync_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class CloudLibraryTools extends ConsumerStatefulWidget {
  const CloudLibraryTools({super.key});
  @override
  ConsumerState<CloudLibraryTools> createState() => _CloudLibraryToolsState();
}

class _CloudLibraryToolsState extends ConsumerState<CloudLibraryTools> {
  bool _busy = false;
  CloudLibraryApi? get _api {
    final client = ref.read(supabaseClientProvider);
    return client == null ? null : CloudLibraryApi(client);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userDataSyncRevisionProvider);
    final user = ref.watch(authUserProvider).value;
    final store = ref.watch(userDataLocalStoreProvider);
    // Tests and unavailable-storage platforms may render before Hive is opened.
    DateTime? last;
    try {
      if (store.ownerId == user?.id) last = store.lastSuccessfulSync;
    } catch (_) {}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user != null && last != null)
          Text('cloud_last_success'.tr(namedArgs: {'date': _date(last)})),
        Wrap(
          spacing: 8,
          children: [
            OutlinedButton.icon(
              key: const Key('export-local-library'),
              onPressed: _busy ? null : () => _export(local: true),
              icon: const Icon(Icons.file_download_outlined),
              label: Text('library_export_local'.tr()),
            ),
            if (user != null)
              TextButton.icon(
                key: const Key('cloud-library-details'),
                onPressed: _busy ? null : _details,
                icon: const Icon(Icons.cloud_outlined),
                label: Text('cloud_details'.tr()),
              ),
          ],
        ),
      ],
    );
  }

  String _date(DateTime date) =>
      DateFormat.yMd().add_Hm().format(date.toLocal());

  Future<void> _details() async {
    final userId = ref.read(authRepositoryProvider).currentUser?.id;
    if (userId == null || _api == null) return;
    setState(() => _busy = true);
    try {
      final response = await _api!.call('status');
      if (!mounted ||
          ref.read(authRepositoryProvider).currentUser?.id != userId) {
        return;
      }
      final status = CloudLibraryStatus.fromJson(response);
      final action = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('cloud_details'.tr()),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (status.hasBackup ? 'cloud_backup_exists' : 'cloud_no_backup')
                      .tr(),
                ),
                if (status.updatedAt != null)
                  Text(
                    'cloud_last_backup'.tr(
                      namedArgs: {'date': _date(status.updatedAt!)},
                    ),
                  ),
                Text(
                  'cloud_storage_used'.tr(
                    namedArgs: {
                      'used': (status.bytesUsed / 1024).toStringAsFixed(1),
                      'max': (status.maxBytes / 1024).toStringAsFixed(0),
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text('cloud_limits_info'.tr()),
                const SizedBox(height: 12),
                Text('cloud_retention_policy'.tr()),
                if (status.noticeRequired) ...[
                  const SizedBox(height: 12),
                  Text('cloud_retention_notice'.tr()),
                ],
                if (status.deleteAfter != null)
                  Text(
                    'cloud_delete_after'.tr(
                      namedArgs: {'date': _date(status.deleteAfter!)},
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('close'.tr()),
            ),
            if (status.hasBackup)
              TextButton(
                onPressed: () => Navigator.pop(context, 'export'),
                child: Text('library_export_cloud'.tr()),
              ),
            if (status.noticeRequired)
              TextButton(
                onPressed: () => Navigator.pop(context, 'acknowledge'),
                child: Text('cloud_notice_understood'.tr()),
              ),
          ],
        ),
      );
      if (!mounted ||
          ref.read(authRepositoryProvider).currentUser?.id != userId) {
        return;
      }
      if (action == 'acknowledge') {
        final data = await _api!.call('acknowledge_retention');
        if (!mounted ||
            ref.read(authRepositoryProvider).currentUser?.id != userId) {
          return;
        }
        final deadline = CloudLibraryStatus.fromJson(data).deleteAfter;
        if (deadline != null) {
          _message(
            'cloud_delete_after'.tr(namedArgs: {'date': _date(deadline)}),
          );
        }
      } else if (action == 'export') {
        await _export(local: false);
      }
    } catch (error) {
      if (mounted) _message(_errorKey(error).tr());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _export({required bool local}) async {
    final userId = ref.read(authRepositoryProvider).currentUser?.id;
    final approved = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('library_export_title'.tr()),
        content: Text('library_export_privacy'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('cancel'.tr()),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('library_export_continue'.tr()),
          ),
        ],
      ),
    );
    if (approved != true ||
        !mounted ||
        ref.read(authRepositoryProvider).currentUser?.id != userId) {
      return;
    }
    setState(() => _busy = true);
    try {
      SyncedUserData snapshot;
      if (local) {
        final store = ref.read(userDataLocalStoreProvider);
        if (store.ownerId != userId) {
          throw const CloudLibraryFailure('account_switch_pending');
        }
        snapshot = store.read();
      } else {
        if (_api == null || userId == null) {
          throw const CloudLibraryFailure('unavailable');
        }
        final data = await _api!.call('export');
        if (!mounted ||
            ref.read(authRepositoryProvider).currentUser?.id != userId) {
          return;
        }
        final row = data['snapshot'];
        if (row is! Map) throw const CloudLibraryFailure('no_backup');
        snapshot = SyncedUserData.fromDatabase(Map<String, dynamic>.from(row));
      }
      if (!mounted) return;
      final renderBox = context.findRenderObject();
      final origin = renderBox is RenderBox && renderBox.hasSize
          ? renderBox.localToGlobal(Offset.zero) & renderBox.size
          : null;
      final result = await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile.fromData(
              LibraryExport.encode(snapshot),
              mimeType: 'application/json',
            ),
          ],
          fileNameOverrides: [
            'streambeat-library-${DateFormat('yyyyMMdd-HHmmss').format(DateTime.now())}.json',
          ],
          sharePositionOrigin: origin,
        ),
      );
      if (mounted && result.status == ShareResultStatus.unavailable) {
        _message('library_export_failed'.tr());
      }
    } catch (error) {
      if (mounted) {
        _message(local ? 'library_export_failed'.tr() : _errorKey(error).tr());
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _errorKey(Object error) =>
      error is CloudLibraryFailure && error.code == 'rate_limited'
      ? 'cloud_sync_rate_limited'
      : 'cloud_sync_unavailable';

  void _message(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));
}
