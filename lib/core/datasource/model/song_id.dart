import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_id.freezed.dart';
part 'song_id.g.dart';

@freezed
abstract  class Model with _$Model {
  const factory Model({
    required Context context,
    required String videoId,
    required PlaybackContext playbackContext,
    required bool racyCheckOk,
    required bool contentCheckOk,
  }) = _Model;

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

@freezed
abstract  class Context with _$Context {
  const factory Context({
    required Client client,
    required ThirdParty thirdParty,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) => _$ContextFromJson(json);
}

@freezed
abstract  class Client with _$Client {
  const factory Client({
    required String hl,
    required String gl,
    required String clientName,
    required String clientVersion,
    required String clientScreen,
    required int androidSdkVersion,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
abstract  class ThirdParty with _$ThirdParty {
  const factory ThirdParty({
    required String embedUrl,
  }) = _ThirdParty;

  factory ThirdParty.fromJson(Map<String, dynamic> json) => _$ThirdPartyFromJson(json);
}

@freezed
abstract  class PlaybackContext with _$PlaybackContext {
  const factory PlaybackContext({
    required ContentPlaybackContext contentPlaybackContext,
  }) = _PlaybackContext;

  factory PlaybackContext.fromJson(Map<String, dynamic> json) => _$PlaybackContextFromJson(json);
}

@freezed
abstract  class ContentPlaybackContext with _$ContentPlaybackContext {
  const factory ContentPlaybackContext({
    required int signatureTimestamp,
  }) = _ContentPlaybackContext;

  factory ContentPlaybackContext.fromJson(Map<String, dynamic> json) => _$ContentPlaybackContextFromJson(json);
}