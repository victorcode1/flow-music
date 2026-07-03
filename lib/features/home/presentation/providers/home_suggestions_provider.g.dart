// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_suggestions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Carga la lista de sugerencias iniciales para mostrar en `home` cuando no
/// hay query ni reproduccion activa.
///
/// `keepAlive: true` para que la lista no se pida cada vez que el usuario
/// vuelva al estado `Suggested` despues de buscar o reproducir.

@ProviderFor(homeSuggestions)
final homeSuggestionsProvider = HomeSuggestionsProvider._();

/// Carga la lista de sugerencias iniciales para mostrar en `home` cuando no
/// hay query ni reproduccion activa.
///
/// `keepAlive: true` para que la lista no se pida cada vez que el usuario
/// vuelva al estado `Suggested` despues de buscar o reproducir.

final class HomeSuggestionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeSuggestionsResult>,
          HomeSuggestionsResult,
          FutureOr<HomeSuggestionsResult>
        >
    with
        $FutureModifier<HomeSuggestionsResult>,
        $FutureProvider<HomeSuggestionsResult> {
  /// Carga la lista de sugerencias iniciales para mostrar en `home` cuando no
  /// hay query ni reproduccion activa.
  ///
  /// `keepAlive: true` para que la lista no se pida cada vez que el usuario
  /// vuelva al estado `Suggested` despues de buscar o reproducir.
  HomeSuggestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeSuggestionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeSuggestionsHash();

  @$internal
  @override
  $FutureProviderElement<HomeSuggestionsResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeSuggestionsResult> create(Ref ref) {
    return homeSuggestions(ref);
  }
}

String _$homeSuggestionsHash() => r'dd6b0dde3965c0d7dddee7f053ff10c063b2ada8';
