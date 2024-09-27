import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/radio/interface/radio_interface.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final controllerRadio =
    ChangeNotifierProvider.autoDispose<ControllerRadio>((ref) {
  final implement = ref.read(mainController).implement;
  return ControllerRadio(ref: ref, implement: implement);
});

class ControllerRadio extends ChangeNotifier {
  RadioInterface? _io;
  final AutoDisposeChangeNotifierProviderRef<ControllerRadio> ref;
  final GenealRepo implement;

  final nameRadioController = TextEditingController();

  final urlRadioController = TextEditingController();
  ControllerRadio({required this.implement, required this.ref});

  Stream<QuerySnapshot<Map<String, dynamic>>> get listRadio =>
      implement.dataRepository.data.listRadio;

  void crearRadio() {
    _io?.showFrom();
  }

  buid({required RadioInterface io}) {
    _io = io;
  }

  void guardarRadio({required BuildContext context}) {
    if (nameRadioController.text.isNotEmpty &&
        urlRadioController.text.isNotEmpty) {
      implement.dataRepository.data
          .saveRadio(nameRadioController.text, urlRadioController.text);
      nameRadioController.clear();
      urlRadioController.clear();
      Navigator.of(context).pop();
    }
  }
}
