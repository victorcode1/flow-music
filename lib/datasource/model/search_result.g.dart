// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      responseContext: json['responseContext'] == null
          ? null
          : ResponseContext.fromJson(
              json['responseContext'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => SearchResultContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'responseContext': instance.responseContext,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
    };

_$SearchResultContentImpl _$$SearchResultContentImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchResultContentImpl(
      searchSuggestionsSectionRenderer:
          json['searchSuggestionsSectionRenderer'] == null
              ? null
              : SearchSuggestionsSectionRenderer.fromJson(
                  json['searchSuggestionsSectionRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchResultContentImplToJson(
        _$SearchResultContentImpl instance) =>
    <String, dynamic>{
      'searchSuggestionsSectionRenderer':
          instance.searchSuggestionsSectionRenderer,
    };

_$SearchSuggestionsSectionRendererImpl
    _$$SearchSuggestionsSectionRendererImplFromJson(
            Map<String, dynamic> json) =>
        _$SearchSuggestionsSectionRendererImpl(
          contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => SearchSuggestionsSectionRendererContent.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$SearchSuggestionsSectionRendererImplToJson(
        _$SearchSuggestionsSectionRendererImpl instance) =>
    <String, dynamic>{
      'contents': instance.contents,
    };

_$SearchSuggestionsSectionRendererContentImpl
    _$$SearchSuggestionsSectionRendererContentImplFromJson(
            Map<String, dynamic> json) =>
        _$SearchSuggestionsSectionRendererContentImpl(
          searchSuggestionRenderer: json['searchSuggestionRenderer'] == null
              ? null
              : SearchSuggestionRenderer.fromJson(
                  json['searchSuggestionRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SearchSuggestionsSectionRendererContentImplToJson(
        _$SearchSuggestionsSectionRendererContentImpl instance) =>
    <String, dynamic>{
      'searchSuggestionRenderer': instance.searchSuggestionRenderer,
    };

_$SearchSuggestionRendererImpl _$$SearchSuggestionRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchSuggestionRendererImpl(
      suggestion: json['suggestion'] == null
          ? null
          : Suggestion.fromJson(json['suggestion'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
      icon: json['icon'] == null
          ? null
          : Iconn.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchSuggestionRendererImplToJson(
        _$SearchSuggestionRendererImpl instance) =>
    <String, dynamic>{
      'suggestion': instance.suggestion,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
      'icon': instance.icon,
    };

_$SuggestionImpl _$$SuggestionImplFromJson(Map<String, dynamic> json) =>
    _$SuggestionImpl(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => Run.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SuggestionImplToJson(_$SuggestionImpl instance) =>
    <String, dynamic>{
      'runs': instance.runs,
    };

_$RunImpl _$$RunImplFromJson(Map<String, dynamic> json) => _$RunImpl(
      text: json['text'] as String?,
      bold: json['bold'] as bool?,
    );

Map<String, dynamic> _$$RunImplToJson(_$RunImpl instance) => <String, dynamic>{
      'text': instance.text,
      'bold': instance.bold,
    };

_$NavigationEndpointImpl _$$NavigationEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$NavigationEndpointImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      searchEndpoint: json['searchEndpoint'] == null
          ? null
          : SearchEndpoint.fromJson(
              json['searchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NavigationEndpointImplToJson(
        _$NavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'searchEndpoint': instance.searchEndpoint,
    };

_$SearchEndpointImpl _$$SearchEndpointImplFromJson(Map<String, dynamic> json) =>
    _$SearchEndpointImpl(
      query: json['query'] as String?,
    );

Map<String, dynamic> _$$SearchEndpointImplToJson(
        _$SearchEndpointImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

_$IconnImpl _$$IconnImplFromJson(Map<String, dynamic> json) => _$IconnImpl(
      iconType: json['iconType'] as String?,
    );

Map<String, dynamic> _$$IconnImplToJson(_$IconnImpl instance) =>
    <String, dynamic>{
      'iconType': instance.iconType,
    };

_$ResponseContextImpl _$$ResponseContextImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseContextImpl(
      visitorData: json['visitorData'] as String?,
      serviceTrackingParams: (json['serviceTrackingParams'] as List<dynamic>?)
          ?.map((e) => ServiceTrackingParam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseContextImplToJson(
        _$ResponseContextImpl instance) =>
    <String, dynamic>{
      'visitorData': instance.visitorData,
      'serviceTrackingParams': instance.serviceTrackingParams,
    };

_$ServiceTrackingParamImpl _$$ServiceTrackingParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceTrackingParamImpl(
      service: json['service'] as String?,
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceTrackingParamImplToJson(
        _$ServiceTrackingParamImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'params': instance.params,
    };

_$ParamImpl _$$ParamImplFromJson(Map<String, dynamic> json) => _$ParamImpl(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$ParamImplToJson(_$ParamImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
