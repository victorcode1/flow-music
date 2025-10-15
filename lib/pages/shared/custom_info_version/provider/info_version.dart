import 'package:flow_music/pages/shared/custom_info_version/model/info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_version.g.dart';

@riverpod
class InfoVersion extends _$InfoVersion {
  @override
  InfoModel build() {
    return InfoModel();
  }
}
