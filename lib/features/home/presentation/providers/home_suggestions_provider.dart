import 'package:flow_music/features/home/data/home_suggestions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_suggestions_provider.g.dart';

/// Carga la lista de sugerencias iniciales para mostrar en `home` cuando no
/// hay query ni reproduccion activa.
///
/// `keepAlive: true` para que la lista no se pida cada vez que el usuario
/// vuelva al estado `Suggested` despues de buscar o reproducir.
@Riverpod(keepAlive: true)
Future<HomeSuggestionsResult> homeSuggestions(Ref ref) async {
  final repository = HomeSuggestionsRepository();
  return repository.load();
}
