import 'package:flow_music/features/home/data/home_suggestions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_suggestions_provider.g.dart';

@Riverpod(keepAlive: true)
Future<HomeRadioSuggestions> homeSuggestions(Ref ref) {
  return HomeSuggestionsRepository().load();
}
