import 'package:flutter/material.dart';

abstract interface class Contract {
  void load();
  void disposeLoad();
  void content({required Widget view});
}

abstract interface class ContractData {
  Widget loadListSong(String? data);
}
