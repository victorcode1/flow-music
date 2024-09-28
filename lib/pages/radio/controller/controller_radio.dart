import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/radio/interface/radio_interface.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final controllerRadio = ChangeNotifierProvider<ControllerRadio>((ref) {
  final implement = ref.read(mainController).implement;
  return ControllerRadio(ref: ref, implement: implement);
});

class ControllerRadio extends ChangeNotifier {
  RadioInterface? _io;
  final ChangeNotifierProviderRef<ControllerRadio> ref;
  final GenealRepo implement;
  String? _urlImage;
  File? _image;

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

  Future<void> guardarRadio({required BuildContext context}) async {
    if (nameRadioController.text.isNotEmpty &&
        urlRadioController.text.isNotEmpty) {
      if (_id == null) {
        String? urlImage;
        if (_image != null) {
          urlImage = await implement.storageRepository.dataStorage
              .saveImageRadio(_image!);
        }
        implement.dataRepository.data.saveRadio(
            nameRadioController.text, urlRadioController.text, urlImage ?? '');

        nameRadioController.clear();
        urlRadioController.clear();
        if (context.mounted) Navigator.of(context).pop();
        _image = null;
      } else {
        String? urlImage;
        if (_image != null) {
          urlImage = await implement.storageRepository.dataStorage
              .saveImageRadio(_image!);
        }

    

        implement.dataRepository.data.updateRadio(nameRadioController.text,
            urlRadioController.text, urlImage ?? _urlImage, _id!);

        nameRadioController.clear();
        urlRadioController.clear();
        if (context.mounted) Navigator.of(context).pop();
        _image = null;
      }
    }
  }

  String? _id;

  Future getImage() async {
    final pickedFile =
        await implement.imagePickerRepository.imagePicker.imageFile();

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();

      debugPrint('Image path: ${_image!.path}');
    } else {
      debugPrint('No se seleccionó ninguna imagen.');
    }
  }

  File? get image => _image;

  Stream<User?> get userSream => implement.userRepository.userStream;

  Stream<bool> isAdmin() {
    Stream<User?> user = implement.userRepository.user;

    return user.switchMap((user) {
      if (user == null) {
        return Stream.value(false);
      }
      return implement.dataRepository.data.isAdmin(user: user);
    });
  }

  void editarRadio({required Map<String, dynamic> data, required id}) {
    _io?.showFrom(data: data, id: id);
  }

  Future initFrom({Map<String, dynamic>? data, String? id}) async {
    debugPrint('---$id');
    _id = id;
    nameRadioController.text = data?['name'] ?? '';
    urlRadioController.text = data?['url'] ?? '';
    _urlImage = data?['urlImage'] ?? '';
    notifyListeners();
  }

  String? get urlImage => _urlImage;
  String? get id => _id;
}
