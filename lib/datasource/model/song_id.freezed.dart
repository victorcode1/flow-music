// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Model _$ModelFromJson(Map<String, dynamic> json) {
  return _Model.fromJson(json);
}

/// @nodoc
mixin _$Model {
  Context get context => throw _privateConstructorUsedError;
  String get videoId => throw _privateConstructorUsedError;
  PlaybackContext get playbackContext => throw _privateConstructorUsedError;
  bool get racyCheckOk => throw _privateConstructorUsedError;
  bool get contentCheckOk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelCopyWith<Model> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res, Model>;
  @useResult
  $Res call(
      {Context context,
      String videoId,
      PlaybackContext playbackContext,
      bool racyCheckOk,
      bool contentCheckOk});

  $ContextCopyWith<$Res> get context;
  $PlaybackContextCopyWith<$Res> get playbackContext;
}

/// @nodoc
class _$ModelCopyWithImpl<$Res, $Val extends Model>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? videoId = null,
    Object? playbackContext = null,
    Object? racyCheckOk = null,
    Object? contentCheckOk = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Context,
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playbackContext: null == playbackContext
          ? _value.playbackContext
          : playbackContext // ignore: cast_nullable_to_non_nullable
              as PlaybackContext,
      racyCheckOk: null == racyCheckOk
          ? _value.racyCheckOk
          : racyCheckOk // ignore: cast_nullable_to_non_nullable
              as bool,
      contentCheckOk: null == contentCheckOk
          ? _value.contentCheckOk
          : contentCheckOk // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContextCopyWith<$Res> get context {
    return $ContextCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaybackContextCopyWith<$Res> get playbackContext {
    return $PlaybackContextCopyWith<$Res>(_value.playbackContext, (value) {
      return _then(_value.copyWith(playbackContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModelImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$ModelImplCopyWith(
          _$ModelImpl value, $Res Function(_$ModelImpl) then) =
      __$$ModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Context context,
      String videoId,
      PlaybackContext playbackContext,
      bool racyCheckOk,
      bool contentCheckOk});

  @override
  $ContextCopyWith<$Res> get context;
  @override
  $PlaybackContextCopyWith<$Res> get playbackContext;
}

/// @nodoc
class __$$ModelImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ModelImpl>
    implements _$$ModelImplCopyWith<$Res> {
  __$$ModelImplCopyWithImpl(
      _$ModelImpl _value, $Res Function(_$ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? videoId = null,
    Object? playbackContext = null,
    Object? racyCheckOk = null,
    Object? contentCheckOk = null,
  }) {
    return _then(_$ModelImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Context,
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playbackContext: null == playbackContext
          ? _value.playbackContext
          : playbackContext // ignore: cast_nullable_to_non_nullable
              as PlaybackContext,
      racyCheckOk: null == racyCheckOk
          ? _value.racyCheckOk
          : racyCheckOk // ignore: cast_nullable_to_non_nullable
              as bool,
      contentCheckOk: null == contentCheckOk
          ? _value.contentCheckOk
          : contentCheckOk // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelImpl implements _Model {
  const _$ModelImpl(
      {required this.context,
      required this.videoId,
      required this.playbackContext,
      required this.racyCheckOk,
      required this.contentCheckOk});

  factory _$ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelImplFromJson(json);

  @override
  final Context context;
  @override
  final String videoId;
  @override
  final PlaybackContext playbackContext;
  @override
  final bool racyCheckOk;
  @override
  final bool contentCheckOk;

  @override
  String toString() {
    return 'Model(context: $context, videoId: $videoId, playbackContext: $playbackContext, racyCheckOk: $racyCheckOk, contentCheckOk: $contentCheckOk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.playbackContext, playbackContext) ||
                other.playbackContext == playbackContext) &&
            (identical(other.racyCheckOk, racyCheckOk) ||
                other.racyCheckOk == racyCheckOk) &&
            (identical(other.contentCheckOk, contentCheckOk) ||
                other.contentCheckOk == contentCheckOk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context, videoId,
      playbackContext, racyCheckOk, contentCheckOk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      __$$ModelImplCopyWithImpl<_$ModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelImplToJson(
      this,
    );
  }
}

abstract class _Model implements Model {
  const factory _Model(
      {required final Context context,
      required final String videoId,
      required final PlaybackContext playbackContext,
      required final bool racyCheckOk,
      required final bool contentCheckOk}) = _$ModelImpl;

  factory _Model.fromJson(Map<String, dynamic> json) = _$ModelImpl.fromJson;

  @override
  Context get context;
  @override
  String get videoId;
  @override
  PlaybackContext get playbackContext;
  @override
  bool get racyCheckOk;
  @override
  bool get contentCheckOk;
  @override
  @JsonKey(ignore: true)
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Context _$ContextFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$Context {
  Client get client => throw _privateConstructorUsedError;
  ThirdParty get thirdParty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextCopyWith<Context> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextCopyWith<$Res> {
  factory $ContextCopyWith(Context value, $Res Function(Context) then) =
      _$ContextCopyWithImpl<$Res, Context>;
  @useResult
  $Res call({Client client, ThirdParty thirdParty});

  $ClientCopyWith<$Res> get client;
  $ThirdPartyCopyWith<$Res> get thirdParty;
}

/// @nodoc
class _$ContextCopyWithImpl<$Res, $Val extends Context>
    implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? thirdParty = null,
  }) {
    return _then(_value.copyWith(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      thirdParty: null == thirdParty
          ? _value.thirdParty
          : thirdParty // ignore: cast_nullable_to_non_nullable
              as ThirdParty,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res> get client {
    return $ClientCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThirdPartyCopyWith<$Res> get thirdParty {
    return $ThirdPartyCopyWith<$Res>(_value.thirdParty, (value) {
      return _then(_value.copyWith(thirdParty: value) as $Val);
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
  $Res call({Client client, ThirdParty thirdParty});

  @override
  $ClientCopyWith<$Res> get client;
  @override
  $ThirdPartyCopyWith<$Res> get thirdParty;
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
    Object? client = null,
    Object? thirdParty = null,
  }) {
    return _then(_$ContextImpl(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      thirdParty: null == thirdParty
          ? _value.thirdParty
          : thirdParty // ignore: cast_nullable_to_non_nullable
              as ThirdParty,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextImpl implements _Context {
  const _$ContextImpl({required this.client, required this.thirdParty});

  factory _$ContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextImplFromJson(json);

  @override
  final Client client;
  @override
  final ThirdParty thirdParty;

  @override
  String toString() {
    return 'Context(client: $client, thirdParty: $thirdParty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextImpl &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.thirdParty, thirdParty) ||
                other.thirdParty == thirdParty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, client, thirdParty);

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

abstract class _Context implements Context {
  const factory _Context(
      {required final Client client,
      required final ThirdParty thirdParty}) = _$ContextImpl;

  factory _Context.fromJson(Map<String, dynamic> json) = _$ContextImpl.fromJson;

  @override
  Client get client;
  @override
  ThirdParty get thirdParty;
  @override
  @JsonKey(ignore: true)
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  String get hl => throw _privateConstructorUsedError;
  String get gl => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientVersion => throw _privateConstructorUsedError;
  String get clientScreen => throw _privateConstructorUsedError;
  int get androidSdkVersion => throw _privateConstructorUsedError;

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
      {String hl,
      String gl,
      String clientName,
      String clientVersion,
      String clientScreen,
      int androidSdkVersion});
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
    Object? hl = null,
    Object? gl = null,
    Object? clientName = null,
    Object? clientVersion = null,
    Object? clientScreen = null,
    Object? androidSdkVersion = null,
  }) {
    return _then(_value.copyWith(
      hl: null == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String,
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientScreen: null == clientScreen
          ? _value.clientScreen
          : clientScreen // ignore: cast_nullable_to_non_nullable
              as String,
      androidSdkVersion: null == androidSdkVersion
          ? _value.androidSdkVersion
          : androidSdkVersion // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String hl,
      String gl,
      String clientName,
      String clientVersion,
      String clientScreen,
      int androidSdkVersion});
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
    Object? hl = null,
    Object? gl = null,
    Object? clientName = null,
    Object? clientVersion = null,
    Object? clientScreen = null,
    Object? androidSdkVersion = null,
  }) {
    return _then(_$ClientImpl(
      hl: null == hl
          ? _value.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String,
      gl: null == gl
          ? _value.gl
          : gl // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientScreen: null == clientScreen
          ? _value.clientScreen
          : clientScreen // ignore: cast_nullable_to_non_nullable
              as String,
      androidSdkVersion: null == androidSdkVersion
          ? _value.androidSdkVersion
          : androidSdkVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl(
      {required this.hl,
      required this.gl,
      required this.clientName,
      required this.clientVersion,
      required this.clientScreen,
      required this.androidSdkVersion});

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  final String hl;
  @override
  final String gl;
  @override
  final String clientName;
  @override
  final String clientVersion;
  @override
  final String clientScreen;
  @override
  final int androidSdkVersion;

  @override
  String toString() {
    return 'Client(hl: $hl, gl: $gl, clientName: $clientName, clientVersion: $clientVersion, clientScreen: $clientScreen, androidSdkVersion: $androidSdkVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.hl, hl) || other.hl == hl) &&
            (identical(other.gl, gl) || other.gl == gl) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientVersion, clientVersion) ||
                other.clientVersion == clientVersion) &&
            (identical(other.clientScreen, clientScreen) ||
                other.clientScreen == clientScreen) &&
            (identical(other.androidSdkVersion, androidSdkVersion) ||
                other.androidSdkVersion == androidSdkVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hl, gl, clientName,
      clientVersion, clientScreen, androidSdkVersion);

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
  const factory _Client(
      {required final String hl,
      required final String gl,
      required final String clientName,
      required final String clientVersion,
      required final String clientScreen,
      required final int androidSdkVersion}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  String get hl;
  @override
  String get gl;
  @override
  String get clientName;
  @override
  String get clientVersion;
  @override
  String get clientScreen;
  @override
  int get androidSdkVersion;
  @override
  @JsonKey(ignore: true)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThirdParty _$ThirdPartyFromJson(Map<String, dynamic> json) {
  return _ThirdParty.fromJson(json);
}

/// @nodoc
mixin _$ThirdParty {
  String get embedUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThirdPartyCopyWith<ThirdParty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThirdPartyCopyWith<$Res> {
  factory $ThirdPartyCopyWith(
          ThirdParty value, $Res Function(ThirdParty) then) =
      _$ThirdPartyCopyWithImpl<$Res, ThirdParty>;
  @useResult
  $Res call({String embedUrl});
}

/// @nodoc
class _$ThirdPartyCopyWithImpl<$Res, $Val extends ThirdParty>
    implements $ThirdPartyCopyWith<$Res> {
  _$ThirdPartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedUrl = null,
  }) {
    return _then(_value.copyWith(
      embedUrl: null == embedUrl
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThirdPartyImplCopyWith<$Res>
    implements $ThirdPartyCopyWith<$Res> {
  factory _$$ThirdPartyImplCopyWith(
          _$ThirdPartyImpl value, $Res Function(_$ThirdPartyImpl) then) =
      __$$ThirdPartyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String embedUrl});
}

/// @nodoc
class __$$ThirdPartyImplCopyWithImpl<$Res>
    extends _$ThirdPartyCopyWithImpl<$Res, _$ThirdPartyImpl>
    implements _$$ThirdPartyImplCopyWith<$Res> {
  __$$ThirdPartyImplCopyWithImpl(
      _$ThirdPartyImpl _value, $Res Function(_$ThirdPartyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedUrl = null,
  }) {
    return _then(_$ThirdPartyImpl(
      embedUrl: null == embedUrl
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThirdPartyImpl implements _ThirdParty {
  const _$ThirdPartyImpl({required this.embedUrl});

  factory _$ThirdPartyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThirdPartyImplFromJson(json);

  @override
  final String embedUrl;

  @override
  String toString() {
    return 'ThirdParty(embedUrl: $embedUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThirdPartyImpl &&
            (identical(other.embedUrl, embedUrl) ||
                other.embedUrl == embedUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, embedUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThirdPartyImplCopyWith<_$ThirdPartyImpl> get copyWith =>
      __$$ThirdPartyImplCopyWithImpl<_$ThirdPartyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThirdPartyImplToJson(
      this,
    );
  }
}

abstract class _ThirdParty implements ThirdParty {
  const factory _ThirdParty({required final String embedUrl}) =
      _$ThirdPartyImpl;

  factory _ThirdParty.fromJson(Map<String, dynamic> json) =
      _$ThirdPartyImpl.fromJson;

  @override
  String get embedUrl;
  @override
  @JsonKey(ignore: true)
  _$$ThirdPartyImplCopyWith<_$ThirdPartyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaybackContext _$PlaybackContextFromJson(Map<String, dynamic> json) {
  return _PlaybackContext.fromJson(json);
}

/// @nodoc
mixin _$PlaybackContext {
  ContentPlaybackContext get contentPlaybackContext =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaybackContextCopyWith<PlaybackContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackContextCopyWith<$Res> {
  factory $PlaybackContextCopyWith(
          PlaybackContext value, $Res Function(PlaybackContext) then) =
      _$PlaybackContextCopyWithImpl<$Res, PlaybackContext>;
  @useResult
  $Res call({ContentPlaybackContext contentPlaybackContext});

  $ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext;
}

/// @nodoc
class _$PlaybackContextCopyWithImpl<$Res, $Val extends PlaybackContext>
    implements $PlaybackContextCopyWith<$Res> {
  _$PlaybackContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentPlaybackContext = null,
  }) {
    return _then(_value.copyWith(
      contentPlaybackContext: null == contentPlaybackContext
          ? _value.contentPlaybackContext
          : contentPlaybackContext // ignore: cast_nullable_to_non_nullable
              as ContentPlaybackContext,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext {
    return $ContentPlaybackContextCopyWith<$Res>(_value.contentPlaybackContext,
        (value) {
      return _then(_value.copyWith(contentPlaybackContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaybackContextImplCopyWith<$Res>
    implements $PlaybackContextCopyWith<$Res> {
  factory _$$PlaybackContextImplCopyWith(_$PlaybackContextImpl value,
          $Res Function(_$PlaybackContextImpl) then) =
      __$$PlaybackContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContentPlaybackContext contentPlaybackContext});

  @override
  $ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext;
}

/// @nodoc
class __$$PlaybackContextImplCopyWithImpl<$Res>
    extends _$PlaybackContextCopyWithImpl<$Res, _$PlaybackContextImpl>
    implements _$$PlaybackContextImplCopyWith<$Res> {
  __$$PlaybackContextImplCopyWithImpl(
      _$PlaybackContextImpl _value, $Res Function(_$PlaybackContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentPlaybackContext = null,
  }) {
    return _then(_$PlaybackContextImpl(
      contentPlaybackContext: null == contentPlaybackContext
          ? _value.contentPlaybackContext
          : contentPlaybackContext // ignore: cast_nullable_to_non_nullable
              as ContentPlaybackContext,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaybackContextImpl implements _PlaybackContext {
  const _$PlaybackContextImpl({required this.contentPlaybackContext});

  factory _$PlaybackContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaybackContextImplFromJson(json);

  @override
  final ContentPlaybackContext contentPlaybackContext;

  @override
  String toString() {
    return 'PlaybackContext(contentPlaybackContext: $contentPlaybackContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackContextImpl &&
            (identical(other.contentPlaybackContext, contentPlaybackContext) ||
                other.contentPlaybackContext == contentPlaybackContext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentPlaybackContext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackContextImplCopyWith<_$PlaybackContextImpl> get copyWith =>
      __$$PlaybackContextImplCopyWithImpl<_$PlaybackContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaybackContextImplToJson(
      this,
    );
  }
}

abstract class _PlaybackContext implements PlaybackContext {
  const factory _PlaybackContext(
          {required final ContentPlaybackContext contentPlaybackContext}) =
      _$PlaybackContextImpl;

  factory _PlaybackContext.fromJson(Map<String, dynamic> json) =
      _$PlaybackContextImpl.fromJson;

  @override
  ContentPlaybackContext get contentPlaybackContext;
  @override
  @JsonKey(ignore: true)
  _$$PlaybackContextImplCopyWith<_$PlaybackContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentPlaybackContext _$ContentPlaybackContextFromJson(
    Map<String, dynamic> json) {
  return _ContentPlaybackContext.fromJson(json);
}

/// @nodoc
mixin _$ContentPlaybackContext {
  int get signatureTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentPlaybackContextCopyWith<ContentPlaybackContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentPlaybackContextCopyWith<$Res> {
  factory $ContentPlaybackContextCopyWith(ContentPlaybackContext value,
          $Res Function(ContentPlaybackContext) then) =
      _$ContentPlaybackContextCopyWithImpl<$Res, ContentPlaybackContext>;
  @useResult
  $Res call({int signatureTimestamp});
}

/// @nodoc
class _$ContentPlaybackContextCopyWithImpl<$Res,
        $Val extends ContentPlaybackContext>
    implements $ContentPlaybackContextCopyWith<$Res> {
  _$ContentPlaybackContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signatureTimestamp = null,
  }) {
    return _then(_value.copyWith(
      signatureTimestamp: null == signatureTimestamp
          ? _value.signatureTimestamp
          : signatureTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentPlaybackContextImplCopyWith<$Res>
    implements $ContentPlaybackContextCopyWith<$Res> {
  factory _$$ContentPlaybackContextImplCopyWith(
          _$ContentPlaybackContextImpl value,
          $Res Function(_$ContentPlaybackContextImpl) then) =
      __$$ContentPlaybackContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int signatureTimestamp});
}

/// @nodoc
class __$$ContentPlaybackContextImplCopyWithImpl<$Res>
    extends _$ContentPlaybackContextCopyWithImpl<$Res,
        _$ContentPlaybackContextImpl>
    implements _$$ContentPlaybackContextImplCopyWith<$Res> {
  __$$ContentPlaybackContextImplCopyWithImpl(
      _$ContentPlaybackContextImpl _value,
      $Res Function(_$ContentPlaybackContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signatureTimestamp = null,
  }) {
    return _then(_$ContentPlaybackContextImpl(
      signatureTimestamp: null == signatureTimestamp
          ? _value.signatureTimestamp
          : signatureTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentPlaybackContextImpl implements _ContentPlaybackContext {
  const _$ContentPlaybackContextImpl({required this.signatureTimestamp});

  factory _$ContentPlaybackContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentPlaybackContextImplFromJson(json);

  @override
  final int signatureTimestamp;

  @override
  String toString() {
    return 'ContentPlaybackContext(signatureTimestamp: $signatureTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentPlaybackContextImpl &&
            (identical(other.signatureTimestamp, signatureTimestamp) ||
                other.signatureTimestamp == signatureTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, signatureTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentPlaybackContextImplCopyWith<_$ContentPlaybackContextImpl>
      get copyWith => __$$ContentPlaybackContextImplCopyWithImpl<
          _$ContentPlaybackContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentPlaybackContextImplToJson(
      this,
    );
  }
}

abstract class _ContentPlaybackContext implements ContentPlaybackContext {
  const factory _ContentPlaybackContext(
      {required final int signatureTimestamp}) = _$ContentPlaybackContextImpl;

  factory _ContentPlaybackContext.fromJson(Map<String, dynamic> json) =
      _$ContentPlaybackContextImpl.fromJson;

  @override
  int get signatureTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$ContentPlaybackContextImplCopyWith<_$ContentPlaybackContextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
