import 'package:flow_music/features/home/presentation/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomePageController.navigateToTab', () {
    const controller = HomePageController();

    test('re-tapping the active tab clears what is on top of it', () {
      final searchController = TextEditingController(text: 'radio');
      String? clearedQuery;
      String? navigatedPath;

      controller.navigateToTab(
        currentPath: '/home',
        targetPath: '/home',
        searchController: searchController,
        setQuery: (query) => clearedQuery = query,
        navigateTo: (path) => navigatedPath = path,
      );

      // Sin navegar (ya estamos ahi), pero devolviendo /home a sus sugerencias:
      // es la salida de una busqueda de categoria abierta dentro de la pestana.
      expect(searchController.text, isEmpty);
      expect(clearedQuery, '');
      expect(navigatedPath, isNull);
    });

    test('clears search and navigates when switching tabs', () {
      final searchController = TextEditingController(text: 'radio');
      String? clearedQuery;
      String? navigatedPath;

      controller.navigateToTab(
        currentPath: '/home',
        targetPath: '/library',
        searchController: searchController,
        setQuery: (query) => clearedQuery = query,
        navigateTo: (path) => navigatedPath = path,
      );

      expect(searchController.text, isEmpty);
      expect(clearedQuery, '');
      expect(navigatedPath, '/library');
    });
  });
}
