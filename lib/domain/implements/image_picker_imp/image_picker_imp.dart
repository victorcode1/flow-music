import 'package:flow_music/datasource/services/data_repo/image_picker_data_repo.dart';
import 'package:flow_music/datasource/services/image_picker/image_picker_service.dart';
import 'package:flow_music/domain/repository/image_picker_repo.dart';

class ImagePickerImp extends ImagePickerRepo {
  final ImagePickerDataRepo _dataService;
  ImagePickerImp({required ImagePickerService dataService})
      : _dataService = dataService;

  @override
  ImagePickerDataRepo get imagePicker => _dataService;
}
