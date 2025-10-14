// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) =>
    _SearchResult(
      responseContext: json['responseContext'] == null
          ? null
          : ResponseContext.fromJson(
              json['responseContext'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => SearchResultContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) =>
    <String, dynamic>{
      'responseContext': instance.responseContext,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
    };

_SearchResultContent _$SearchResultContentFromJson(Map<String, dynamic> json) =>
    _SearchResultContent(
      searchSuggestionsSectionRenderer:
          json['searchSuggestionsSectionRenderer'] == null
              ? null
              : SearchSuggestionsSectionRenderer.fromJson(
                  json['searchSuggestionsSectionRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultContentToJson(
        _SearchResultContent instance) =>
    <String, dynamic>{
      'searchSuggestionsSectionRenderer':
          instance.searchSuggestionsSectionRenderer,
    };

_SearchSuggestionsSectionRenderer _$SearchSuggestionsSectionRendererFromJson(
        Map<String, dynamic> json) =>
    _SearchSuggestionsSectionRenderer(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => SearchSuggestionsSectionRendererContent.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchSuggestionsSectionRendererToJson(
        _SearchSuggestionsSectionRenderer instance) =>
    <String, dynamic>{
      'contents': instance.contents,
    };

_SearchSuggestionsSectionRendererContent
    _$SearchSuggestionsSectionRendererContentFromJson(
            Map<String, dynamic> json) =>
        _SearchSuggestionsSectionRendererContent(
          searchSuggestionRenderer: json['searchSuggestionRenderer'] == null
              ? null
              : SearchSuggestionRenderer.fromJson(
                  json['searchSuggestionRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SearchSuggestionsSectionRendererContentToJson(
        _SearchSuggestionsSectionRendererContent instance) =>
    <String, dynamic>{
      'searchSuggestionRenderer': instance.searchSuggestionRenderer,
    };

_SearchSuggestionRenderer _$SearchSuggestionRendererFromJson(
        Map<String, dynamic> json) =>
    _SearchSuggestionRenderer(
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

Map<String, dynamic> _$SearchSuggestionRendererToJson(
        _SearchSuggestionRenderer instance) =>
    <String, dynamic>{
      'suggestion': instance.suggestion,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
      'icon': instance.icon,
    };

_Suggestion _$SuggestionFromJson(Map<String, dynamic> json) => _Suggestion(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => Run.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestionToJson(_Suggestion instance) =>
    <String, dynamic>{
      'runs': instance.runs,
    };

_Run _$RunFromJson(Map<String, dynamic> json) => _Run(
      text: json['text'] as String?,
      bold: json['bold'] as bool?,
    );

Map<String, dynamic> _$RunToJson(_Run instance) => <String, dynamic>{
      'text': instance.text,
      'bold': instance.bold,
    };

_NavigationEndpoint _$NavigationEndpointFromJson(Map<String, dynamic> json) =>
    _NavigationEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      searchEndpoint: json['searchEndpoint'] == null
          ? null
          : SearchEndpoint.fromJson(
              json['searchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NavigationEndpointToJson(_NavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'searchEndpoint': instance.searchEndpoint,
    };

_SearchEndpoint _$SearchEndpointFromJson(Map<String, dynamic> json) =>
    _SearchEndpoint(
      query: json['query'] as String?,
    );

Map<String, dynamic> _$SearchEndpointToJson(_SearchEndpoint instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

_Iconn _$IconnFromJson(Map<String, dynamic> json) => _Iconn(
      iconType: json['iconType'] as String?,
    );

Map<String, dynamic> _$IconnToJson(_Iconn instance) => <String, dynamic>{
      'iconType': instance.iconType,
    };

_ResponseContext _$ResponseContextFromJson(Map<String, dynamic> json) =>
    _ResponseContext(
      visitorData: json['visitorData'] as String?,
      serviceTrackingParams: (json['serviceTrackingParams'] as List<dynamic>?)
          ?.map((e) => ServiceTrackingParam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseContextToJson(_ResponseContext instance) =>
    <String, dynamic>{
      'visitorData': instance.visitorData,
      'serviceTrackingParams': instance.serviceTrackingParams,
    };

_ServiceTrackingParam _$ServiceTrackingParamFromJson(
        Map<String, dynamic> json) =>
    _ServiceTrackingParam(
      service: json['service'] as String?,
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceTrackingParamToJson(
        _ServiceTrackingParam instance) =>
    <String, dynamic>{
      'service': instance.service,
      'params': instance.params,
    };

_Param _$ParamFromJson(Map<String, dynamic> json) => _Param(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ParamToJson(_Param instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
