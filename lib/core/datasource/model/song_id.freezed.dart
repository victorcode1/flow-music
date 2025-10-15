// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Model {

 Context get context; String get videoId; PlaybackContext get playbackContext; bool get racyCheckOk; bool get contentCheckOk;
/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelCopyWith<Model> get copyWith => _$ModelCopyWithImpl<Model>(this as Model, _$identity);

  /// Serializes this Model to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Model&&(identical(other.context, context) || other.context == context)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.playbackContext, playbackContext) || other.playbackContext == playbackContext)&&(identical(other.racyCheckOk, racyCheckOk) || other.racyCheckOk == racyCheckOk)&&(identical(other.contentCheckOk, contentCheckOk) || other.contentCheckOk == contentCheckOk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,context,videoId,playbackContext,racyCheckOk,contentCheckOk);

@override
String toString() {
  return 'Model(context: $context, videoId: $videoId, playbackContext: $playbackContext, racyCheckOk: $racyCheckOk, contentCheckOk: $contentCheckOk)';
}


}

/// @nodoc
abstract mixin class $ModelCopyWith<$Res>  {
  factory $ModelCopyWith(Model value, $Res Function(Model) _then) = _$ModelCopyWithImpl;
@useResult
$Res call({
 Context context, String videoId, PlaybackContext playbackContext, bool racyCheckOk, bool contentCheckOk
});


$ContextCopyWith<$Res> get context;$PlaybackContextCopyWith<$Res> get playbackContext;

}
/// @nodoc
class _$ModelCopyWithImpl<$Res>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._self, this._then);

  final Model _self;
  final $Res Function(Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? context = null,Object? videoId = null,Object? playbackContext = null,Object? racyCheckOk = null,Object? contentCheckOk = null,}) {
  return _then(_self.copyWith(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as Context,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,playbackContext: null == playbackContext ? _self.playbackContext : playbackContext // ignore: cast_nullable_to_non_nullable
as PlaybackContext,racyCheckOk: null == racyCheckOk ? _self.racyCheckOk : racyCheckOk // ignore: cast_nullable_to_non_nullable
as bool,contentCheckOk: null == contentCheckOk ? _self.contentCheckOk : contentCheckOk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContextCopyWith<$Res> get context {
  
  return $ContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaybackContextCopyWith<$Res> get playbackContext {
  
  return $PlaybackContextCopyWith<$Res>(_self.playbackContext, (value) {
    return _then(_self.copyWith(playbackContext: value));
  });
}
}


/// Adds pattern-matching-related methods to [Model].
extension ModelPatterns on Model {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Model value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Model value)  $default,){
final _that = this;
switch (_that) {
case _Model():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Model value)?  $default,){
final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Context context,  String videoId,  PlaybackContext playbackContext,  bool racyCheckOk,  bool contentCheckOk)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.context,_that.videoId,_that.playbackContext,_that.racyCheckOk,_that.contentCheckOk);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Context context,  String videoId,  PlaybackContext playbackContext,  bool racyCheckOk,  bool contentCheckOk)  $default,) {final _that = this;
switch (_that) {
case _Model():
return $default(_that.context,_that.videoId,_that.playbackContext,_that.racyCheckOk,_that.contentCheckOk);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Context context,  String videoId,  PlaybackContext playbackContext,  bool racyCheckOk,  bool contentCheckOk)?  $default,) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.context,_that.videoId,_that.playbackContext,_that.racyCheckOk,_that.contentCheckOk);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Model implements Model {
  const _Model({required this.context, required this.videoId, required this.playbackContext, required this.racyCheckOk, required this.contentCheckOk});
  factory _Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

@override final  Context context;
@override final  String videoId;
@override final  PlaybackContext playbackContext;
@override final  bool racyCheckOk;
@override final  bool contentCheckOk;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelCopyWith<_Model> get copyWith => __$ModelCopyWithImpl<_Model>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Model&&(identical(other.context, context) || other.context == context)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.playbackContext, playbackContext) || other.playbackContext == playbackContext)&&(identical(other.racyCheckOk, racyCheckOk) || other.racyCheckOk == racyCheckOk)&&(identical(other.contentCheckOk, contentCheckOk) || other.contentCheckOk == contentCheckOk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,context,videoId,playbackContext,racyCheckOk,contentCheckOk);

