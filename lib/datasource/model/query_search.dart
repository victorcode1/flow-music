import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_search.freezed.dart';
part 'query_search.g.dart';

@freezed
class ClientModel with _$Client {
  factory ClientModel({
    String? clientName,
    String? clientVersion,
    String? platform,
    String? hl,
    String? visitorData,
  }) = _Client;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientFromJson(json);
}

@freezed
class ContextModel with _$ContextModel {
  factory ContextModel({
    ClientModel? client,
  }) = _Context;

  factory ContextModel.fromJson(Map<String, dynamic> json) =>
      _$ContextModelFromJson(json);
}

@freezed
class QuerySearch with _$QuerySearch {
  factory QuerySearch({
    ContextModel? context,
    String? input,
  }) = _QuerySearch;

  factory QuerySearch.fromJson(Map<String, dynamic> json) =>
      _$QuerySearchFromJson(json);
}
