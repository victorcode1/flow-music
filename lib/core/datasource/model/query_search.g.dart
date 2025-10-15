// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  clientName: json['clientName'] as String?,
  clientVersion: json['clientVersion'] as String?,
  platform: json['platform'] as String?,
  hl: json['hl'] as String?,
  visitorData: json['visitorData'] as String?,
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'clientName': instance.clientName,
  'clientVersion': instance.clientVersion,
  'platform': instance.platform,
  'hl': instance.hl,
  'visitorData': instance.visitorData,
};

_Context _$ContextFromJson(Map<String, dynamic> json) => _Context(
  client: json['client'] == null
      ? null
      : Client.fromJson(json['client'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContextToJson(_Context instance) => <String, dynamic>{
  'client': instance.client,
};

_QuerySearch _$QuerySearchFromJson(Map<String, dynamic> json) => _QuerySearch(
  context: json['context'] == null
      ? null
      : ContextModel.fromJson(json['context'] as Map<String, dynamic>),
  input: json['input'] as String?,
);

Map<String, dynamic> _$QuerySearchToJson(_QuerySearch instance) =>
    <String, dynamic>{'context': instance.context, 'input': instance.input};
