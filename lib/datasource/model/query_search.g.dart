// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      clientName: json['clientName'] as String?,
      clientVersion: json['clientVersion'] as String?,
      platform: json['platform'] as String?,
      hl: json['hl'] as String?,
      visitorData: json['visitorData'] as String?,
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'clientVersion': instance.clientVersion,
      'platform': instance.platform,
      'hl': instance.hl,
      'visitorData': instance.visitorData,
    };

_$ContextImpl _$$ContextImplFromJson(Map<String, dynamic> json) =>
    _$ContextImpl(
      client: json['client'] == null
          ? null
          : ClientModel.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContextImplToJson(_$ContextImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
    };

_$QuerySearchImpl _$$QuerySearchImplFromJson(Map<String, dynamic> json) =>
    _$QuerySearchImpl(
      context: json['context'] == null
          ? null
          : ContextModel.fromJson(json['context'] as Map<String, dynamic>),
      input: json['input'] as String?,
    );

Map<String, dynamic> _$$QuerySearchImplToJson(_$QuerySearchImpl instance) =>
    <String, dynamic>{
      'context': instance.context,
      'input': instance.input,
    };
