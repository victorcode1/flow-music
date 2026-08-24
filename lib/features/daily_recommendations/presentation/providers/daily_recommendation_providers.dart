import 'package:flow_music/features/daily_recommendations/data/local_daily_recommendation_repository.dart';
import 'package:flow_music/features/daily_recommendations/domain/repositories/daily_recommendation_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dailyRecommendationRepositoryProvider =
    Provider<DailyRecommendationRepository>((ref) {
      final repository = LocalDailyRecommendationRepository();
      ref.onDispose(repository.dispose);
      return repository;
    });

final dailyRecommendationControllerProvider =
    NotifierProvider<DailyRecommendationController, bool>(
      DailyRecommendationController.new,
    );

class DailyRecommendationController extends Notifier<bool> {
  @override
  bool build() => ref.watch(dailyRecommendationRepositoryProvider).isEnabled;

  bool get isSupported =>
      ref.read(dailyRecommendationRepositoryProvider).isSupported;

  Future<DailyRecommendationToggleResult> setEnabled(
    bool enabled, {
    required String languageCode,
  }) async {
    final result = await ref
        .read(dailyRecommendationRepositoryProvider)
        .setEnabled(enabled, languageCode: languageCode);
    if (result == DailyRecommendationToggleResult.enabled) state = true;
    if (result == DailyRecommendationToggleResult.disabled) state = false;
    return result;
  }
}
