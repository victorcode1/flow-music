// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearModelRequest _$SearModelRequestFromJson(Map<String, dynamic> json) {
  return _SearModelRequest.fromJson(json);
}

/// @nodoc
mixin _$SearModelRequest {
  ContextResultData? get context => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  String? get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearModelRequestCopyWith<SearModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearModelRequestCopyWith<$Res> {
  factory $SearModelRequestCopyWith(
          SearModelRequest value, $Res Function(SearModelRequest) then) =
      _$SearModelRequestCopyWithImpl<$Res, SearModelRequest>;
  @useResult
  $Res call({ContextResultData? context, String? query, String? params});

  $ContextCopyWith<$Res>? get context;
}

/// @nodoc
class _$SearModelRequestCopyWithImpl<$Res, $Val extends SearModelRequest>
    implements $SearModelRequestCopyWith<$Res> {
  _$SearModelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? query = freezed,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextResultData?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContextCopyWith<$Res>? get context {
    if (_value.context == null) {
      return null;
    }

    return $ContextCopyWith<$Res>(_value.context!, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearModelRequestImplCopyWith<$Res>
    implements $SearModelRequestCopyWith<$Res> {
  factory _$$SearModelRequestImplCopyWith(_$SearModelRequestImpl value,
          $Res Function(_$SearModelRequestImpl) then) =
      __$$SearModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContextResultData? context, String? query, String? params});

  @override
  $ContextCopyWith<$Res>? get context;
}

/// @nodoc
class __$$SearModelRequestImplCopyWithImpl<$Res>
    extends _$SearModelRequestCopyWithImpl<$Res, _$SearModelRequestImpl>
    implements _$$SearModelRequestImplCopyWith<$Res> {
  __$$SearModelRequestImplCopyWithImpl(_$SearModelRequestImpl _value,
      $Res Function(_$SearModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? query = freezed,
    Object? params = freezed,
  }) {
    return _then(_$SearModelRequestImpl(
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextResultData?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearModelRequestImpl implements _SearModelRequest {
  const _$SearModelRequestImpl({this.context, this.query, this.params});

  factory _$SearModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearModelRequestImplFromJson(json);

  @override
  final ContextResultData? context;
  @override
  final String? query;
  @override
  final String? params;

  @override
  String toString() {
    return 'SearModelRequest(context: $context, query: $query, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearModelRequestImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.params, params) || other.params == params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context, query, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearModelRequestImplCopyWith<_$SearModelRequestImpl> get copyWith =>
      __$$SearModelRequestImplCopyWithImpl<_$SearModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearModelRequestImplToJson(
      this,
    );
  }
}

abstract class _SearModelRequest implements SearModelRequest {
  const factory _SearModelRequest(
      {final ContextResultData? context,
      final String? query,
      final String? params}) = _$SearModelRequestImpl;

  factory _SearModelRequest.fromJson(Map<String, dynamic> json) =
      _$SearModelRequestImpl.fromJson;

  @override
  ContextResultData? get context;
  @override
  String? get query;
  @override
  String? get params;
  @override
  @JsonKey(ignore: true)
  _$$SearModelRequestImplCopyWith<_$SearModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContextResultData _$ContextFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$Context {
  ClientSearch? get client => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextCopyWith<ContextResultData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextCopyWith<$Res> {
  factory $ContextCopyWith(
          ContextResultData value, $Res Function(ContextResultData) then) =
      _$ContextCopyWithImpl<$Res, ContextResultData>;
  @useResult
  $Res call({ClientSearch? client});

  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class _$ContextCopyWithImpl<$Res, $Val extends ContextResultData>
    implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_value.copyWith(
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ClientSearch?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_value.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_value.client!, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContextImplCopyWith<$Res> implements $ContextCopyWith<$Res> {
  factory _$$ContextImplCopyWith(
          _$ContextImpl value, $Res Function(_$ContextImpl) then) =
      __$$ContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClientSearch? client});

  @override
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class __$$ContextImplCopyWithImpl<$Res>
    extends _$ContextCopyWithImpl<$Res, _$ContextImpl>
    implements _$$ContextImplCopyWith<$Res> {
  __$$ContextImplCopyWithImpl(
      _$ContextImpl _value, $Res Function(_$ContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_$ContextImpl(
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ClientSearch?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextImpl implements _Context {
  const _$ContextImpl({this.client});

  factory _$ContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextImplFromJson(json);

  @override
  final ClientSearch? client;

  @override
  String toString() {
    return 'Context(client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextImpl &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, client);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      __$$ContextImplCopyWithImpl<_$ContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextImplToJson(
      this,
    );
  }
}

abstract class _Context implements ContextResultData {
  const factory _Context({final ClientSearch? client}) = _$ContextImpl;

  factory _Context.fromJson(Map<String, dynamic> json) = _$ContextImpl.fromJson;

  @override
  ClientSearch? get client;
  @override
  @JsonKey(ignore: true)
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientSearch _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientVersion => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  String? get hl => throw _privateConstructorUsedError;
  String? get visitorData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCopyWith<ClientSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(
          ClientSearch value, $Res Function(ClientSearch) then) =
      _$ClientCopyWithImpl<$Res, ClientSearch>;
  @useResult
  $Res call(
      {String? clientName,
      String? clientVersion,
      String? platform,
      String? hl,
      String? visitorData});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends ClientSearch>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = freezed,
    Object? clientVersion = freezed,
    Object? platform = freezed,
    Object? hl = freezed,
    Object? visitorData = freezed,
  }) {
    return _then(_value.copyWith(
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVersion: freezed == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      hl: freezed == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorData: freezed == visitorData
          ? _value.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientImplCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$ClientImplCopyWith(
          _$ClientImpl value, $Res Function(_$ClientImpl) then) =
      __$$ClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clientName,
      String? clientVersion,
      String? platform,
      String? hl,
      String? visitorData});
}

/// @nodoc
class __$$ClientImplCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$ClientImpl>
    implements _$$ClientImplCopyWith<$Res> {
  __$$ClientImplCopyWithImpl(
      _$ClientImpl _value, $Res Function(_$ClientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = freezed,
    Object? clientVersion = freezed,
    Object? platform = freezed,
    Object? hl = freezed,
    Object? visitorData = freezed,
  }) {
    return _then(_$ClientImpl(
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVersion: freezed == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      hl: freezed == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorData: freezed == visitorData
          ? _value.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl(
      {this.clientName,
      this.clientVersion,
      this.platform,
      this.hl,
      this.visitorData});

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  final String? clientName;
  @override
  final String? clientVersion;
  @override
  final String? platform;
  @override
  final String? hl;
  @override
  final String? visitorData;

  @override
  String toString() {
    return 'Client(clientName: $clientName, clientVersion: $clientVersion, platform: $platform, hl: $hl, visitorData: $visitorData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientVersion, clientVersion) ||
                other.clientVersion == clientVersion) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.hl, hl) || other.hl == hl) &&
            (identical(other.visitorData, visitorData) ||
                other.visitorData == visitorData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, clientName, clientVersion, platform, hl, visitorData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      __$$ClientImplCopyWithImpl<_$ClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientImplToJson(
      this,
    );
  }
}

abstract class _Client implements ClientSearch {
  const factory _Client(
      {final String? clientName,
      final String? clientVersion,
      final String? platform,
      final String? hl,
      final String? visitorData}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  String? get clientName;
  @override
  String? get clientVersion;
  @override
  String? get platform;
  @override
  String? get hl;
  @override
  String? get visitorData;
  @override
  @JsonKey(ignore: true)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
