import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/presentation/widgets/downloaded_file_actions.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

/// Enlace publico de una cancion de YouTube.
String youtubeShareLink(String videoId) => 'https://youtu.be/$videoId';

/// Hoja para compartir lo que suena: el enlace de YouTube o, si la cancion ya
/// esta en el dispositivo, el propio archivo de audio.
Future<void> showShareSongSheet({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final controller = ref.read(songController);
  final videoId = controller.currentVideoId ?? '';
  final messenger = ScaffoldMessenger.maybeOf(context);

  if (videoId.isEmpty) {
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.download_no_song.tr())),
    );
    return;
  }

  final title = controller.displayTitle ?? '';
  final author = controller.displayAuthor ?? '';
  // El archivo local puede venir de "guardar offline" o de una descarga.
  final localAudio =
      controller.currentOfflineAudio ?? controller.currentDownloadedMedia;
  final shareableFile = kIsWeb || localAudio == null || localAudio.isVideo
      ? null
      : localAudio;

  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      final theme = Theme.of(sheetContext);
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
              child: Text(
                LocaleKeys.share_song.tr(),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  author.isEmpty ? title : '$title · $author',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ListTile(
              leading: const Icon(Icons.link_rounded),
              title: Text(LocaleKeys.share_youtube_link.tr()),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                await shareYoutubeLink(
                  context: context,
                  videoId: videoId,
                  title: title,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_copy_rounded),
              title: Text(LocaleKeys.copy_link.tr()),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                await Clipboard.setData(
                  ClipboardData(text: youtubeShareLink(videoId)),
                );
                messenger?.showSnackBar(
                  SnackBar(content: Text(LocaleKeys.link_copied.tr())),
                );
              },
            ),
            ListTile(
              enabled: shareableFile != null,
              leading: const Icon(Icons.audio_file_rounded),
              title: Text(LocaleKeys.share_audio_file.tr()),
              subtitle: shareableFile == null
                  ? Text(
                      kIsWeb
                          ? LocaleKeys.share_unavailable.tr()
                          : LocaleKeys.share_audio_needs_download.tr(),
                    )
                  : null,
              onTap: shareableFile == null
                  ? null
                  : () async {
                      Navigator.of(sheetContext).pop();
                      await shareDownloadedFile(
                        context: context,
                        audio: shareableFile,
                      );
                    },
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

/// Comparte el enlace de YouTube de [videoId] por la hoja del sistema.
Future<void> shareYoutubeLink({
  required BuildContext context,
  required String videoId,
  String title = '',
}) async {
  if (videoId.isEmpty) return;

  final link = youtubeShareLink(videoId);
  final box = context.findRenderObject() as RenderBox?;
  await SharePlus.instance.share(
    ShareParams(
      text: title.isEmpty ? link : '$title\n$link',
      subject: title.isEmpty ? null : title,
      sharePositionOrigin: box != null
          ? box.localToGlobal(Offset.zero) & box.size
          : null,
    ),
  );
}
