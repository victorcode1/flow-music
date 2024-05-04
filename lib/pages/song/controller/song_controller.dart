import 'package:flow_music/domain/sources.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final songController = ChangeNotifierProvider<SongController>((ref) {
  return SongController();
});

class SongController extends ChangeNotifier {
  setSource({required UrlSource source}) {}

  play({required UrlSource source}) {}
}
