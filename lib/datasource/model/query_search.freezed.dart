// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Client _$ClientFromJson(Map<String, dynamic> json) {
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
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call(
      {String? clientName,
      String? clientVersion,
      String? platform,
      String? hl,
      String? visitorData});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
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
  _$ClientImpl(
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

abstract class _Client implements Client {
  factory _Client(
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

ContextModel _$ContextModelFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$ContextModel {
  Client? get client => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextModelCopyWith<ContextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextModelCopyWith<$Res> {
  factory $ContextModelCopyWith(
          ContextModel value, $Res Function(ContextModel) then) =
      _$ContextModelCopyWithImpl<$Res, ContextModel>;
  @useResult
  $Res call({Client? client});

  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class _$ContextModelCopyWithImpl<$Res, $Val extends ContextModel>
    implements $ContextModelCopyWith<$Res> {
  _$ContextModelCopyWithImpl(this._value, this._then);

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
              as Client?,
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
abstract class _$$ContextImplCopyWith<$Res>
    implements $ContextModelCopyWith<$Res> {
  factory _$$ContextImplCopyWith(
          _$ContextImpl value, $Res Function(_$ContextImpl) then) =
      __$$ContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Client? client});

  @override
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class __$$ContextImplCopyWithImpl<$Res>
    extends _$ContextModelCopyWithImpl<$Res, _$ContextImpl>
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
              as Client?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextImpl implements _Context {
  _$ContextImpl({this.client});

  factory _$ContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextImplFromJson(json);

  @override
  final Client? client;

  @override
  String toString() {
    return 'ContextModel(client: $client)';
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

abstract class _Context implements ContextModel {
  factory _Context({final Client? client}) = _$ContextImpl;

  factory _Context.fromJson(Map<String, dynamic> json) = _$ContextImpl.fromJson;

  @override
  Client? get client;
  @override
  @JsonKey(ignore: true)
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuerySearch _$QuerySearchFromJson(Map<String, dynamic> json) {
  return _QuerySearch.fromJson(json);
}

/// @nodoc
mixin _$QuerySearch {
  ContextModel? get context => throw _privateConstructorUsedError;
  String? get input => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuerySearchCopyWith<QuerySearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuerySearchCopyWith<$Res> {
  factory $QuerySearchCopyWith(
          QuerySearch value, $Res Function(QuerySearch) then) =
      _$QuerySearchCopyWithImpl<$Res, QuerySearch>;
  @useResult
  $Res call({ContextModel? context, String? input});

  $ContextModelCopyWith<$Res>? get context;
}

/// @nodoc
class _$QuerySearchCopyWithImpl<$Res, $Val extends QuerySearch>
    implements $QuerySearchCopyWith<$Res> {
  _$QuerySearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? input = freezed,
  }) {
    return _then(_value.copyWith(
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<$Res>? get context {
    if (_value.context == null) {
      return null;
    }

    return $ContextModelCopyWith<$Res>(_value.context!, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuerySearchImplCopyWith<$Res>
    implements $QuerySearchCopyWith<$Res> {
  factory _$$QuerySearchImplCopyWith(
          _$QuerySearchImpl value, $Res Function(_$QuerySearchImpl) then) =
      __$$QuerySearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContextModel? context, String? input});

  @override
  $ContextModelCopyWith<$Res>? get context;
}

/// @nodoc
class __$$QuerySearchImplCopyWithImpl<$Res>
    extends _$QuerySearchCopyWithImpl<$Res, _$QuerySearchImpl>
    implements _$$QuerySearchImplCopyWith<$Res> {
  __$$QuerySearchImplCopyWithImpl(
      _$QuerySearchImpl _value, $Res Function(_$QuerySearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? input = freezed,
  }) {
    return _then(_$QuerySearchImpl(
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuerySearchImpl implements _QuerySearch {
  _$QuerySearchImpl({this.context, this.input});

  factory _$QuerySearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuerySearchImplFromJson(json);

  @override
  final ContextModel? context;
  @override
  final String? input;

  @override
  String toString() {
    return 'QuerySearch(context: $context, input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuerySearchImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.input, input) || other.input == input));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context, input);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuerySearchImplCopyWith<_$QuerySearchImpl> get copyWith =>
      __$$QuerySearchImplCopyWithImpl<_$QuerySearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuerySearchImplToJson(
      this,
    );
  }
}

abstract class _QuerySearch implements QuerySearch {
  factory _QuerySearch({final ContextModel? context, final String? input}) =
      _$QuerySearchImpl;

  factory _QuerySearch.fromJson(Map<String, dynamic> json) =
      _$QuerySearchImpl.fromJson;

  @override
  ContextModel? get context;
  @override
  String? get input;
  @override
  @JsonKey(ignore: true)
  _$$QuerySearchImplCopyWith<_$QuerySearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
