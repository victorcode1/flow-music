import 'package:flutter/material.dart';

abstract interface class HomeViewInterFace {
  void load();
  void disposeLoad();
  Widget songPlay({required Map<String, String> data});
}

abstract interface class ContractData {
  Widget loadListSong(String? data);
}
