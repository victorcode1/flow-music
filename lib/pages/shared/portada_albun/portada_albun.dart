import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/pages/song/controller/song_play_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PortadaAlbun extends ConsumerWidget {
  final SongIdResponde? data;
  const PortadaAlbun({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(songPlayController);
    return StreamBuilder<SongIdResponde>(
      stream: controller.streamController.stream,
      builder: (context, snapshot) {
        final thumbnails = snapshot.data?.videoDetails?.thumbnail?.thumbnails;
        final defaultThumbnails = data?.videoDetails?.thumbnail?.thumbnails;

        // Helper function to safely get a thumbnail URL
        String? getThumbnailUrl(List<ThumbnailElement>? thumbnails, int index) {
          return thumbnails != null && thumbnails.length > index
              ? thumbnails[index].url
              : null;
        }

        String imageUrl = getThumbnailUrl(thumbnails, 4) ??
            getThumbnailUrl(defaultThumbnails, 4) ??
            getThumbnailUrl(thumbnails, 3) ??
            getThumbnailUrl(defaultThumbnails, 3) ??
            getThumbnailUrl(thumbnails, 2) ??
            getThumbnailUrl(defaultThumbnails, 2) ??
            getThumbnailUrl(thumbnails, 1) ??
            getThumbnailUrl(defaultThumbnails, 1) ??
            getThumbnailUrl(thumbnails, 0) ??
            getThumbnailUrl(defaultThumbnails, 0) ??
            '';

        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
    );
  }
}
