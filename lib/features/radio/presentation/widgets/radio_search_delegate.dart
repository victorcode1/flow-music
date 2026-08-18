import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';
import 'package:flow_music/features/radio/presentation/utils/play_radio_station.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Buscador que se abre estando en Radio o en el mapa: busca emisoras, no
/// canciones de YouTube. Es la misma fuente (Radio Browser) que alimenta la
/// pantalla de radio, asi que lo que sale aqui es lo que se puede reproducir
/// desde ahi.
class RadioSearchDelegate extends SearchDelegate<void> {
  RadioSearchDelegate()
    : super(
        searchFieldLabel: LocaleKeys.search_radio.tr(),
        searchFieldStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: colors.onSurface, size: 24),
        titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
          color: colors.onSurfaceVariant,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: colors.onSurfaceVariant,
          fontWeight: FontWeight.w400,
        ),
      ),
      scaffoldBackgroundColor: colors.surface,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded),
          tooltip: LocaleKeys.clear.tr(),
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded),
      tooltip: LocaleKeys.back.tr(),
    );
  }

  /// Resultados y sugerencias son la misma lista: escribir ya filtra emisoras.
  @override
  Widget buildResults(BuildContext context) => _results(context);

  @override
  Widget buildSuggestions(BuildContext context) => _results(context);

  Widget _results(BuildContext context) {
    return _RadioSearchResults(
      query: query,
      onSelected: () => close(context, null),
    );
  }
}

class _RadioSearchResults extends ConsumerStatefulWidget {
  const _RadioSearchResults({required this.query, required this.onSelected});

  final String query;
  final VoidCallback onSelected;

  @override
  ConsumerState<_RadioSearchResults> createState() =>
      _RadioSearchResultsState();
}

class _RadioSearchResultsState extends ConsumerState<_RadioSearchResults> {
  final RadioBrowserRepository _repository = RadioBrowserRepository();

  Timer? _debounce;
  Future<List<RadioStation>>? _stations;

  @override
  void initState() {
    super.initState();
    _load(widget.query);
  }

  @override
  void didUpdateWidget(covariant _RadioSearchResults oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query == oldWidget.query) return;
    // Cada tecla no dispara una peticion: se espera a que el usuario pare.
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => _load(widget.query),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _load(String query) {
    if (!mounted) return;
    final trimmed = query.trim();
    setState(() {
      _stations = trimmed.isEmpty
          ? _repository.topStations()
          : _repository.searchStations(name: trimmed);
    });
  }

  Future<void> _play(List<RadioStation> stations, int index) async {
    widget.onSelected();
    await playRadioStation(
      context: context,
      ref: ref,
      station: stations[index],
      queue: stations,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<List<RadioStation>>(
      future: _stations,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            ),
          );
        }

        if (snapshot.hasError) {
          return _message(theme, LocaleKeys.error.tr());
        }

        final stations = (snapshot.data ?? const <RadioStation>[])
            .where((station) => station.isPlayable)
            .toList(growable: false);
        if (stations.isEmpty) {
          return _message(theme, LocaleKeys.no_results.tr());
        }

        return ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            final station = stations[index];
            return ListTile(
              leading: Icon(
                Icons.radio_rounded,
                color: theme.colorScheme.primary,
              ),
              title: Text(
                station.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                _stationDetails(station),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _play(stations, index),
            );
          },
        );
      },
    );
  }

  String _stationDetails(RadioStation station) {
    return [
      if (station.country.isNotEmpty) station.country,
      if (station.codec.isNotEmpty) station.codec,
      if (station.bitrate > 0) '${station.bitrate} kbps',
    ].join(' · ');
  }

  Widget _message(ThemeData theme, String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
