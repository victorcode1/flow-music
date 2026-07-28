import 'package:flow_music/features/home/data/location_service.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';

class HomeRadioSuggestions {
  const HomeRadioSuggestions({
    required this.stations,
    this.countryName,
    required this.usesFallback,
  });

  final List<RadioStation> stations;
  final String? countryName;
  final bool usesFallback;
}

/// Construye la portada con emisoras. La ubicación solo se consulta una vez
/// para escoger un país; no se persiste ni se transmite fuera del dispositivo.
class HomeSuggestionsRepository {
  HomeSuggestionsRepository({
    RadioBrowserRepository? radioRepository,
    LocationService? locationService,
  }) : _radioRepository = radioRepository ?? RadioBrowserRepository(),
       _locationService = locationService ?? const LocationService();

  final RadioBrowserRepository _radioRepository;
  final LocationService _locationService;

  Future<HomeRadioSuggestions> load() async {
    final country = await _locationService.resolveCountry();
    if (country.isResolved) {
      final localStations = await _radioRepository.searchStations(
        countryCode: country.countryCode!,
        limit: 12,
      );
      if (localStations.isNotEmpty) {
        return HomeRadioSuggestions(
          stations: localStations,
          countryName: country.countryName,
          usesFallback: false,
        );
      }
    }

    return HomeRadioSuggestions(
      stations: await _radioRepository.topStations(limit: 12),
      usesFallback: true,
    );
  }
}