@override
String toString() {
  return 'Model(context: $context, videoId: $videoId, playbackContext: $playbackContext, racyCheckOk: $racyCheckOk, contentCheckOk: $contentCheckOk)';
}


}

/// @nodoc
abstract mixin class _$ModelCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$ModelCopyWith(_Model value, $Res Function(_Model) _then) = __$ModelCopyWithImpl;
@override @useResult
$Res call({
 Context context, String videoId, PlaybackContext playbackContext, bool racyCheckOk, bool contentCheckOk
});


@override $ContextCopyWith<$Res> get context;@override $PlaybackContextCopyWith<$Res> get playbackContext;

}
/// @nodoc
class __$ModelCopyWithImpl<$Res>
    implements _$ModelCopyWith<$Res> {
  __$ModelCopyWithImpl(this._self, this._then);

  final _Model _self;
  final $Res Function(_Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? context = null,Object? videoId = null,Object? playbackContext = null,Object? racyCheckOk = null,Object? contentCheckOk = null,}) {
  return _then(_Model(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as Context,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,playbackContext: null == playbackContext ? _self.playbackContext : playbackContext // ignore: cast_nullable_to_non_nullable
as PlaybackContext,racyCheckOk: null == racyCheckOk ? _self.racyCheckOk : racyCheckOk // ignore: cast_nullable_to_non_nullable
as bool,contentCheckOk: null == contentCheckOk ? _self.contentCheckOk : contentCheckOk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContextCopyWith<$Res> get context {
  
  return $ContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaybackContextCopyWith<$Res> get playbackContext {
  
  return $PlaybackContextCopyWith<$Res>(_self.playbackContext, (value) {
    return _then(_self.copyWith(playbackContext: value));
  });
}
}


/// @nodoc
mixin _$Context {

 Client get client; ThirdParty get thirdParty;
/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContextCopyWith<Context> get copyWith => _$ContextCopyWithImpl<Context>(this as Context, _$identity);

  /// Serializes this Context to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Context&&(identical(other.client, client) || other.client == client)&&(identical(other.thirdParty, thirdParty) || other.thirdParty == thirdParty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,thirdParty);

@override
String toString() {
  return 'Context(client: $client, thirdParty: $thirdParty)';
}


}

/// @nodoc
abstract mixin class $ContextCopyWith<$Res>  {
  factory $ContextCopyWith(Context value, $Res Function(Context) _then) = _$ContextCopyWithImpl;
@useResult
$Res call({
 Client client, ThirdParty thirdParty
});


$ClientCopyWith<$Res> get client;$ThirdPartyCopyWith<$Res> get thirdParty;

}
/// @nodoc
class _$ContextCopyWithImpl<$Res>
    implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._self, this._then);

  final Context _self;
  final $Res Function(Context) _then;

/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? client = null,Object? thirdParty = null,}) {
  return _then(_self.copyWith(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Client,thirdParty: null == thirdParty ? _self.thirdParty : thirdParty // ignore: cast_nullable_to_non_nullable
as ThirdParty,
  ));
}
/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientCopyWith<$Res> get client {
  
  return $ClientCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThirdPartyCopyWith<$Res> get thirdParty {
  
  return $ThirdPartyCopyWith<$Res>(_self.thirdParty, (value) {
    return _then(_self.copyWith(thirdParty: value));
  });
}
}


