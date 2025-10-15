class InfoModel {
  String version = "0.0.1";
  int buildNumber = 1;
  InfoModel({this.version = "0.0.1", this.buildNumber = 1});
  InfoModel copyWith({String? version, int? buildNumber}) {
    return InfoModel(
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
    );
  }
}
