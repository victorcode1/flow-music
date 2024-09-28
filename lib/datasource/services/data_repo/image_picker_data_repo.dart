import 'package:image_picker/image_picker.dart';

abstract class ImagePickerDataRepo {
  Future<XFile?>  imageFile();
}