/// Adds pattern-matching-related methods to [Context].
extension ContextPatterns on Context {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Context value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Context() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Context value)  $default,){
final _that = this;
switch (_that) {
case _Context():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Context value)?  $default,){
final _that = this;
switch (_that) {
case _Context() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Client client,  ThirdParty thirdParty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Context() when $default != null:
return $default(_that.client,_that.thirdParty);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Client client,  ThirdParty thirdParty)  $default,) {final _that = this;
switch (_that) {
case _Context():
return $default(_that.client,_that.thirdParty);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Client client,  ThirdParty thirdParty)?  $default,) {final _that = this;
switch (_that) {
case _Context() when $default != null:
return $default(_that.client,_that.thirdParty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Context implements Context {
  const _Context({required this.client, required this.thirdParty});
  factory _Context.fromJson(Map<String, dynamic> json) => _$ContextFromJson(json);

@override final  Client client;
@override final  ThirdParty thirdParty;

/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContextCopyWith<_Context> get copyWith => __$ContextCopyWithImpl<_Context>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Context&&(identical(other.client, client) || other.client == client)&&(identical(other.thirdParty, thirdParty) || other.thirdParty == thirdParty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,thirdParty);

@override
String toString() {
  return 'Context(client: $client, thirdParty: $thirdParty)';
}


}

/// @nodoc
abstract mixin class _$ContextCopyWith<$Res> implements $ContextCopyWith<$Res> {
  factory _$ContextCopyWith(_Context value, $Res Function(_Context) _then) = __$ContextCopyWithImpl;
@override @useResult
$Res call({
 Client client, ThirdParty thirdParty
});


@override $ClientCopyWith<$Res> get client;@override $ThirdPartyCopyWith<$Res> get thirdParty;

}
/// @nodoc
class __$ContextCopyWithImpl<$Res>
    implements _$ContextCopyWith<$Res> {
  __$ContextCopyWithImpl(this._self, this._then);

  final _Context _self;
  final $Res Function(_Context) _then;

/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? client = null,Object? thirdParty = null,}) {
  return _then(_Context(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Client,thirdParty: null == thirdParty ? _self.thirdParty : thirdParty // ignore: cast_nullable_to_non_nullable
as ThirdParty,
  ));
}

/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientCopyWith<$Res> get client {
  
  return $ClientCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}/// Create a copy of Context
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThirdPartyCopyWith<$Res> get thirdParty {
  
  return $ThirdPartyCopyWith<$Res>(_self.thirdParty, (value) {
    return _then(_self.copyWith(thirdParty: value));
  });
}
}


/// @nodoc
mixin _$Client {

 String get hl; String get gl; String get clientName; String get clientVersion; String get clientScreen; int get androidSdkVersion;
/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientCopyWith<Client> get copyWith => _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Client&&(identical(other.hl, hl) || other.hl == hl)&&(identical(other.gl, gl) || other.gl == gl)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion)&&(identical(other.clientScreen, clientScreen) || other.clientScreen == clientScreen)&&(identical(other.androidSdkVersion, androidSdkVersion) || other.androidSdkVersion == androidSdkVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hl,gl,clientName,clientVersion,clientScreen,androidSdkVersion);

@override
String toString() {
  return 'Client(hl: $hl, gl: $gl, clientName: $clientName, clientVersion: $clientVersion, clientScreen: $clientScreen, androidSdkVersion: $androidSdkVersion)';
}


}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res>  {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) = _$ClientCopyWithImpl;
@useResult
$Res call({
 String hl, String gl, String clientName, String clientVersion, String clientScreen, int androidSdkVersion
});




}
/// @nodoc
class _$ClientCopyWithImpl<$Res>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hl = null,Object? gl = null,Object? clientName = null,Object? clientVersion = null,Object? clientScreen = null,Object? androidSdkVersion = null,}) {
  return _then(_self.copyWith(
hl: null == hl ? _self.hl : hl // ignore: cast_nullable_to_non_nullable
as String,gl: null == gl ? _self.gl : gl // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientVersion: null == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String,clientScreen: null == clientScreen ? _self.clientScreen : clientScreen // ignore: cast_nullable_to_non_nullable
as String,androidSdkVersion: null == androidSdkVersion ? _self.androidSdkVersion : androidSdkVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Client value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Client value)  $default,){
final _that = this;
switch (_that) {
case _Client():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Client value)?  $default,){
final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hl,  String gl,  String clientName,  String clientVersion,  String clientScreen,  int androidSdkVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.hl,_that.gl,_that.clientName,_that.clientVersion,_that.clientScreen,_that.androidSdkVersion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hl,  String gl,  String clientName,  String clientVersion,  String clientScreen,  int androidSdkVersion)  $default,) {final _that = this;
switch (_that) {
case _Client():
return $default(_that.hl,_that.gl,_that.clientName,_that.clientVersion,_that.clientScreen,_that.androidSdkVersion);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hl,  String gl,  String clientName,  String clientVersion,  String clientScreen,  int androidSdkVersion)?  $default,) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.hl,_that.gl,_that.clientName,_that.clientVersion,_that.clientScreen,_that.androidSdkVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Client implements Client {
  const _Client({required this.hl, required this.gl, required this.clientName, required this.clientVersion, required this.clientScreen, required this.androidSdkVersion});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

@override final  String hl;
@override final  String gl;
@override final  String clientName;
@override final  String clientVersion;
@override final  String clientScreen;
@override final  int androidSdkVersion;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientCopyWith<_Client> get copyWith => __$ClientCopyWithImpl<_Client>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Client&&(identical(other.hl, hl) || other.hl == hl)&&(identical(other.gl, gl) || other.gl == gl)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion)&&(identical(other.clientScreen, clientScreen) || other.clientScreen == clientScreen)&&(identical(other.androidSdkVersion, androidSdkVersion) || other.androidSdkVersion == androidSdkVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hl,gl,clientName,clientVersion,clientScreen,androidSdkVersion);

