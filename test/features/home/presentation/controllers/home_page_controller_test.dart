import 'package:flow_music/features/home/presentation/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomePageController.navigateToTab', () {
    const controller = HomePageController();

    test('does nothing when the tab is already selected', () {
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

      expect(searchController.text, 'radio');
      expect(clearedQuery, isNull);
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
