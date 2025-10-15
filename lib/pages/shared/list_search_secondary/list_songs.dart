import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listSongControllers);
    final theme = Theme.of(context);
    final extras = theme.extension<FlowThemeExtras>();
    final colors = theme.colorScheme;
    return controller
        .result(data: data)
        .when(
          data: (data) => data == null
              ? const SizedBox.shrink()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: controller.count(data: data),
                  separatorBuilder: (_, _) => const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final title = controller.dataRes(data: data, index: index);
                    final subtitle =
                        controller.subtitle(data: data, index: index) ?? '';
                    final image = controller.imageRes(data: data, index: index);

                    return InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: () => controller.escuchar(
                        data: data,
                        context: context,
                        index: index,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: extras?.secondaryGradient,
                          border: Border.all(
                            color: extras?.subtleStroke ?? colors.outline,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withValues(
                                alpha: theme.brightness == Brightness.dark
                                    ? 0.5
                                    : 0.12,
                              ),
                              blurRadius: 24,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 60,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              color: colors.surface.withValues(
                                                alpha: 0.25,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.library_music_rounded,
                                                color: colors.onSurfaceVariant,
                                              ),
                                            ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.2,
                                        ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: extras?.primaryGradient,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
          error: (error, stack) => Center(
            child: Text('Error $error $stack', textAlign: TextAlign.center),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
          ),
        );
  }
}