@override
String toString() {
  return 'Client(hl: $hl, gl: $gl, clientName: $clientName, clientVersion: $clientVersion, clientScreen: $clientScreen, androidSdkVersion: $androidSdkVersion)';
}


}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) = __$ClientCopyWithImpl;
@override @useResult
$Res call({
 String hl, String gl, String clientName, String clientVersion, String clientScreen, int androidSdkVersion
});




}
/// @nodoc
class __$ClientCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hl = null,Object? gl = null,Object? clientName = null,Object? clientVersion = null,Object? clientScreen = null,Object? androidSdkVersion = null,}) {
  return _then(_Client(
hl: null == hl ? _self.hl : hl // ignore: cast_nullable_to_non_nullable
as String,gl: null == gl ? _self.gl : gl // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientVersion: null == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String,clientScreen: null == clientScreen ? _self.clientScreen : clientScreen // ignore: cast_nullable_to_non_nullable
as String,androidSdkVersion: null == androidSdkVersion ? _self.androidSdkVersion : androidSdkVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ThirdParty {

 String get embedUrl;
/// Create a copy of ThirdParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThirdPartyCopyWith<ThirdParty> get copyWith => _$ThirdPartyCopyWithImpl<ThirdParty>(this as ThirdParty, _$identity);

  /// Serializes this ThirdParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThirdParty&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedUrl);

@override
String toString() {
  return 'ThirdParty(embedUrl: $embedUrl)';
}


}

/// @nodoc
abstract mixin class $ThirdPartyCopyWith<$Res>  {
  factory $ThirdPartyCopyWith(ThirdParty value, $Res Function(ThirdParty) _then) = _$ThirdPartyCopyWithImpl;
@useResult
$Res call({
 String embedUrl
});




}
/// @nodoc
class _$ThirdPartyCopyWithImpl<$Res>
    implements $ThirdPartyCopyWith<$Res> {
  _$ThirdPartyCopyWithImpl(this._self, this._then);

  final ThirdParty _self;
  final $Res Function(ThirdParty) _then;

/// Create a copy of ThirdParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? embedUrl = null,}) {
  return _then(_self.copyWith(
embedUrl: null == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ThirdParty].
extension ThirdPartyPatterns on ThirdParty {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThirdParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThirdParty() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThirdParty value)  $default,){
final _that = this;
switch (_that) {
case _ThirdParty():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThirdParty value)?  $default,){
final _that = this;
switch (_that) {
case _ThirdParty() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String embedUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThirdParty() when $default != null:
return $default(_that.embedUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String embedUrl)  $default,) {final _that = this;
switch (_that) {
case _ThirdParty():
return $default(_that.embedUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String embedUrl)?  $default,) {final _that = this;
switch (_that) {
case _ThirdParty() when $default != null:
return $default(_that.embedUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThirdParty implements ThirdParty {
  const _ThirdParty({required this.embedUrl});
  factory _ThirdParty.fromJson(Map<String, dynamic> json) => _$ThirdPartyFromJson(json);

@override final  String embedUrl;

/// Create a copy of ThirdParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThirdPartyCopyWith<_ThirdParty> get copyWith => __$ThirdPartyCopyWithImpl<_ThirdParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThirdPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThirdParty&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedUrl);

@override
String toString() {
  return 'ThirdParty(embedUrl: $embedUrl)';
}


}

/// @nodoc
abstract mixin class _$ThirdPartyCopyWith<$Res> implements $ThirdPartyCopyWith<$Res> {
  factory _$ThirdPartyCopyWith(_ThirdParty value, $Res Function(_ThirdParty) _then) = __$ThirdPartyCopyWithImpl;
@override @useResult
$Res call({
 String embedUrl
});




}
/// @nodoc
class __$ThirdPartyCopyWithImpl<$Res>
    implements _$ThirdPartyCopyWith<$Res> {
  __$ThirdPartyCopyWithImpl(this._self, this._then);

  final _ThirdParty _self;
  final $Res Function(_ThirdParty) _then;

/// Create a copy of ThirdParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? embedUrl = null,}) {
  return _then(_ThirdParty(
embedUrl: null == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlaybackContext {

 ContentPlaybackContext get contentPlaybackContext;
/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackContextCopyWith<PlaybackContext> get copyWith => _$PlaybackContextCopyWithImpl<PlaybackContext>(this as PlaybackContext, _$identity);

  /// Serializes this PlaybackContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackContext&&(identical(other.contentPlaybackContext, contentPlaybackContext) || other.contentPlaybackContext == contentPlaybackContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentPlaybackContext);

@override
String toString() {
  return 'PlaybackContext(contentPlaybackContext: $contentPlaybackContext)';
}


}

/// @nodoc
abstract mixin class $PlaybackContextCopyWith<$Res>  {
  factory $PlaybackContextCopyWith(PlaybackContext value, $Res Function(PlaybackContext) _then) = _$PlaybackContextCopyWithImpl;
@useResult
$Res call({
 ContentPlaybackContext contentPlaybackContext
});


$ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext;

}
/// @nodoc
class _$PlaybackContextCopyWithImpl<$Res>
    implements $PlaybackContextCopyWith<$Res> {
  _$PlaybackContextCopyWithImpl(this._self, this._then);

  final PlaybackContext _self;
  final $Res Function(PlaybackContext) _then;

/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contentPlaybackContext = null,}) {
  return _then(_self.copyWith(
contentPlaybackContext: null == contentPlaybackContext ? _self.contentPlaybackContext : contentPlaybackContext // ignore: cast_nullable_to_non_nullable
as ContentPlaybackContext,
  ));
}
/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext {
  
  return $ContentPlaybackContextCopyWith<$Res>(_self.contentPlaybackContext, (value) {
    return _then(_self.copyWith(contentPlaybackContext: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaybackContext].
extension PlaybackContextPatterns on PlaybackContext {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackContext() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackContext value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackContext():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackContext value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackContext() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContentPlaybackContext contentPlaybackContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackContext() when $default != null:
return $default(_that.contentPlaybackContext);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContentPlaybackContext contentPlaybackContext)  $default,) {final _that = this;
switch (_that) {
case _PlaybackContext():
return $default(_that.contentPlaybackContext);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContentPlaybackContext contentPlaybackContext)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackContext() when $default != null:
return $default(_that.contentPlaybackContext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaybackContext implements PlaybackContext {
  const _PlaybackContext({required this.contentPlaybackContext});
  factory _PlaybackContext.fromJson(Map<String, dynamic> json) => _$PlaybackContextFromJson(json);

@override final  ContentPlaybackContext contentPlaybackContext;

/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackContextCopyWith<_PlaybackContext> get copyWith => __$PlaybackContextCopyWithImpl<_PlaybackContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaybackContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackContext&&(identical(other.contentPlaybackContext, contentPlaybackContext) || other.contentPlaybackContext == contentPlaybackContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentPlaybackContext);

@override
String toString() {
  return 'PlaybackContext(contentPlaybackContext: $contentPlaybackContext)';
}


}

/// @nodoc
abstract mixin class _$PlaybackContextCopyWith<$Res> implements $PlaybackContextCopyWith<$Res> {
  factory _$PlaybackContextCopyWith(_PlaybackContext value, $Res Function(_PlaybackContext) _then) = __$PlaybackContextCopyWithImpl;
@override @useResult
$Res call({
 ContentPlaybackContext contentPlaybackContext
});


@override $ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext;

}
/// @nodoc
class __$PlaybackContextCopyWithImpl<$Res>
    implements _$PlaybackContextCopyWith<$Res> {
  __$PlaybackContextCopyWithImpl(this._self, this._then);

  final _PlaybackContext _self;
  final $Res Function(_PlaybackContext) _then;

/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contentPlaybackContext = null,}) {
  return _then(_PlaybackContext(
contentPlaybackContext: null == contentPlaybackContext ? _self.contentPlaybackContext : contentPlaybackContext // ignore: cast_nullable_to_non_nullable
as ContentPlaybackContext,
  ));
}

/// Create a copy of PlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentPlaybackContextCopyWith<$Res> get contentPlaybackContext {
  
  return $ContentPlaybackContextCopyWith<$Res>(_self.contentPlaybackContext, (value) {
    return _then(_self.copyWith(contentPlaybackContext: value));
  });
}
}


/// @nodoc
mixin _$ContentPlaybackContext {

 int get signatureTimestamp;
/// Create a copy of ContentPlaybackContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentPlaybackContextCopyWith<ContentPlaybackContext> get copyWith => _$ContentPlaybackContextCopyWithImpl<ContentPlaybackContext>(this as ContentPlaybackContext, _$identity);

  /// Serializes this ContentPlaybackContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentPlaybackContext&&(identical(other.signatureTimestamp, signatureTimestamp) || other.signatureTimestamp == signatureTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signatureTimestamp);

@override
String toString() {
  return 'ContentPlaybackContext(signatureTimestamp: $signatureTimestamp)';
}


}

/// @nodoc
abstract mixin class $ContentPlaybackContextCopyWith<$Res>  {
  factory $ContentPlaybackContextCopyWith(ContentPlaybackContext value, $Res Function(ContentPlaybackContext) _then) = _$ContentPlaybackContextCopyWithImpl;
@useResult
$Res call({
 int signatureTimestamp
});




}
/// @nodoc
class _$ContentPlaybackContextCopyWithImpl<$Res>
    implements $ContentPlaybackContextCopyWith<$Res> {
  _$ContentPlaybackContextCopyWithImpl(this._self, this._then);

  final ContentPlaybackContext _self;
  final $Res Function(ContentPlaybackContext) _then;

/// Create a copy of ContentPlaybackContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signatureTimestamp = null,}) {
  return _then(_self.copyWith(
signatureTimestamp: null == signatureTimestamp ? _self.signatureTimestamp : signatureTimestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentPlaybackContext].
extension ContentPlaybackContextPatterns on ContentPlaybackContext {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentPlaybackContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentPlaybackContext() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentPlaybackContext value)  $default,){
final _that = this;
switch (_that) {
case _ContentPlaybackContext():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentPlaybackContext value)?  $default,){
final _that = this;
switch (_that) {
case _ContentPlaybackContext() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int signatureTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentPlaybackContext() when $default != null:
return $default(_that.signatureTimestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int signatureTimestamp)  $default,) {final _that = this;
switch (_that) {
case _ContentPlaybackContext():
return $default(_that.signatureTimestamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int signatureTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _ContentPlaybackContext() when $default != null:
return $default(_that.signatureTimestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentPlaybackContext implements ContentPlaybackContext {
  const _ContentPlaybackContext({required this.signatureTimestamp});
  factory _ContentPlaybackContext.fromJson(Map<String, dynamic> json) => _$ContentPlaybackContextFromJson(json);

@override final  int signatureTimestamp;

/// Create a copy of ContentPlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentPlaybackContextCopyWith<_ContentPlaybackContext> get copyWith => __$ContentPlaybackContextCopyWithImpl<_ContentPlaybackContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentPlaybackContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentPlaybackContext&&(identical(other.signatureTimestamp, signatureTimestamp) || other.signatureTimestamp == signatureTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signatureTimestamp);

@override
String toString() {
  return 'ContentPlaybackContext(signatureTimestamp: $signatureTimestamp)';
}


}

/// @nodoc
abstract mixin class _$ContentPlaybackContextCopyWith<$Res> implements $ContentPlaybackContextCopyWith<$Res> {
  factory _$ContentPlaybackContextCopyWith(_ContentPlaybackContext value, $Res Function(_ContentPlaybackContext) _then) = __$ContentPlaybackContextCopyWithImpl;
@override @useResult
$Res call({
 int signatureTimestamp
});




}
/// @nodoc
class __$ContentPlaybackContextCopyWithImpl<$Res>
    implements _$ContentPlaybackContextCopyWith<$Res> {
  __$ContentPlaybackContextCopyWithImpl(this._self, this._then);

  final _ContentPlaybackContext _self;
  final $Res Function(_ContentPlaybackContext) _then;

/// Create a copy of ContentPlaybackContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signatureTimestamp = null,}) {
  return _then(_ContentPlaybackContext(
signatureTimestamp: null == signatureTimestamp ? _self.signatureTimestamp : signatureTimestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
