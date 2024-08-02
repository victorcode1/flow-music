// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      context: Context.fromJson(json['context'] as Map<String, dynamic>),
      videoId: json['videoId'] as String,
      playbackContext: PlaybackContext.fromJson(
          json['playbackContext'] as Map<String, dynamic>),
      racyCheckOk: json['racyCheckOk'] as bool,
      contentCheckOk: json['contentCheckOk'] as bool,
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) =>
    <String, dynamic>{
      'context': instance.context,
      'videoId': instance.videoId,
      'playbackContext': instance.playbackContext,
      'racyCheckOk': instance.racyCheckOk,
      'contentCheckOk': instance.contentCheckOk,
    };

_$ContextImpl _$$ContextImplFromJson(Map<String, dynamic> json) =>
    _$ContextImpl(
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      thirdParty:
          ThirdParty.fromJson(json['thirdParty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContextImplToJson(_$ContextImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
      'thirdParty': instance.thirdParty,
    };

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      hl: json['hl'] as String,
      gl: json['gl'] as String,
      clientName: json['clientName'] as String,
      clientVersion: json['clientVersion'] as String,
      clientScreen: json['clientScreen'] as String,
      androidSdkVersion: (json['androidSdkVersion'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'hl': instance.hl,
      'gl': instance.gl,
      'clientName': instance.clientName,
      'clientVersion': instance.clientVersion,
      'clientScreen': instance.clientScreen,
      'androidSdkVersion': instance.androidSdkVersion,
    };

_$ThirdPartyImpl _$$ThirdPartyImplFromJson(Map<String, dynamic> json) =>
    _$ThirdPartyImpl(
      embedUrl: json['embedUrl'] as String,
    );

Map<String, dynamic> _$$ThirdPartyImplToJson(_$ThirdPartyImpl instance) =>
    <String, dynamic>{
      'embedUrl': instance.embedUrl,
    };

_$PlaybackContextImpl _$$PlaybackContextImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaybackContextImpl(
      contentPlaybackContext: ContentPlaybackContext.fromJson(
          json['contentPlaybackContext'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaybackContextImplToJson(
        _$PlaybackContextImpl instance) =>
    <String, dynamic>{
      'contentPlaybackContext': instance.contentPlaybackContext,
    };

_$ContentPlaybackContextImpl _$$ContentPlaybackContextImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPlaybackContextImpl(
      signatureTimestamp: (json['signatureTimestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$ContentPlaybackContextImplToJson(
        _$ContentPlaybackContextImpl instance) =>
    <String, dynamic>{
      'signatureTimestamp': instance.signatureTimestamp,
    };
