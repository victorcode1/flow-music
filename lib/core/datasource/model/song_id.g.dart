// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
  context: Context.fromJson(json['context'] as Map<String, dynamic>),
  videoId: json['videoId'] as String,
  playbackContext: PlaybackContext.fromJson(
    json['playbackContext'] as Map<String, dynamic>,
  ),
  racyCheckOk: json['racyCheckOk'] as bool,
  contentCheckOk: json['contentCheckOk'] as bool,
);

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
  'context': instance.context,
  'videoId': instance.videoId,
  'playbackContext': instance.playbackContext,
  'racyCheckOk': instance.racyCheckOk,
  'contentCheckOk': instance.contentCheckOk,
};

_Context _$ContextFromJson(Map<String, dynamic> json) => _Context(
  client: Client.fromJson(json['client'] as Map<String, dynamic>),
  thirdParty: ThirdParty.fromJson(json['thirdParty'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContextToJson(_Context instance) => <String, dynamic>{
  'client': instance.client,
  'thirdParty': instance.thirdParty,
};

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  hl: json['hl'] as String,
  gl: json['gl'] as String,
  clientName: json['clientName'] as String,
  clientVersion: json['clientVersion'] as String,
  clientScreen: json['clientScreen'] as String,
  androidSdkVersion: (json['androidSdkVersion'] as num).toInt(),
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'hl': instance.hl,
  'gl': instance.gl,
  'clientName': instance.clientName,
  'clientVersion': instance.clientVersion,
  'clientScreen': instance.clientScreen,
  'androidSdkVersion': instance.androidSdkVersion,
};

_ThirdParty _$ThirdPartyFromJson(Map<String, dynamic> json) =>
    _ThirdParty(embedUrl: json['embedUrl'] as String);

Map<String, dynamic> _$ThirdPartyToJson(_ThirdParty instance) =>
    <String, dynamic>{'embedUrl': instance.embedUrl};

_PlaybackContext _$PlaybackContextFromJson(Map<String, dynamic> json) =>
    _PlaybackContext(
      contentPlaybackContext: ContentPlaybackContext.fromJson(
        json['contentPlaybackContext'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PlaybackContextToJson(_PlaybackContext instance) =>
    <String, dynamic>{
      'contentPlaybackContext': instance.contentPlaybackContext,
    };

_ContentPlaybackContext _$ContentPlaybackContextFromJson(
  Map<String, dynamic> json,
) => _ContentPlaybackContext(
  signatureTimestamp: (json['signatureTimestamp'] as num).toInt(),
);

Map<String, dynamic> _$ContentPlaybackContextToJson(
  _ContentPlaybackContext instance,
) => <String, dynamic>{'signatureTimestamp': instance.signatureTimestamp};
