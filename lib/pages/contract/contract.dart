import 'package:flutter/material.dart';

abstract interface class Contract {
  void load();
  void disposeLoad();
}

abstract interface class ContractData {
  Widget loadListSong(String? data);
}
