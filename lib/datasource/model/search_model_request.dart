import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model_request.freezed.dart';
part 'search_model_request.g.dart';

@freezed
abstract class SearModelRequest with _$SearModelRequest {
  const factory SearModelRequest({
    Context? context,
    String? query,
    String? params,
  }) = _SearModelRequest;

  factory SearModelRequest.fromJson(Map<String, dynamic> json) =>
      _$SearModelRequestFromJson(json);
}

@freezed
abstract class Context with _$Context {
  const factory Context({
    ClientSearch? client,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}

@freezed
abstract class ClientSearch with _$Client {
  const factory ClientSearch({
    String? clientName,
    String? clientVersion,
    String? platform,
    String? hl,
    String? visitorData,
  }) = _Client;

  factory ClientSearch.fromJson(Map<String, dynamic> json) =>
      _$ClientFromJson(json);
}
