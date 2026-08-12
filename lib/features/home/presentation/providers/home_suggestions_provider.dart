import 'package:flow_music/features/home/data/home_suggestions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_suggestions_provider.g.dart';

@Riverpod(keepAlive: true)
Future<HomeRadioSuggestions> homeSuggestions(Ref ref) async {
  final repository = HomeSuggestionsRepository();
  try {
    return await repository.load();
  } finally {
    repository.close();
  }
}
