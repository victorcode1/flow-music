import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/flow_mix/presentation/controllers/flow_mix_controller.dart';
import 'package:flow_music/features/radio/presentation/utils/play_radio_station.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlowMixCard extends ConsumerWidget {
  const FlowMixCard({super.key, this.countryCode = ''});

  final String countryCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flowMixControllerProvider);
    final colors = Theme.of(context).colorScheme;

    Future<void> start(FlowMixMood mood) async {
      final station = await ref
          .read(flowMixControllerProvider.notifier)
          .start(mood: mood, countryCode: countryCode);
      if (!context.mounted || station == null) return;
      final started = await playRadioStation(
        context: context,
        ref: ref,
        station: station,
      );
      if (started) {
        ref.read(flowMixControllerProvider.notifier).recordPlaybackStarted();
      }
    }

    return Container(
      key: const Key('flow-mix-card'),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.primaryContainer,
            colors.secondaryContainer.withValues(alpha: 0.9),
          ],
        ),
        border: Border.all(color: colors.primary.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: colors.onPrimary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.flow_mix_title.tr(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: colors.onPrimaryContainer,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      LocaleKeys.flow_mix_subtitle.tr(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.onPrimaryContainer.withValues(
                          alpha: 0.78,
                        ),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final mood in FlowMixMood.values)
                _MoodChip(
                  mood: mood,
                  isLoading: state.isLoading && state.mood == mood,
                  disabled: state.isLoading,
                  onPressed: () => start(mood),
                ),
            ],
          ),
          if (state.isLoading) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: const LinearProgressIndicator(minHeight: 4),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.flow_mix_loading.tr(),
              style: TextStyle(color: colors.onPrimaryContainer),
            ),
          ],
          if (state.hasError) ...[
            const SizedBox(height: 12),
            Text(
              LocaleKeys.flow_mix_error.tr(),
              key: const Key('flow-mix-error'),
              style: TextStyle(
                color: colors.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MoodChip extends StatelessWidget {
  const _MoodChip({
    required this.mood,
    required this.isLoading,
    required this.disabled,
    required this.onPressed,
  });

  final FlowMixMood mood;
  final bool isLoading;
  final bool disabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ActionChip(
      key: Key('flow-mix-${mood.name}'),
      avatar: isLoading
          ? SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colors.onSecondaryContainer,
              ),
            )
          : Icon(_icon, size: 18),
      label: Text(_label.tr()),
      labelStyle: const TextStyle(fontWeight: FontWeight.w800),
      backgroundColor: colors.surface.withValues(alpha: 0.78),
      side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.45)),
      onPressed: disabled ? null : onPressed,
    );
  }

  String get _label => switch (mood) {
    FlowMixMood.relax => LocaleKeys.flow_mix_mood_relax,
    FlowMixMood.energy => LocaleKeys.flow_mix_mood_energy,
    FlowMixMood.focus => LocaleKeys.flow_mix_mood_focus,
    FlowMixMood.local => LocaleKeys.flow_mix_mood_local,
    FlowMixMood.surprise => LocaleKeys.flow_mix_mood_surprise,
  };

  IconData get _icon => switch (mood) {
    FlowMixMood.relax => Icons.spa_rounded,
    FlowMixMood.energy => Icons.bolt_rounded,
    FlowMixMood.focus => Icons.center_focus_strong_rounded,
    FlowMixMood.local => Icons.near_me_rounded,
    FlowMixMood.surprise => Icons.casino_rounded,
  };
}
