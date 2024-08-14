// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearModelRequestImpl _$$SearModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SearModelRequestImpl(
      context: json['context'] == null
          ? null
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      query: json['query'] as String?,
      params: json['params'] as String?,
    );

Map<String, dynamic> _$$SearModelRequestImplToJson(
        _$SearModelRequestImpl instance) =>
    <String, dynamic>{
      'context': instance.context,
      'query': instance.query,
      'params': instance.params,
    };

_$ContextImpl _$$ContextImplFromJson(Map<String, dynamic> json) =>
    _$ContextImpl(
      client: json['client'] == null
          ? null
          : ClientSearch.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContextImplToJson(_$ContextImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
    };

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
