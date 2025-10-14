import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_search.freezed.dart';
part 'query_search.g.dart';

@freezed
abstract class Client with _$Client {
  factory Client({
    String? clientName,
    String? clientVersion,
    String? platform,
    String? hl,
    String? visitorData,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
abstract class ContextModel with _$ContextModel {
  factory ContextModel({
    Client? client,
  }) = _Context;

  factory ContextModel.fromJson(Map<String, dynamic> json) =>
      _$ContextModelFromJson(json);
}

@freezed
abstract class QuerySearch with _$QuerySearch {
  factory QuerySearch({
    ContextModel? context,
    String? input,
  }) = _QuerySearch;

  factory QuerySearch.fromJson(Map<String, dynamic> json) =>
      _$QuerySearchFromJson(json);
}
