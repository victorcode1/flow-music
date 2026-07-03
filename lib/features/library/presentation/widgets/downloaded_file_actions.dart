import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/song/presentation/controllers/audio_download_writer_stub.dart'
    if (dart.library.io) 'package:flow_music/features/song/presentation/controllers/audio_download_writer_io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

Future<void> showDownloadedFileActions({
  required BuildContext context,
  required DownloadedAudio? audio,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (audio == null || kIsWeb) {
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.file_not_found.tr())),
    );
    return;
  }

  final info = await getDownloadedFileInfo(audio);
  if (!context.mounted) return;

  if (!info.exists) {
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.file_not_found.tr())),
    );
    return;
  }

  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      final theme = Theme.of(sheetContext);
      final colors = theme.colorScheme;

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.file_location.tr(),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SelectableText(
                  audio.filePath,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${LocaleKeys.file_size.tr()}: ${formatDownloadedFileSize(info.sizeBytes)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.ios_share_rounded, color: colors.primary),
                title: Text(LocaleKeys.share_file.tr()),
                onTap: () async {
                  Navigator.of(sheetContext).pop();
                  await shareDownloadedFile(context: context, audio: audio);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.copy_rounded, color: colors.primary),
                title: Text(LocaleKeys.copy_path.tr()),
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: audio.filePath));
                  if (!sheetContext.mounted) return;
                  Navigator.of(sheetContext).pop();
                  if (!context.mounted) return;
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    SnackBar(content: Text(LocaleKeys.path_copied.tr())),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> shareDownloadedFile({
  required BuildContext context,
  required DownloadedAudio audio,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (kIsWeb) {
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.share_unavailable.tr())),
    );
    return;
  }

  final info = await getDownloadedFileInfo(audio);
  if (!context.mounted) return;

  if (!info.exists) {
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.file_not_found.tr())),
    );
    return;
  }

  final shareable = await prepareDownloadedForSharing(audio);
  if (!context.mounted) return;

  final box = context.findRenderObject() as RenderBox?;
  final params = ShareParams(
    files: [XFile(shareable.path, mimeType: shareable.mimeType)],
    text: audio.title.isEmpty ? null : audio.title,
    subject: audio.title.isEmpty ? null : audio.title,
    sharePositionOrigin: box != null
        ? box.localToGlobal(Offset.zero) & box.size
        : null,
  );
  await SharePlus.instance.share(params);
}

String formatDownloadedFileSize(int bytes) {
  if (bytes <= 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  var size = bytes.toDouble();
  var unit = 0;
  while (size >= 1024 && unit < units.length - 1) {
    size /= 1024;
    unit++;
  }
  final formatted = size >= 100 || unit == 0
      ? size.toStringAsFixed(0)
      : size.toStringAsFixed(1);
  return '$formatted ${units[unit]}';
}
