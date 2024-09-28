import 'package:flow_music/datasource/services/data_repo/image_picker_data_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends ImagePickerDataRepo {
  late ImagePicker _imagePicker;

  static final ImagePickerService _instance = ImagePickerService._internal();
  ImagePickerService._internal() {
    _imagePicker = ImagePicker();
    debugPrint('ImagePickerService initialized ');
  }
  factory ImagePickerService() => _instance;

  @override
  Future<XFile?> imageFile() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }
}
