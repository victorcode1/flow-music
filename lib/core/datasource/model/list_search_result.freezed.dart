// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListSearchResult {

 ResponseContext? get responseContext; Contents? get contents; String? get trackingParams;
/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListSearchResultCopyWith<ListSearchResult> get copyWith => _$ListSearchResultCopyWithImpl<ListSearchResult>(this as ListSearchResult, _$identity);

  /// Serializes this ListSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListSearchResult&&(identical(other.responseContext, responseContext) || other.responseContext == responseContext)&&(identical(other.contents, contents) || other.contents == contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseContext,contents,trackingParams);

@override
String toString() {
  return 'ListSearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $ListSearchResultCopyWith<$Res>  {
  factory $ListSearchResultCopyWith(ListSearchResult value, $Res Function(ListSearchResult) _then) = _$ListSearchResultCopyWithImpl;
@useResult
$Res call({
 ResponseContext? responseContext, Contents? contents, String? trackingParams
});


$ResponseContextCopyWith<$Res>? get responseContext;$ContentsCopyWith<$Res>? get contents;

}
/// @nodoc
class _$ListSearchResultCopyWithImpl<$Res>
    implements $ListSearchResultCopyWith<$Res> {
  _$ListSearchResultCopyWithImpl(this._self, this._then);

  final ListSearchResult _self;
  final $Res Function(ListSearchResult) _then;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseContext = freezed,Object? contents = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
responseContext: freezed == responseContext ? _self.responseContext : responseContext // ignore: cast_nullable_to_non_nullable
as ResponseContext?,contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as Contents?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseContextCopyWith<$Res>? get responseContext {
    if (_self.responseContext == null) {
    return null;
  }

  return $ResponseContextCopyWith<$Res>(_self.responseContext!, (value) {
    return _then(_self.copyWith(responseContext: value));
  });
}/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentsCopyWith<$Res>? get contents {
    if (_self.contents == null) {
    return null;
  }

  return $ContentsCopyWith<$Res>(_self.contents!, (value) {
    return _then(_self.copyWith(contents: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListSearchResult].
extension ListSearchResultPatterns on ListSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _ListSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResponseContext? responseContext,  Contents? contents,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
return $default(_that.responseContext,_that.contents,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResponseContext? responseContext,  Contents? contents,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _ListSearchResult():
return $default(_that.responseContext,_that.contents,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResponseContext? responseContext,  Contents? contents,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _ListSearchResult() when $default != null:
return $default(_that.responseContext,_that.contents,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListSearchResult implements ListSearchResult {
  const _ListSearchResult({this.responseContext, this.contents, this.trackingParams});
  factory _ListSearchResult.fromJson(Map<String, dynamic> json) => _$ListSearchResultFromJson(json);

@override final  ResponseContext? responseContext;
@override final  Contents? contents;
@override final  String? trackingParams;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListSearchResultCopyWith<_ListSearchResult> get copyWith => __$ListSearchResultCopyWithImpl<_ListSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListSearchResult&&(identical(other.responseContext, responseContext) || other.responseContext == responseContext)&&(identical(other.contents, contents) || other.contents == contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseContext,contents,trackingParams);

@override
String toString() {
  return 'ListSearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$ListSearchResultCopyWith<$Res> implements $ListSearchResultCopyWith<$Res> {
  factory _$ListSearchResultCopyWith(_ListSearchResult value, $Res Function(_ListSearchResult) _then) = __$ListSearchResultCopyWithImpl;
@override @useResult
$Res call({
 ResponseContext? responseContext, Contents? contents, String? trackingParams
});


@override $ResponseContextCopyWith<$Res>? get responseContext;@override $ContentsCopyWith<$Res>? get contents;

}
/// @nodoc
class __$ListSearchResultCopyWithImpl<$Res>
    implements _$ListSearchResultCopyWith<$Res> {
  __$ListSearchResultCopyWithImpl(this._self, this._then);

  final _ListSearchResult _self;
  final $Res Function(_ListSearchResult) _then;

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseContext = freezed,Object? contents = freezed,Object? trackingParams = freezed,}) {
  return _then(_ListSearchResult(
responseContext: freezed == responseContext ? _self.responseContext : responseContext // ignore: cast_nullable_to_non_nullable
as ResponseContext?,contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as Contents?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseContextCopyWith<$Res>? get responseContext {
    if (_self.responseContext == null) {
    return null;
  }

  return $ResponseContextCopyWith<$Res>(_self.responseContext!, (value) {
    return _then(_self.copyWith(responseContext: value));
  });
}/// Create a copy of ListSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentsCopyWith<$Res>? get contents {
    if (_self.contents == null) {
    return null;
  }

  return $ContentsCopyWith<$Res>(_self.contents!, (value) {
    return _then(_self.copyWith(contents: value));
  });
}
}


/// @nodoc
mixin _$Contents {

 TabbedSearchResultsRenderer? get tabbedSearchResultsRenderer;
/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentsCopyWith<Contents> get copyWith => _$ContentsCopyWithImpl<Contents>(this as Contents, _$identity);

  /// Serializes this Contents to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contents&&(identical(other.tabbedSearchResultsRenderer, tabbedSearchResultsRenderer) || other.tabbedSearchResultsRenderer == tabbedSearchResultsRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabbedSearchResultsRenderer);

@override
String toString() {
  return 'Contents(tabbedSearchResultsRenderer: $tabbedSearchResultsRenderer)';
}


}

/// @nodoc
abstract mixin class $ContentsCopyWith<$Res>  {
  factory $ContentsCopyWith(Contents value, $Res Function(Contents) _then) = _$ContentsCopyWithImpl;
@useResult
$Res call({
 TabbedSearchResultsRenderer? tabbedSearchResultsRenderer
});


$TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer;

}
/// @nodoc
class _$ContentsCopyWithImpl<$Res>
    implements $ContentsCopyWith<$Res> {
  _$ContentsCopyWithImpl(this._self, this._then);

  final Contents _self;
  final $Res Function(Contents) _then;

/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabbedSearchResultsRenderer = freezed,}) {
  return _then(_self.copyWith(
tabbedSearchResultsRenderer: freezed == tabbedSearchResultsRenderer ? _self.tabbedSearchResultsRenderer : tabbedSearchResultsRenderer // ignore: cast_nullable_to_non_nullable
as TabbedSearchResultsRenderer?,
  ));
}
/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer {
    if (_self.tabbedSearchResultsRenderer == null) {
    return null;
  }

  return $TabbedSearchResultsRendererCopyWith<$Res>(_self.tabbedSearchResultsRenderer!, (value) {
    return _then(_self.copyWith(tabbedSearchResultsRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Contents].
extension ContentsPatterns on Contents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contents value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contents() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contents value)  $default,){
final _that = this;
switch (_that) {
case _Contents():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contents value)?  $default,){
final _that = this;
switch (_that) {
case _Contents() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TabbedSearchResultsRenderer? tabbedSearchResultsRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contents() when $default != null:
return $default(_that.tabbedSearchResultsRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TabbedSearchResultsRenderer? tabbedSearchResultsRenderer)  $default,) {final _that = this;
switch (_that) {
case _Contents():
return $default(_that.tabbedSearchResultsRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TabbedSearchResultsRenderer? tabbedSearchResultsRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Contents() when $default != null:
return $default(_that.tabbedSearchResultsRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contents implements Contents {
  const _Contents({this.tabbedSearchResultsRenderer});
  factory _Contents.fromJson(Map<String, dynamic> json) => _$ContentsFromJson(json);

@override final  TabbedSearchResultsRenderer? tabbedSearchResultsRenderer;

/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentsCopyWith<_Contents> get copyWith => __$ContentsCopyWithImpl<_Contents>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contents&&(identical(other.tabbedSearchResultsRenderer, tabbedSearchResultsRenderer) || other.tabbedSearchResultsRenderer == tabbedSearchResultsRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabbedSearchResultsRenderer);

@override
String toString() {
  return 'Contents(tabbedSearchResultsRenderer: $tabbedSearchResultsRenderer)';
}


}

/// @nodoc
abstract mixin class _$ContentsCopyWith<$Res> implements $ContentsCopyWith<$Res> {
  factory _$ContentsCopyWith(_Contents value, $Res Function(_Contents) _then) = __$ContentsCopyWithImpl;
@override @useResult
$Res call({
 TabbedSearchResultsRenderer? tabbedSearchResultsRenderer
});


@override $TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer;

}
/// @nodoc
class __$ContentsCopyWithImpl<$Res>
    implements _$ContentsCopyWith<$Res> {
  __$ContentsCopyWithImpl(this._self, this._then);

  final _Contents _self;
  final $Res Function(_Contents) _then;

/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabbedSearchResultsRenderer = freezed,}) {
  return _then(_Contents(
tabbedSearchResultsRenderer: freezed == tabbedSearchResultsRenderer ? _self.tabbedSearchResultsRenderer : tabbedSearchResultsRenderer // ignore: cast_nullable_to_non_nullable
as TabbedSearchResultsRenderer?,
  ));
}

/// Create a copy of Contents
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer {
    if (_self.tabbedSearchResultsRenderer == null) {
    return null;
  }

  return $TabbedSearchResultsRendererCopyWith<$Res>(_self.tabbedSearchResultsRenderer!, (value) {
    return _then(_self.copyWith(tabbedSearchResultsRenderer: value));
  });
}
}


/// @nodoc
mixin _$TabbedSearchResultsRenderer {

 List<Tab>? get tabs;
/// Create a copy of TabbedSearchResultsRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabbedSearchResultsRendererCopyWith<TabbedSearchResultsRenderer> get copyWith => _$TabbedSearchResultsRendererCopyWithImpl<TabbedSearchResultsRenderer>(this as TabbedSearchResultsRenderer, _$identity);

  /// Serializes this TabbedSearchResultsRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabbedSearchResultsRenderer&&const DeepCollectionEquality().equals(other.tabs, tabs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tabs));

@override
String toString() {
  return 'TabbedSearchResultsRenderer(tabs: $tabs)';
}


}

/// @nodoc
abstract mixin class $TabbedSearchResultsRendererCopyWith<$Res>  {
  factory $TabbedSearchResultsRendererCopyWith(TabbedSearchResultsRenderer value, $Res Function(TabbedSearchResultsRenderer) _then) = _$TabbedSearchResultsRendererCopyWithImpl;
@useResult
$Res call({
 List<Tab>? tabs
});




}
/// @nodoc
class _$TabbedSearchResultsRendererCopyWithImpl<$Res>
    implements $TabbedSearchResultsRendererCopyWith<$Res> {
  _$TabbedSearchResultsRendererCopyWithImpl(this._self, this._then);

  final TabbedSearchResultsRenderer _self;
  final $Res Function(TabbedSearchResultsRenderer) _then;

/// Create a copy of TabbedSearchResultsRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabs = freezed,}) {
  return _then(_self.copyWith(
tabs: freezed == tabs ? _self.tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<Tab>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TabbedSearchResultsRenderer].
extension TabbedSearchResultsRendererPatterns on TabbedSearchResultsRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabbedSearchResultsRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabbedSearchResultsRenderer value)  $default,){
final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabbedSearchResultsRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Tab>? tabs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer() when $default != null:
return $default(_that.tabs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Tab>? tabs)  $default,) {final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer():
return $default(_that.tabs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Tab>? tabs)?  $default,) {final _that = this;
switch (_that) {
case _TabbedSearchResultsRenderer() when $default != null:
return $default(_that.tabs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabbedSearchResultsRenderer implements TabbedSearchResultsRenderer {
  const _TabbedSearchResultsRenderer({final  List<Tab>? tabs}): _tabs = tabs;
  factory _TabbedSearchResultsRenderer.fromJson(Map<String, dynamic> json) => _$TabbedSearchResultsRendererFromJson(json);

 final  List<Tab>? _tabs;
@override List<Tab>? get tabs {
  final value = _tabs;
  if (value == null) return null;
  if (_tabs is EqualUnmodifiableListView) return _tabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TabbedSearchResultsRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabbedSearchResultsRendererCopyWith<_TabbedSearchResultsRenderer> get copyWith => __$TabbedSearchResultsRendererCopyWithImpl<_TabbedSearchResultsRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabbedSearchResultsRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabbedSearchResultsRenderer&&const DeepCollectionEquality().equals(other._tabs, _tabs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tabs));

@override
String toString() {
  return 'TabbedSearchResultsRenderer(tabs: $tabs)';
}


}

/// @nodoc
abstract mixin class _$TabbedSearchResultsRendererCopyWith<$Res> implements $TabbedSearchResultsRendererCopyWith<$Res> {
  factory _$TabbedSearchResultsRendererCopyWith(_TabbedSearchResultsRenderer value, $Res Function(_TabbedSearchResultsRenderer) _then) = __$TabbedSearchResultsRendererCopyWithImpl;
@override @useResult
$Res call({
 List<Tab>? tabs
});




}
/// @nodoc
class __$TabbedSearchResultsRendererCopyWithImpl<$Res>
    implements _$TabbedSearchResultsRendererCopyWith<$Res> {
  __$TabbedSearchResultsRendererCopyWithImpl(this._self, this._then);

  final _TabbedSearchResultsRenderer _self;
  final $Res Function(_TabbedSearchResultsRenderer) _then;

/// Create a copy of TabbedSearchResultsRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabs = freezed,}) {
  return _then(_TabbedSearchResultsRenderer(
tabs: freezed == tabs ? _self._tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<Tab>?,
  ));
}


}


/// @nodoc
mixin _$Tab {

 TabRenderer? get tabRenderer;
/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabCopyWith<Tab> get copyWith => _$TabCopyWithImpl<Tab>(this as Tab, _$identity);

  /// Serializes this Tab to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tab&&(identical(other.tabRenderer, tabRenderer) || other.tabRenderer == tabRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabRenderer);

@override
String toString() {
  return 'Tab(tabRenderer: $tabRenderer)';
}


}

/// @nodoc
abstract mixin class $TabCopyWith<$Res>  {
  factory $TabCopyWith(Tab value, $Res Function(Tab) _then) = _$TabCopyWithImpl;
@useResult
$Res call({
 TabRenderer? tabRenderer
});


$TabRendererCopyWith<$Res>? get tabRenderer;

}
/// @nodoc
class _$TabCopyWithImpl<$Res>
    implements $TabCopyWith<$Res> {
  _$TabCopyWithImpl(this._self, this._then);

  final Tab _self;
  final $Res Function(Tab) _then;

/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabRenderer = freezed,}) {
  return _then(_self.copyWith(
tabRenderer: freezed == tabRenderer ? _self.tabRenderer : tabRenderer // ignore: cast_nullable_to_non_nullable
as TabRenderer?,
  ));
}
/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabRendererCopyWith<$Res>? get tabRenderer {
    if (_self.tabRenderer == null) {
    return null;
  }

  return $TabRendererCopyWith<$Res>(_self.tabRenderer!, (value) {
    return _then(_self.copyWith(tabRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tab].
extension TabPatterns on Tab {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tab value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tab() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tab value)  $default,){
final _that = this;
switch (_that) {
case _Tab():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tab value)?  $default,){
final _that = this;
switch (_that) {
case _Tab() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TabRenderer? tabRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tab() when $default != null:
return $default(_that.tabRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TabRenderer? tabRenderer)  $default,) {final _that = this;
switch (_that) {
case _Tab():
return $default(_that.tabRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TabRenderer? tabRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Tab() when $default != null:
return $default(_that.tabRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tab implements Tab {
  const _Tab({this.tabRenderer});
  factory _Tab.fromJson(Map<String, dynamic> json) => _$TabFromJson(json);

@override final  TabRenderer? tabRenderer;

/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabCopyWith<_Tab> get copyWith => __$TabCopyWithImpl<_Tab>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tab&&(identical(other.tabRenderer, tabRenderer) || other.tabRenderer == tabRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabRenderer);

@override
String toString() {
  return 'Tab(tabRenderer: $tabRenderer)';
}


}

/// @nodoc
abstract mixin class _$TabCopyWith<$Res> implements $TabCopyWith<$Res> {
  factory _$TabCopyWith(_Tab value, $Res Function(_Tab) _then) = __$TabCopyWithImpl;
@override @useResult
$Res call({
 TabRenderer? tabRenderer
});


@override $TabRendererCopyWith<$Res>? get tabRenderer;

}
/// @nodoc
class __$TabCopyWithImpl<$Res>
    implements _$TabCopyWith<$Res> {
  __$TabCopyWithImpl(this._self, this._then);

  final _Tab _self;
  final $Res Function(_Tab) _then;

/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabRenderer = freezed,}) {
  return _then(_Tab(
tabRenderer: freezed == tabRenderer ? _self.tabRenderer : tabRenderer // ignore: cast_nullable_to_non_nullable
as TabRenderer?,
  ));
}

/// Create a copy of Tab
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabRendererCopyWith<$Res>? get tabRenderer {
    if (_self.tabRenderer == null) {
    return null;
  }

  return $TabRendererCopyWith<$Res>(_self.tabRenderer!, (value) {
    return _then(_self.copyWith(tabRenderer: value));
  });
}
}


/// @nodoc
mixin _$TabRenderer {

 String? get title; bool? get selected; TabRendererContent? get content; String? get tabIdentifier; String? get trackingParams;
/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabRendererCopyWith<TabRenderer> get copyWith => _$TabRendererCopyWithImpl<TabRenderer>(this as TabRenderer, _$identity);

  /// Serializes this TabRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabRenderer&&(identical(other.title, title) || other.title == title)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.content, content) || other.content == content)&&(identical(other.tabIdentifier, tabIdentifier) || other.tabIdentifier == tabIdentifier)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,selected,content,tabIdentifier,trackingParams);

@override
String toString() {
  return 'TabRenderer(title: $title, selected: $selected, content: $content, tabIdentifier: $tabIdentifier, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $TabRendererCopyWith<$Res>  {
  factory $TabRendererCopyWith(TabRenderer value, $Res Function(TabRenderer) _then) = _$TabRendererCopyWithImpl;
@useResult
$Res call({
 String? title, bool? selected, TabRendererContent? content, String? tabIdentifier, String? trackingParams
});


$TabRendererContentCopyWith<$Res>? get content;

}
/// @nodoc
class _$TabRendererCopyWithImpl<$Res>
    implements $TabRendererCopyWith<$Res> {
  _$TabRendererCopyWithImpl(this._self, this._then);

  final TabRenderer _self;
  final $Res Function(TabRenderer) _then;

/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? selected = freezed,Object? content = freezed,Object? tabIdentifier = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TabRendererContent?,tabIdentifier: freezed == tabIdentifier ? _self.tabIdentifier : tabIdentifier // ignore: cast_nullable_to_non_nullable
as String?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabRendererContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TabRendererContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [TabRenderer].
extension TabRendererPatterns on TabRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabRenderer value)  $default,){
final _that = this;
switch (_that) {
case _TabRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _TabRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  bool? selected,  TabRendererContent? content,  String? tabIdentifier,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabRenderer() when $default != null:
return $default(_that.title,_that.selected,_that.content,_that.tabIdentifier,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  bool? selected,  TabRendererContent? content,  String? tabIdentifier,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _TabRenderer():
return $default(_that.title,_that.selected,_that.content,_that.tabIdentifier,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  bool? selected,  TabRendererContent? content,  String? tabIdentifier,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _TabRenderer() when $default != null:
return $default(_that.title,_that.selected,_that.content,_that.tabIdentifier,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabRenderer implements TabRenderer {
  const _TabRenderer({this.title, this.selected, this.content, this.tabIdentifier, this.trackingParams});
  factory _TabRenderer.fromJson(Map<String, dynamic> json) => _$TabRendererFromJson(json);

@override final  String? title;
@override final  bool? selected;
@override final  TabRendererContent? content;
@override final  String? tabIdentifier;
@override final  String? trackingParams;

/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabRendererCopyWith<_TabRenderer> get copyWith => __$TabRendererCopyWithImpl<_TabRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabRenderer&&(identical(other.title, title) || other.title == title)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.content, content) || other.content == content)&&(identical(other.tabIdentifier, tabIdentifier) || other.tabIdentifier == tabIdentifier)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,selected,content,tabIdentifier,trackingParams);

@override
String toString() {
  return 'TabRenderer(title: $title, selected: $selected, content: $content, tabIdentifier: $tabIdentifier, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$TabRendererCopyWith<$Res> implements $TabRendererCopyWith<$Res> {
  factory _$TabRendererCopyWith(_TabRenderer value, $Res Function(_TabRenderer) _then) = __$TabRendererCopyWithImpl;
@override @useResult
$Res call({
 String? title, bool? selected, TabRendererContent? content, String? tabIdentifier, String? trackingParams
});


@override $TabRendererContentCopyWith<$Res>? get content;

}
/// @nodoc
class __$TabRendererCopyWithImpl<$Res>
    implements _$TabRendererCopyWith<$Res> {
  __$TabRendererCopyWithImpl(this._self, this._then);

  final _TabRenderer _self;
  final $Res Function(_TabRenderer) _then;

/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? selected = freezed,Object? content = freezed,Object? tabIdentifier = freezed,Object? trackingParams = freezed,}) {
  return _then(_TabRenderer(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TabRendererContent?,tabIdentifier: freezed == tabIdentifier ? _self.tabIdentifier : tabIdentifier // ignore: cast_nullable_to_non_nullable
as String?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TabRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabRendererContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TabRendererContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
mixin _$TabRendererContent {

 SectionListRenderer? get sectionListRenderer;
/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabRendererContentCopyWith<TabRendererContent> get copyWith => _$TabRendererContentCopyWithImpl<TabRendererContent>(this as TabRendererContent, _$identity);

  /// Serializes this TabRendererContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabRendererContent&&(identical(other.sectionListRenderer, sectionListRenderer) || other.sectionListRenderer == sectionListRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sectionListRenderer);

@override
String toString() {
  return 'TabRendererContent(sectionListRenderer: $sectionListRenderer)';
}


}

/// @nodoc
abstract mixin class $TabRendererContentCopyWith<$Res>  {
  factory $TabRendererContentCopyWith(TabRendererContent value, $Res Function(TabRendererContent) _then) = _$TabRendererContentCopyWithImpl;
@useResult
$Res call({
 SectionListRenderer? sectionListRenderer
});


$SectionListRendererCopyWith<$Res>? get sectionListRenderer;

}
/// @nodoc
class _$TabRendererContentCopyWithImpl<$Res>
    implements $TabRendererContentCopyWith<$Res> {
  _$TabRendererContentCopyWithImpl(this._self, this._then);

  final TabRendererContent _self;
  final $Res Function(TabRendererContent) _then;

/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sectionListRenderer = freezed,}) {
  return _then(_self.copyWith(
sectionListRenderer: freezed == sectionListRenderer ? _self.sectionListRenderer : sectionListRenderer // ignore: cast_nullable_to_non_nullable
as SectionListRenderer?,
  ));
}
/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionListRendererCopyWith<$Res>? get sectionListRenderer {
    if (_self.sectionListRenderer == null) {
    return null;
  }

  return $SectionListRendererCopyWith<$Res>(_self.sectionListRenderer!, (value) {
    return _then(_self.copyWith(sectionListRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [TabRendererContent].
extension TabRendererContentPatterns on TabRendererContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabRendererContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabRendererContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabRendererContent value)  $default,){
final _that = this;
switch (_that) {
case _TabRendererContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabRendererContent value)?  $default,){
final _that = this;
switch (_that) {
case _TabRendererContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionListRenderer? sectionListRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabRendererContent() when $default != null:
return $default(_that.sectionListRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionListRenderer? sectionListRenderer)  $default,) {final _that = this;
switch (_that) {
case _TabRendererContent():
return $default(_that.sectionListRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionListRenderer? sectionListRenderer)?  $default,) {final _that = this;
switch (_that) {
case _TabRendererContent() when $default != null:
return $default(_that.sectionListRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabRendererContent implements TabRendererContent {
  const _TabRendererContent({this.sectionListRenderer});
  factory _TabRendererContent.fromJson(Map<String, dynamic> json) => _$TabRendererContentFromJson(json);

@override final  SectionListRenderer? sectionListRenderer;

/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabRendererContentCopyWith<_TabRendererContent> get copyWith => __$TabRendererContentCopyWithImpl<_TabRendererContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabRendererContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabRendererContent&&(identical(other.sectionListRenderer, sectionListRenderer) || other.sectionListRenderer == sectionListRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sectionListRenderer);

@override
String toString() {
  return 'TabRendererContent(sectionListRenderer: $sectionListRenderer)';
}


}

/// @nodoc
abstract mixin class _$TabRendererContentCopyWith<$Res> implements $TabRendererContentCopyWith<$Res> {
  factory _$TabRendererContentCopyWith(_TabRendererContent value, $Res Function(_TabRendererContent) _then) = __$TabRendererContentCopyWithImpl;
@override @useResult
$Res call({
 SectionListRenderer? sectionListRenderer
});


@override $SectionListRendererCopyWith<$Res>? get sectionListRenderer;

}
/// @nodoc
class __$TabRendererContentCopyWithImpl<$Res>
    implements _$TabRendererContentCopyWith<$Res> {
  __$TabRendererContentCopyWithImpl(this._self, this._then);

  final _TabRendererContent _self;
  final $Res Function(_TabRendererContent) _then;

/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sectionListRenderer = freezed,}) {
  return _then(_TabRendererContent(
sectionListRenderer: freezed == sectionListRenderer ? _self.sectionListRenderer : sectionListRenderer // ignore: cast_nullable_to_non_nullable
as SectionListRenderer?,
  ));
}

/// Create a copy of TabRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionListRendererCopyWith<$Res>? get sectionListRenderer {
    if (_self.sectionListRenderer == null) {
    return null;
  }

  return $SectionListRendererCopyWith<$Res>(_self.sectionListRenderer!, (value) {
    return _then(_self.copyWith(sectionListRenderer: value));
  });
}
}


/// @nodoc
mixin _$SectionListRenderer {

 List<SectionListRendererContent>? get contents; String? get trackingParams; Header? get header;
/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionListRendererCopyWith<SectionListRenderer> get copyWith => _$SectionListRendererCopyWithImpl<SectionListRenderer>(this as SectionListRenderer, _$identity);

  /// Serializes this SectionListRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionListRenderer&&const DeepCollectionEquality().equals(other.contents, contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.header, header) || other.header == header));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contents),trackingParams,header);

@override
String toString() {
  return 'SectionListRenderer(contents: $contents, trackingParams: $trackingParams, header: $header)';
}


}

/// @nodoc
abstract mixin class $SectionListRendererCopyWith<$Res>  {
  factory $SectionListRendererCopyWith(SectionListRenderer value, $Res Function(SectionListRenderer) _then) = _$SectionListRendererCopyWithImpl;
@useResult
$Res call({
 List<SectionListRendererContent>? contents, String? trackingParams, Header? header
});


$HeaderCopyWith<$Res>? get header;

}
/// @nodoc
class _$SectionListRendererCopyWithImpl<$Res>
    implements $SectionListRendererCopyWith<$Res> {
  _$SectionListRendererCopyWithImpl(this._self, this._then);

  final SectionListRenderer _self;
  final $Res Function(SectionListRenderer) _then;

/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = freezed,Object? trackingParams = freezed,Object? header = freezed,}) {
  return _then(_self.copyWith(
contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<SectionListRendererContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as Header?,
  ));
}
/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeaderCopyWith<$Res>? get header {
    if (_self.header == null) {
    return null;
  }

  return $HeaderCopyWith<$Res>(_self.header!, (value) {
    return _then(_self.copyWith(header: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionListRenderer].
extension SectionListRendererPatterns on SectionListRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionListRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionListRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionListRenderer value)  $default,){
final _that = this;
switch (_that) {
case _SectionListRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionListRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _SectionListRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SectionListRendererContent>? contents,  String? trackingParams,  Header? header)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionListRenderer() when $default != null:
return $default(_that.contents,_that.trackingParams,_that.header);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SectionListRendererContent>? contents,  String? trackingParams,  Header? header)  $default,) {final _that = this;
switch (_that) {
case _SectionListRenderer():
return $default(_that.contents,_that.trackingParams,_that.header);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SectionListRendererContent>? contents,  String? trackingParams,  Header? header)?  $default,) {final _that = this;
switch (_that) {
case _SectionListRenderer() when $default != null:
return $default(_that.contents,_that.trackingParams,_that.header);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionListRenderer implements SectionListRenderer {
  const _SectionListRenderer({final  List<SectionListRendererContent>? contents, this.trackingParams, this.header}): _contents = contents;
  factory _SectionListRenderer.fromJson(Map<String, dynamic> json) => _$SectionListRendererFromJson(json);

 final  List<SectionListRendererContent>? _contents;
@override List<SectionListRendererContent>? get contents {
  final value = _contents;
  if (value == null) return null;
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? trackingParams;
@override final  Header? header;

/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionListRendererCopyWith<_SectionListRenderer> get copyWith => __$SectionListRendererCopyWithImpl<_SectionListRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionListRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionListRenderer&&const DeepCollectionEquality().equals(other._contents, _contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.header, header) || other.header == header));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents),trackingParams,header);

@override
String toString() {
  return 'SectionListRenderer(contents: $contents, trackingParams: $trackingParams, header: $header)';
}


}

/// @nodoc
abstract mixin class _$SectionListRendererCopyWith<$Res> implements $SectionListRendererCopyWith<$Res> {
  factory _$SectionListRendererCopyWith(_SectionListRenderer value, $Res Function(_SectionListRenderer) _then) = __$SectionListRendererCopyWithImpl;
@override @useResult
$Res call({
 List<SectionListRendererContent>? contents, String? trackingParams, Header? header
});


@override $HeaderCopyWith<$Res>? get header;

}
/// @nodoc
class __$SectionListRendererCopyWithImpl<$Res>
    implements _$SectionListRendererCopyWith<$Res> {
  __$SectionListRendererCopyWithImpl(this._self, this._then);

  final _SectionListRenderer _self;
  final $Res Function(_SectionListRenderer) _then;

/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = freezed,Object? trackingParams = freezed,Object? header = freezed,}) {
  return _then(_SectionListRenderer(
contents: freezed == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<SectionListRendererContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as Header?,
  ));
}

/// Create a copy of SectionListRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeaderCopyWith<$Res>? get header {
    if (_self.header == null) {
    return null;
  }

  return $HeaderCopyWith<$Res>(_self.header!, (value) {
    return _then(_self.copyWith(header: value));
  });
}
}


/// @nodoc
mixin _$SectionListRendererContent {

 MusicShelfRenderer? get musicShelfRenderer;
/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionListRendererContentCopyWith<SectionListRendererContent> get copyWith => _$SectionListRendererContentCopyWithImpl<SectionListRendererContent>(this as SectionListRendererContent, _$identity);

  /// Serializes this SectionListRendererContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionListRendererContent&&(identical(other.musicShelfRenderer, musicShelfRenderer) || other.musicShelfRenderer == musicShelfRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicShelfRenderer);

@override
String toString() {
  return 'SectionListRendererContent(musicShelfRenderer: $musicShelfRenderer)';
}


}

/// @nodoc
abstract mixin class $SectionListRendererContentCopyWith<$Res>  {
  factory $SectionListRendererContentCopyWith(SectionListRendererContent value, $Res Function(SectionListRendererContent) _then) = _$SectionListRendererContentCopyWithImpl;
@useResult
$Res call({
 MusicShelfRenderer? musicShelfRenderer
});


$MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer;

}
/// @nodoc
class _$SectionListRendererContentCopyWithImpl<$Res>
    implements $SectionListRendererContentCopyWith<$Res> {
  _$SectionListRendererContentCopyWithImpl(this._self, this._then);

  final SectionListRendererContent _self;
  final $Res Function(SectionListRendererContent) _then;

/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicShelfRenderer = freezed,}) {
  return _then(_self.copyWith(
musicShelfRenderer: freezed == musicShelfRenderer ? _self.musicShelfRenderer : musicShelfRenderer // ignore: cast_nullable_to_non_nullable
as MusicShelfRenderer?,
  ));
}
/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer {
    if (_self.musicShelfRenderer == null) {
    return null;
  }

  return $MusicShelfRendererCopyWith<$Res>(_self.musicShelfRenderer!, (value) {
    return _then(_self.copyWith(musicShelfRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionListRendererContent].
extension SectionListRendererContentPatterns on SectionListRendererContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionListRendererContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionListRendererContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionListRendererContent value)  $default,){
final _that = this;
switch (_that) {
case _SectionListRendererContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionListRendererContent value)?  $default,){
final _that = this;
switch (_that) {
case _SectionListRendererContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicShelfRenderer? musicShelfRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionListRendererContent() when $default != null:
return $default(_that.musicShelfRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicShelfRenderer? musicShelfRenderer)  $default,) {final _that = this;
switch (_that) {
case _SectionListRendererContent():
return $default(_that.musicShelfRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicShelfRenderer? musicShelfRenderer)?  $default,) {final _that = this;
switch (_that) {
case _SectionListRendererContent() when $default != null:
return $default(_that.musicShelfRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionListRendererContent implements SectionListRendererContent {
  const _SectionListRendererContent({this.musicShelfRenderer});
  factory _SectionListRendererContent.fromJson(Map<String, dynamic> json) => _$SectionListRendererContentFromJson(json);

@override final  MusicShelfRenderer? musicShelfRenderer;

/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionListRendererContentCopyWith<_SectionListRendererContent> get copyWith => __$SectionListRendererContentCopyWithImpl<_SectionListRendererContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionListRendererContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionListRendererContent&&(identical(other.musicShelfRenderer, musicShelfRenderer) || other.musicShelfRenderer == musicShelfRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicShelfRenderer);

@override
String toString() {
  return 'SectionListRendererContent(musicShelfRenderer: $musicShelfRenderer)';
}


}

/// @nodoc
abstract mixin class _$SectionListRendererContentCopyWith<$Res> implements $SectionListRendererContentCopyWith<$Res> {
  factory _$SectionListRendererContentCopyWith(_SectionListRendererContent value, $Res Function(_SectionListRendererContent) _then) = __$SectionListRendererContentCopyWithImpl;
@override @useResult
$Res call({
 MusicShelfRenderer? musicShelfRenderer
});


@override $MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer;

}
/// @nodoc
class __$SectionListRendererContentCopyWithImpl<$Res>
    implements _$SectionListRendererContentCopyWith<$Res> {
  __$SectionListRendererContentCopyWithImpl(this._self, this._then);

  final _SectionListRendererContent _self;
  final $Res Function(_SectionListRendererContent) _then;

/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicShelfRenderer = freezed,}) {
  return _then(_SectionListRendererContent(
musicShelfRenderer: freezed == musicShelfRenderer ? _self.musicShelfRenderer : musicShelfRenderer // ignore: cast_nullable_to_non_nullable
as MusicShelfRenderer?,
  ));
}

/// Create a copy of SectionListRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer {
    if (_self.musicShelfRenderer == null) {
    return null;
  }

  return $MusicShelfRendererCopyWith<$Res>(_self.musicShelfRenderer!, (value) {
    return _then(_self.copyWith(musicShelfRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicShelfRenderer {

 Title? get title; List<MusicShelfRendererContent>? get contents; String? get trackingParams; List<Continuation>? get continuations; ShelfDivider? get shelfDivider;
/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicShelfRendererCopyWith<MusicShelfRenderer> get copyWith => _$MusicShelfRendererCopyWithImpl<MusicShelfRenderer>(this as MusicShelfRenderer, _$identity);

  /// Serializes this MusicShelfRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicShelfRenderer&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.contents, contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&const DeepCollectionEquality().equals(other.continuations, continuations)&&(identical(other.shelfDivider, shelfDivider) || other.shelfDivider == shelfDivider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(contents),trackingParams,const DeepCollectionEquality().hash(continuations),shelfDivider);

@override
String toString() {
  return 'MusicShelfRenderer(title: $title, contents: $contents, trackingParams: $trackingParams, continuations: $continuations, shelfDivider: $shelfDivider)';
}


}

/// @nodoc
abstract mixin class $MusicShelfRendererCopyWith<$Res>  {
  factory $MusicShelfRendererCopyWith(MusicShelfRenderer value, $Res Function(MusicShelfRenderer) _then) = _$MusicShelfRendererCopyWithImpl;
@useResult
$Res call({
 Title? title, List<MusicShelfRendererContent>? contents, String? trackingParams, List<Continuation>? continuations, ShelfDivider? shelfDivider
});


$TitleCopyWith<$Res>? get title;$ShelfDividerCopyWith<$Res>? get shelfDivider;

}
/// @nodoc
class _$MusicShelfRendererCopyWithImpl<$Res>
    implements $MusicShelfRendererCopyWith<$Res> {
  _$MusicShelfRendererCopyWithImpl(this._self, this._then);

  final MusicShelfRenderer _self;
  final $Res Function(MusicShelfRenderer) _then;

/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? contents = freezed,Object? trackingParams = freezed,Object? continuations = freezed,Object? shelfDivider = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<MusicShelfRendererContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,continuations: freezed == continuations ? _self.continuations : continuations // ignore: cast_nullable_to_non_nullable
as List<Continuation>?,shelfDivider: freezed == shelfDivider ? _self.shelfDivider : shelfDivider // ignore: cast_nullable_to_non_nullable
as ShelfDivider?,
  ));
}
/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShelfDividerCopyWith<$Res>? get shelfDivider {
    if (_self.shelfDivider == null) {
    return null;
  }

  return $ShelfDividerCopyWith<$Res>(_self.shelfDivider!, (value) {
    return _then(_self.copyWith(shelfDivider: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicShelfRenderer].
extension MusicShelfRendererPatterns on MusicShelfRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicShelfRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicShelfRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicShelfRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicShelfRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicShelfRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicShelfRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? title,  List<MusicShelfRendererContent>? contents,  String? trackingParams,  List<Continuation>? continuations,  ShelfDivider? shelfDivider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicShelfRenderer() when $default != null:
return $default(_that.title,_that.contents,_that.trackingParams,_that.continuations,_that.shelfDivider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? title,  List<MusicShelfRendererContent>? contents,  String? trackingParams,  List<Continuation>? continuations,  ShelfDivider? shelfDivider)  $default,) {final _that = this;
switch (_that) {
case _MusicShelfRenderer():
return $default(_that.title,_that.contents,_that.trackingParams,_that.continuations,_that.shelfDivider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? title,  List<MusicShelfRendererContent>? contents,  String? trackingParams,  List<Continuation>? continuations,  ShelfDivider? shelfDivider)?  $default,) {final _that = this;
switch (_that) {
case _MusicShelfRenderer() when $default != null:
return $default(_that.title,_that.contents,_that.trackingParams,_that.continuations,_that.shelfDivider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicShelfRenderer implements MusicShelfRenderer {
  const _MusicShelfRenderer({this.title, final  List<MusicShelfRendererContent>? contents, this.trackingParams, final  List<Continuation>? continuations, this.shelfDivider}): _contents = contents,_continuations = continuations;
  factory _MusicShelfRenderer.fromJson(Map<String, dynamic> json) => _$MusicShelfRendererFromJson(json);

@override final  Title? title;
 final  List<MusicShelfRendererContent>? _contents;
@override List<MusicShelfRendererContent>? get contents {
  final value = _contents;
  if (value == null) return null;
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? trackingParams;
 final  List<Continuation>? _continuations;
@override List<Continuation>? get continuations {
  final value = _continuations;
  if (value == null) return null;
  if (_continuations is EqualUnmodifiableListView) return _continuations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ShelfDivider? shelfDivider;

/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicShelfRendererCopyWith<_MusicShelfRenderer> get copyWith => __$MusicShelfRendererCopyWithImpl<_MusicShelfRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicShelfRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicShelfRenderer&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._contents, _contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&const DeepCollectionEquality().equals(other._continuations, _continuations)&&(identical(other.shelfDivider, shelfDivider) || other.shelfDivider == shelfDivider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_contents),trackingParams,const DeepCollectionEquality().hash(_continuations),shelfDivider);

@override
String toString() {
  return 'MusicShelfRenderer(title: $title, contents: $contents, trackingParams: $trackingParams, continuations: $continuations, shelfDivider: $shelfDivider)';
}


}

/// @nodoc
abstract mixin class _$MusicShelfRendererCopyWith<$Res> implements $MusicShelfRendererCopyWith<$Res> {
  factory _$MusicShelfRendererCopyWith(_MusicShelfRenderer value, $Res Function(_MusicShelfRenderer) _then) = __$MusicShelfRendererCopyWithImpl;
@override @useResult
$Res call({
 Title? title, List<MusicShelfRendererContent>? contents, String? trackingParams, List<Continuation>? continuations, ShelfDivider? shelfDivider
});


@override $TitleCopyWith<$Res>? get title;@override $ShelfDividerCopyWith<$Res>? get shelfDivider;

}
/// @nodoc
class __$MusicShelfRendererCopyWithImpl<$Res>
    implements _$MusicShelfRendererCopyWith<$Res> {
  __$MusicShelfRendererCopyWithImpl(this._self, this._then);

  final _MusicShelfRenderer _self;
  final $Res Function(_MusicShelfRenderer) _then;

/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? contents = freezed,Object? trackingParams = freezed,Object? continuations = freezed,Object? shelfDivider = freezed,}) {
  return _then(_MusicShelfRenderer(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,contents: freezed == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<MusicShelfRendererContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,continuations: freezed == continuations ? _self._continuations : continuations // ignore: cast_nullable_to_non_nullable
as List<Continuation>?,shelfDivider: freezed == shelfDivider ? _self.shelfDivider : shelfDivider // ignore: cast_nullable_to_non_nullable
as ShelfDivider?,
  ));
}

/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of MusicShelfRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShelfDividerCopyWith<$Res>? get shelfDivider {
    if (_self.shelfDivider == null) {
    return null;
  }

  return $ShelfDividerCopyWith<$Res>(_self.shelfDivider!, (value) {
    return _then(_self.copyWith(shelfDivider: value));
  });
}
}


/// @nodoc
mixin _$MusicResponsiveListItemRenderer {

 String? get trackingParams; MusicResponsiveListItemRendererThumbnail? get thumbnail; Overlay? get overlay; List<FlexColumn>? get flexColumns; Menu? get menu; PlaylistItemData? get playlistItemData; String? get flexColumnDisplayStyle; String? get itemHeight; List<Badge>? get badges;
/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicResponsiveListItemRendererCopyWith<MusicResponsiveListItemRenderer> get copyWith => _$MusicResponsiveListItemRendererCopyWithImpl<MusicResponsiveListItemRenderer>(this as MusicResponsiveListItemRenderer, _$identity);

  /// Serializes this MusicResponsiveListItemRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicResponsiveListItemRenderer&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&const DeepCollectionEquality().equals(other.flexColumns, flexColumns)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.playlistItemData, playlistItemData) || other.playlistItemData == playlistItemData)&&(identical(other.flexColumnDisplayStyle, flexColumnDisplayStyle) || other.flexColumnDisplayStyle == flexColumnDisplayStyle)&&(identical(other.itemHeight, itemHeight) || other.itemHeight == itemHeight)&&const DeepCollectionEquality().equals(other.badges, badges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackingParams,thumbnail,overlay,const DeepCollectionEquality().hash(flexColumns),menu,playlistItemData,flexColumnDisplayStyle,itemHeight,const DeepCollectionEquality().hash(badges));

@override
String toString() {
  return 'MusicResponsiveListItemRenderer(trackingParams: $trackingParams, thumbnail: $thumbnail, overlay: $overlay, flexColumns: $flexColumns, menu: $menu, playlistItemData: $playlistItemData, flexColumnDisplayStyle: $flexColumnDisplayStyle, itemHeight: $itemHeight, badges: $badges)';
}


}

/// @nodoc
abstract mixin class $MusicResponsiveListItemRendererCopyWith<$Res>  {
  factory $MusicResponsiveListItemRendererCopyWith(MusicResponsiveListItemRenderer value, $Res Function(MusicResponsiveListItemRenderer) _then) = _$MusicResponsiveListItemRendererCopyWithImpl;
@useResult
$Res call({
 String? trackingParams, MusicResponsiveListItemRendererThumbnail? thumbnail, Overlay? overlay, List<FlexColumn>? flexColumns, Menu? menu, PlaylistItemData? playlistItemData, String? flexColumnDisplayStyle, String? itemHeight, List<Badge>? badges
});


$MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail;$OverlayCopyWith<$Res>? get overlay;$MenuCopyWith<$Res>? get menu;$PlaylistItemDataCopyWith<$Res>? get playlistItemData;

}
/// @nodoc
class _$MusicResponsiveListItemRendererCopyWithImpl<$Res>
    implements $MusicResponsiveListItemRendererCopyWith<$Res> {
  _$MusicResponsiveListItemRendererCopyWithImpl(this._self, this._then);

  final MusicResponsiveListItemRenderer _self;
  final $Res Function(MusicResponsiveListItemRenderer) _then;

/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackingParams = freezed,Object? thumbnail = freezed,Object? overlay = freezed,Object? flexColumns = freezed,Object? menu = freezed,Object? playlistItemData = freezed,Object? flexColumnDisplayStyle = freezed,Object? itemHeight = freezed,Object? badges = freezed,}) {
  return _then(_self.copyWith(
trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MusicResponsiveListItemRendererThumbnail?,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay?,flexColumns: freezed == flexColumns ? _self.flexColumns : flexColumns // ignore: cast_nullable_to_non_nullable
as List<FlexColumn>?,menu: freezed == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as Menu?,playlistItemData: freezed == playlistItemData ? _self.playlistItemData : playlistItemData // ignore: cast_nullable_to_non_nullable
as PlaylistItemData?,flexColumnDisplayStyle: freezed == flexColumnDisplayStyle ? _self.flexColumnDisplayStyle : flexColumnDisplayStyle // ignore: cast_nullable_to_non_nullable
as String?,itemHeight: freezed == itemHeight ? _self.itemHeight : itemHeight // ignore: cast_nullable_to_non_nullable
as String?,badges: freezed == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<Badge>?,
  ));
}
/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayCopyWith<$Res>? get overlay {
    if (_self.overlay == null) {
    return null;
  }

  return $OverlayCopyWith<$Res>(_self.overlay!, (value) {
    return _then(_self.copyWith(overlay: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuCopyWith<$Res>? get menu {
    if (_self.menu == null) {
    return null;
  }

  return $MenuCopyWith<$Res>(_self.menu!, (value) {
    return _then(_self.copyWith(menu: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistItemDataCopyWith<$Res>? get playlistItemData {
    if (_self.playlistItemData == null) {
    return null;
  }

  return $PlaylistItemDataCopyWith<$Res>(_self.playlistItemData!, (value) {
    return _then(_self.copyWith(playlistItemData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicResponsiveListItemRenderer].
extension MusicResponsiveListItemRendererPatterns on MusicResponsiveListItemRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicResponsiveListItemRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicResponsiveListItemRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicResponsiveListItemRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? trackingParams,  MusicResponsiveListItemRendererThumbnail? thumbnail,  Overlay? overlay,  List<FlexColumn>? flexColumns,  Menu? menu,  PlaylistItemData? playlistItemData,  String? flexColumnDisplayStyle,  String? itemHeight,  List<Badge>? badges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer() when $default != null:
return $default(_that.trackingParams,_that.thumbnail,_that.overlay,_that.flexColumns,_that.menu,_that.playlistItemData,_that.flexColumnDisplayStyle,_that.itemHeight,_that.badges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? trackingParams,  MusicResponsiveListItemRendererThumbnail? thumbnail,  Overlay? overlay,  List<FlexColumn>? flexColumns,  Menu? menu,  PlaylistItemData? playlistItemData,  String? flexColumnDisplayStyle,  String? itemHeight,  List<Badge>? badges)  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer():
return $default(_that.trackingParams,_that.thumbnail,_that.overlay,_that.flexColumns,_that.menu,_that.playlistItemData,_that.flexColumnDisplayStyle,_that.itemHeight,_that.badges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? trackingParams,  MusicResponsiveListItemRendererThumbnail? thumbnail,  Overlay? overlay,  List<FlexColumn>? flexColumns,  Menu? menu,  PlaylistItemData? playlistItemData,  String? flexColumnDisplayStyle,  String? itemHeight,  List<Badge>? badges)?  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRenderer() when $default != null:
return $default(_that.trackingParams,_that.thumbnail,_that.overlay,_that.flexColumns,_that.menu,_that.playlistItemData,_that.flexColumnDisplayStyle,_that.itemHeight,_that.badges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicResponsiveListItemRenderer implements MusicResponsiveListItemRenderer {
  const _MusicResponsiveListItemRenderer({this.trackingParams, this.thumbnail, this.overlay, final  List<FlexColumn>? flexColumns, this.menu, this.playlistItemData, this.flexColumnDisplayStyle, this.itemHeight, final  List<Badge>? badges}): _flexColumns = flexColumns,_badges = badges;
  factory _MusicResponsiveListItemRenderer.fromJson(Map<String, dynamic> json) => _$MusicResponsiveListItemRendererFromJson(json);

@override final  String? trackingParams;
@override final  MusicResponsiveListItemRendererThumbnail? thumbnail;
@override final  Overlay? overlay;
 final  List<FlexColumn>? _flexColumns;
@override List<FlexColumn>? get flexColumns {
  final value = _flexColumns;
  if (value == null) return null;
  if (_flexColumns is EqualUnmodifiableListView) return _flexColumns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Menu? menu;
@override final  PlaylistItemData? playlistItemData;
@override final  String? flexColumnDisplayStyle;
@override final  String? itemHeight;
 final  List<Badge>? _badges;
@override List<Badge>? get badges {
  final value = _badges;
  if (value == null) return null;
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicResponsiveListItemRendererCopyWith<_MusicResponsiveListItemRenderer> get copyWith => __$MusicResponsiveListItemRendererCopyWithImpl<_MusicResponsiveListItemRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicResponsiveListItemRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicResponsiveListItemRenderer&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&const DeepCollectionEquality().equals(other._flexColumns, _flexColumns)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.playlistItemData, playlistItemData) || other.playlistItemData == playlistItemData)&&(identical(other.flexColumnDisplayStyle, flexColumnDisplayStyle) || other.flexColumnDisplayStyle == flexColumnDisplayStyle)&&(identical(other.itemHeight, itemHeight) || other.itemHeight == itemHeight)&&const DeepCollectionEquality().equals(other._badges, _badges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackingParams,thumbnail,overlay,const DeepCollectionEquality().hash(_flexColumns),menu,playlistItemData,flexColumnDisplayStyle,itemHeight,const DeepCollectionEquality().hash(_badges));

@override
String toString() {
  return 'MusicResponsiveListItemRenderer(trackingParams: $trackingParams, thumbnail: $thumbnail, overlay: $overlay, flexColumns: $flexColumns, menu: $menu, playlistItemData: $playlistItemData, flexColumnDisplayStyle: $flexColumnDisplayStyle, itemHeight: $itemHeight, badges: $badges)';
}


}

/// @nodoc
abstract mixin class _$MusicResponsiveListItemRendererCopyWith<$Res> implements $MusicResponsiveListItemRendererCopyWith<$Res> {
  factory _$MusicResponsiveListItemRendererCopyWith(_MusicResponsiveListItemRenderer value, $Res Function(_MusicResponsiveListItemRenderer) _then) = __$MusicResponsiveListItemRendererCopyWithImpl;
@override @useResult
$Res call({
 String? trackingParams, MusicResponsiveListItemRendererThumbnail? thumbnail, Overlay? overlay, List<FlexColumn>? flexColumns, Menu? menu, PlaylistItemData? playlistItemData, String? flexColumnDisplayStyle, String? itemHeight, List<Badge>? badges
});


@override $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail;@override $OverlayCopyWith<$Res>? get overlay;@override $MenuCopyWith<$Res>? get menu;@override $PlaylistItemDataCopyWith<$Res>? get playlistItemData;

}
/// @nodoc
class __$MusicResponsiveListItemRendererCopyWithImpl<$Res>
    implements _$MusicResponsiveListItemRendererCopyWith<$Res> {
  __$MusicResponsiveListItemRendererCopyWithImpl(this._self, this._then);

  final _MusicResponsiveListItemRenderer _self;
  final $Res Function(_MusicResponsiveListItemRenderer) _then;

/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackingParams = freezed,Object? thumbnail = freezed,Object? overlay = freezed,Object? flexColumns = freezed,Object? menu = freezed,Object? playlistItemData = freezed,Object? flexColumnDisplayStyle = freezed,Object? itemHeight = freezed,Object? badges = freezed,}) {
  return _then(_MusicResponsiveListItemRenderer(
trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MusicResponsiveListItemRendererThumbnail?,overlay: freezed == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Overlay?,flexColumns: freezed == flexColumns ? _self._flexColumns : flexColumns // ignore: cast_nullable_to_non_nullable
as List<FlexColumn>?,menu: freezed == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as Menu?,playlistItemData: freezed == playlistItemData ? _self.playlistItemData : playlistItemData // ignore: cast_nullable_to_non_nullable
as PlaylistItemData?,flexColumnDisplayStyle: freezed == flexColumnDisplayStyle ? _self.flexColumnDisplayStyle : flexColumnDisplayStyle // ignore: cast_nullable_to_non_nullable
as String?,itemHeight: freezed == itemHeight ? _self.itemHeight : itemHeight // ignore: cast_nullable_to_non_nullable
as String?,badges: freezed == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<Badge>?,
  ));
}

/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayCopyWith<$Res>? get overlay {
    if (_self.overlay == null) {
    return null;
  }

  return $OverlayCopyWith<$Res>(_self.overlay!, (value) {
    return _then(_self.copyWith(overlay: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuCopyWith<$Res>? get menu {
    if (_self.menu == null) {
    return null;
  }

  return $MenuCopyWith<$Res>(_self.menu!, (value) {
    return _then(_self.copyWith(menu: value));
  });
}/// Create a copy of MusicResponsiveListItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistItemDataCopyWith<$Res>? get playlistItemData {
    if (_self.playlistItemData == null) {
    return null;
  }

  return $PlaylistItemDataCopyWith<$Res>(_self.playlistItemData!, (value) {
    return _then(_self.copyWith(playlistItemData: value));
  });
}
}


/// @nodoc
mixin _$Badge {

 MusicInlineBadgeRenderer? get musicInlineBadgeRenderer;
/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeCopyWith<Badge> get copyWith => _$BadgeCopyWithImpl<Badge>(this as Badge, _$identity);

  /// Serializes this Badge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Badge&&(identical(other.musicInlineBadgeRenderer, musicInlineBadgeRenderer) || other.musicInlineBadgeRenderer == musicInlineBadgeRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicInlineBadgeRenderer);

@override
String toString() {
  return 'Badge(musicInlineBadgeRenderer: $musicInlineBadgeRenderer)';
}


}

/// @nodoc
abstract mixin class $BadgeCopyWith<$Res>  {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) _then) = _$BadgeCopyWithImpl;
@useResult
$Res call({
 MusicInlineBadgeRenderer? musicInlineBadgeRenderer
});


$MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer;

}
/// @nodoc
class _$BadgeCopyWithImpl<$Res>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._self, this._then);

  final Badge _self;
  final $Res Function(Badge) _then;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicInlineBadgeRenderer = freezed,}) {
  return _then(_self.copyWith(
musicInlineBadgeRenderer: freezed == musicInlineBadgeRenderer ? _self.musicInlineBadgeRenderer : musicInlineBadgeRenderer // ignore: cast_nullable_to_non_nullable
as MusicInlineBadgeRenderer?,
  ));
}
/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer {
    if (_self.musicInlineBadgeRenderer == null) {
    return null;
  }

  return $MusicInlineBadgeRendererCopyWith<$Res>(_self.musicInlineBadgeRenderer!, (value) {
    return _then(_self.copyWith(musicInlineBadgeRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Badge].
extension BadgePatterns on Badge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Badge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Badge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Badge value)  $default,){
final _that = this;
switch (_that) {
case _Badge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Badge value)?  $default,){
final _that = this;
switch (_that) {
case _Badge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicInlineBadgeRenderer? musicInlineBadgeRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Badge() when $default != null:
return $default(_that.musicInlineBadgeRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicInlineBadgeRenderer? musicInlineBadgeRenderer)  $default,) {final _that = this;
switch (_that) {
case _Badge():
return $default(_that.musicInlineBadgeRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicInlineBadgeRenderer? musicInlineBadgeRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Badge() when $default != null:
return $default(_that.musicInlineBadgeRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Badge implements Badge {
  const _Badge({this.musicInlineBadgeRenderer});
  factory _Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);

@override final  MusicInlineBadgeRenderer? musicInlineBadgeRenderer;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeCopyWith<_Badge> get copyWith => __$BadgeCopyWithImpl<_Badge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Badge&&(identical(other.musicInlineBadgeRenderer, musicInlineBadgeRenderer) || other.musicInlineBadgeRenderer == musicInlineBadgeRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicInlineBadgeRenderer);

@override
String toString() {
  return 'Badge(musicInlineBadgeRenderer: $musicInlineBadgeRenderer)';
}


}

/// @nodoc
abstract mixin class _$BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$BadgeCopyWith(_Badge value, $Res Function(_Badge) _then) = __$BadgeCopyWithImpl;
@override @useResult
$Res call({
 MusicInlineBadgeRenderer? musicInlineBadgeRenderer
});


@override $MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer;

}
/// @nodoc
class __$BadgeCopyWithImpl<$Res>
    implements _$BadgeCopyWith<$Res> {
  __$BadgeCopyWithImpl(this._self, this._then);

  final _Badge _self;
  final $Res Function(_Badge) _then;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicInlineBadgeRenderer = freezed,}) {
  return _then(_Badge(
musicInlineBadgeRenderer: freezed == musicInlineBadgeRenderer ? _self.musicInlineBadgeRenderer : musicInlineBadgeRenderer // ignore: cast_nullable_to_non_nullable
as MusicInlineBadgeRenderer?,
  ));
}

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer {
    if (_self.musicInlineBadgeRenderer == null) {
    return null;
  }

  return $MusicInlineBadgeRendererCopyWith<$Res>(_self.musicInlineBadgeRenderer!, (value) {
    return _then(_self.copyWith(musicInlineBadgeRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicInlineBadgeRenderer {

 String? get trackingParams; Icon? get icon; Accessibility? get accessibilityData;
/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicInlineBadgeRendererCopyWith<MusicInlineBadgeRenderer> get copyWith => _$MusicInlineBadgeRendererCopyWithImpl<MusicInlineBadgeRenderer>(this as MusicInlineBadgeRenderer, _$identity);

  /// Serializes this MusicInlineBadgeRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicInlineBadgeRenderer&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackingParams,icon,accessibilityData);

@override
String toString() {
  return 'MusicInlineBadgeRenderer(trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData)';
}


}

/// @nodoc
abstract mixin class $MusicInlineBadgeRendererCopyWith<$Res>  {
  factory $MusicInlineBadgeRendererCopyWith(MusicInlineBadgeRenderer value, $Res Function(MusicInlineBadgeRenderer) _then) = _$MusicInlineBadgeRendererCopyWithImpl;
@useResult
$Res call({
 String? trackingParams, Icon? icon, Accessibility? accessibilityData
});


$IconCopyWith<$Res>? get icon;$AccessibilityCopyWith<$Res>? get accessibilityData;

}
/// @nodoc
class _$MusicInlineBadgeRendererCopyWithImpl<$Res>
    implements $MusicInlineBadgeRendererCopyWith<$Res> {
  _$MusicInlineBadgeRendererCopyWithImpl(this._self, this._then);

  final MusicInlineBadgeRenderer _self;
  final $Res Function(MusicInlineBadgeRenderer) _then;

/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackingParams = freezed,Object? icon = freezed,Object? accessibilityData = freezed,}) {
  return _then(_self.copyWith(
trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}
/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicInlineBadgeRenderer].
extension MusicInlineBadgeRendererPatterns on MusicInlineBadgeRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicInlineBadgeRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicInlineBadgeRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicInlineBadgeRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? trackingParams,  Icon? icon,  Accessibility? accessibilityData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer() when $default != null:
return $default(_that.trackingParams,_that.icon,_that.accessibilityData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? trackingParams,  Icon? icon,  Accessibility? accessibilityData)  $default,) {final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer():
return $default(_that.trackingParams,_that.icon,_that.accessibilityData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? trackingParams,  Icon? icon,  Accessibility? accessibilityData)?  $default,) {final _that = this;
switch (_that) {
case _MusicInlineBadgeRenderer() when $default != null:
return $default(_that.trackingParams,_that.icon,_that.accessibilityData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicInlineBadgeRenderer implements MusicInlineBadgeRenderer {
  const _MusicInlineBadgeRenderer({this.trackingParams, this.icon, this.accessibilityData});
  factory _MusicInlineBadgeRenderer.fromJson(Map<String, dynamic> json) => _$MusicInlineBadgeRendererFromJson(json);

@override final  String? trackingParams;
@override final  Icon? icon;
@override final  Accessibility? accessibilityData;

/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicInlineBadgeRendererCopyWith<_MusicInlineBadgeRenderer> get copyWith => __$MusicInlineBadgeRendererCopyWithImpl<_MusicInlineBadgeRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicInlineBadgeRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicInlineBadgeRenderer&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackingParams,icon,accessibilityData);

@override
String toString() {
  return 'MusicInlineBadgeRenderer(trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData)';
}


}

/// @nodoc
abstract mixin class _$MusicInlineBadgeRendererCopyWith<$Res> implements $MusicInlineBadgeRendererCopyWith<$Res> {
  factory _$MusicInlineBadgeRendererCopyWith(_MusicInlineBadgeRenderer value, $Res Function(_MusicInlineBadgeRenderer) _then) = __$MusicInlineBadgeRendererCopyWithImpl;
@override @useResult
$Res call({
 String? trackingParams, Icon? icon, Accessibility? accessibilityData
});


@override $IconCopyWith<$Res>? get icon;@override $AccessibilityCopyWith<$Res>? get accessibilityData;

}
/// @nodoc
class __$MusicInlineBadgeRendererCopyWithImpl<$Res>
    implements _$MusicInlineBadgeRendererCopyWith<$Res> {
  __$MusicInlineBadgeRendererCopyWithImpl(this._self, this._then);

  final _MusicInlineBadgeRenderer _self;
  final $Res Function(_MusicInlineBadgeRenderer) _then;

/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackingParams = freezed,Object? icon = freezed,Object? accessibilityData = freezed,}) {
  return _then(_MusicInlineBadgeRenderer(
trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}

/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of MusicInlineBadgeRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}
}


/// @nodoc
mixin _$Accessibility {

 AccessibilityData? get accessibilityData;
/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<Accessibility> get copyWith => _$AccessibilityCopyWithImpl<Accessibility>(this as Accessibility, _$identity);

  /// Serializes this Accessibility to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Accessibility&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessibilityData);

@override
String toString() {
  return 'Accessibility(accessibilityData: $accessibilityData)';
}


}

/// @nodoc
abstract mixin class $AccessibilityCopyWith<$Res>  {
  factory $AccessibilityCopyWith(Accessibility value, $Res Function(Accessibility) _then) = _$AccessibilityCopyWithImpl;
@useResult
$Res call({
 AccessibilityData? accessibilityData
});


$AccessibilityDataCopyWith<$Res>? get accessibilityData;

}
/// @nodoc
class _$AccessibilityCopyWithImpl<$Res>
    implements $AccessibilityCopyWith<$Res> {
  _$AccessibilityCopyWithImpl(this._self, this._then);

  final Accessibility _self;
  final $Res Function(Accessibility) _then;

/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessibilityData = freezed,}) {
  return _then(_self.copyWith(
accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as AccessibilityData?,
  ));
}
/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityDataCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityDataCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Accessibility].
extension AccessibilityPatterns on Accessibility {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Accessibility value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Accessibility() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Accessibility value)  $default,){
final _that = this;
switch (_that) {
case _Accessibility():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Accessibility value)?  $default,){
final _that = this;
switch (_that) {
case _Accessibility() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccessibilityData? accessibilityData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Accessibility() when $default != null:
return $default(_that.accessibilityData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccessibilityData? accessibilityData)  $default,) {final _that = this;
switch (_that) {
case _Accessibility():
return $default(_that.accessibilityData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccessibilityData? accessibilityData)?  $default,) {final _that = this;
switch (_that) {
case _Accessibility() when $default != null:
return $default(_that.accessibilityData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Accessibility implements Accessibility {
  const _Accessibility({this.accessibilityData});
  factory _Accessibility.fromJson(Map<String, dynamic> json) => _$AccessibilityFromJson(json);

@override final  AccessibilityData? accessibilityData;

/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessibilityCopyWith<_Accessibility> get copyWith => __$AccessibilityCopyWithImpl<_Accessibility>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessibilityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Accessibility&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessibilityData);

@override
String toString() {
  return 'Accessibility(accessibilityData: $accessibilityData)';
}


}

/// @nodoc
abstract mixin class _$AccessibilityCopyWith<$Res> implements $AccessibilityCopyWith<$Res> {
  factory _$AccessibilityCopyWith(_Accessibility value, $Res Function(_Accessibility) _then) = __$AccessibilityCopyWithImpl;
@override @useResult
$Res call({
 AccessibilityData? accessibilityData
});


@override $AccessibilityDataCopyWith<$Res>? get accessibilityData;

}
/// @nodoc
class __$AccessibilityCopyWithImpl<$Res>
    implements _$AccessibilityCopyWith<$Res> {
  __$AccessibilityCopyWithImpl(this._self, this._then);

  final _Accessibility _self;
  final $Res Function(_Accessibility) _then;

/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessibilityData = freezed,}) {
  return _then(_Accessibility(
accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as AccessibilityData?,
  ));
}

/// Create a copy of Accessibility
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityDataCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityDataCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}
}


/// @nodoc
mixin _$AccessibilityData {

 String? get label;
/// Create a copy of AccessibilityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessibilityDataCopyWith<AccessibilityData> get copyWith => _$AccessibilityDataCopyWithImpl<AccessibilityData>(this as AccessibilityData, _$identity);

  /// Serializes this AccessibilityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessibilityData&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label);

@override
String toString() {
  return 'AccessibilityData(label: $label)';
}


}

/// @nodoc
abstract mixin class $AccessibilityDataCopyWith<$Res>  {
  factory $AccessibilityDataCopyWith(AccessibilityData value, $Res Function(AccessibilityData) _then) = _$AccessibilityDataCopyWithImpl;
@useResult
$Res call({
 String? label
});




}
/// @nodoc
class _$AccessibilityDataCopyWithImpl<$Res>
    implements $AccessibilityDataCopyWith<$Res> {
  _$AccessibilityDataCopyWithImpl(this._self, this._then);

  final AccessibilityData _self;
  final $Res Function(AccessibilityData) _then;

/// Create a copy of AccessibilityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccessibilityData].
extension AccessibilityDataPatterns on AccessibilityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccessibilityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccessibilityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccessibilityData value)  $default,){
final _that = this;
switch (_that) {
case _AccessibilityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccessibilityData value)?  $default,){
final _that = this;
switch (_that) {
case _AccessibilityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccessibilityData() when $default != null:
return $default(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? label)  $default,) {final _that = this;
switch (_that) {
case _AccessibilityData():
return $default(_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? label)?  $default,) {final _that = this;
switch (_that) {
case _AccessibilityData() when $default != null:
return $default(_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccessibilityData implements AccessibilityData {
  const _AccessibilityData({this.label});
  factory _AccessibilityData.fromJson(Map<String, dynamic> json) => _$AccessibilityDataFromJson(json);

@override final  String? label;

/// Create a copy of AccessibilityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessibilityDataCopyWith<_AccessibilityData> get copyWith => __$AccessibilityDataCopyWithImpl<_AccessibilityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessibilityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessibilityData&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label);

@override
String toString() {
  return 'AccessibilityData(label: $label)';
}


}

/// @nodoc
abstract mixin class _$AccessibilityDataCopyWith<$Res> implements $AccessibilityDataCopyWith<$Res> {
  factory _$AccessibilityDataCopyWith(_AccessibilityData value, $Res Function(_AccessibilityData) _then) = __$AccessibilityDataCopyWithImpl;
@override @useResult
$Res call({
 String? label
});




}
/// @nodoc
class __$AccessibilityDataCopyWithImpl<$Res>
    implements _$AccessibilityDataCopyWith<$Res> {
  __$AccessibilityDataCopyWithImpl(this._self, this._then);

  final _AccessibilityData _self;
  final $Res Function(_AccessibilityData) _then;

/// Create a copy of AccessibilityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,}) {
  return _then(_AccessibilityData(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Icon {

 String? get iconType;
/// Create a copy of Icon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconCopyWith<Icon> get copyWith => _$IconCopyWithImpl<Icon>(this as Icon, _$identity);

  /// Serializes this Icon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Icon&&(identical(other.iconType, iconType) || other.iconType == iconType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iconType);

@override
String toString() {
  return 'Icon(iconType: $iconType)';
}


}

/// @nodoc
abstract mixin class $IconCopyWith<$Res>  {
  factory $IconCopyWith(Icon value, $Res Function(Icon) _then) = _$IconCopyWithImpl;
@useResult
$Res call({
 String? iconType
});




}
/// @nodoc
class _$IconCopyWithImpl<$Res>
    implements $IconCopyWith<$Res> {
  _$IconCopyWithImpl(this._self, this._then);

  final Icon _self;
  final $Res Function(Icon) _then;

/// Create a copy of Icon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iconType = freezed,}) {
  return _then(_self.copyWith(
iconType: freezed == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Icon].
extension IconPatterns on Icon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Icon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Icon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Icon value)  $default,){
final _that = this;
switch (_that) {
case _Icon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Icon value)?  $default,){
final _that = this;
switch (_that) {
case _Icon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? iconType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Icon() when $default != null:
return $default(_that.iconType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? iconType)  $default,) {final _that = this;
switch (_that) {
case _Icon():
return $default(_that.iconType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? iconType)?  $default,) {final _that = this;
switch (_that) {
case _Icon() when $default != null:
return $default(_that.iconType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Icon implements Icon {
  const _Icon({this.iconType});
  factory _Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

@override final  String? iconType;

/// Create a copy of Icon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconCopyWith<_Icon> get copyWith => __$IconCopyWithImpl<_Icon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IconToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Icon&&(identical(other.iconType, iconType) || other.iconType == iconType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iconType);

@override
String toString() {
  return 'Icon(iconType: $iconType)';
}


}

/// @nodoc
abstract mixin class _$IconCopyWith<$Res> implements $IconCopyWith<$Res> {
  factory _$IconCopyWith(_Icon value, $Res Function(_Icon) _then) = __$IconCopyWithImpl;
@override @useResult
$Res call({
 String? iconType
});




}
/// @nodoc
class __$IconCopyWithImpl<$Res>
    implements _$IconCopyWith<$Res> {
  __$IconCopyWithImpl(this._self, this._then);

  final _Icon _self;
  final $Res Function(_Icon) _then;

/// Create a copy of Icon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iconType = freezed,}) {
  return _then(_Icon(
iconType: freezed == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FlexColumn {

 MusicResponsiveListItemFlexColumnRenderer? get musicResponsiveListItemFlexColumnRenderer;
/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlexColumnCopyWith<FlexColumn> get copyWith => _$FlexColumnCopyWithImpl<FlexColumn>(this as FlexColumn, _$identity);

  /// Serializes this FlexColumn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlexColumn&&(identical(other.musicResponsiveListItemFlexColumnRenderer, musicResponsiveListItemFlexColumnRenderer) || other.musicResponsiveListItemFlexColumnRenderer == musicResponsiveListItemFlexColumnRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicResponsiveListItemFlexColumnRenderer);

@override
String toString() {
  return 'FlexColumn(musicResponsiveListItemFlexColumnRenderer: $musicResponsiveListItemFlexColumnRenderer)';
}


}

/// @nodoc
abstract mixin class $FlexColumnCopyWith<$Res>  {
  factory $FlexColumnCopyWith(FlexColumn value, $Res Function(FlexColumn) _then) = _$FlexColumnCopyWithImpl;
@useResult
$Res call({
 MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer
});


$MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>? get musicResponsiveListItemFlexColumnRenderer;

}
/// @nodoc
class _$FlexColumnCopyWithImpl<$Res>
    implements $FlexColumnCopyWith<$Res> {
  _$FlexColumnCopyWithImpl(this._self, this._then);

  final FlexColumn _self;
  final $Res Function(FlexColumn) _then;

/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicResponsiveListItemFlexColumnRenderer = freezed,}) {
  return _then(_self.copyWith(
musicResponsiveListItemFlexColumnRenderer: freezed == musicResponsiveListItemFlexColumnRenderer ? _self.musicResponsiveListItemFlexColumnRenderer : musicResponsiveListItemFlexColumnRenderer // ignore: cast_nullable_to_non_nullable
as MusicResponsiveListItemFlexColumnRenderer?,
  ));
}
/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>? get musicResponsiveListItemFlexColumnRenderer {
    if (_self.musicResponsiveListItemFlexColumnRenderer == null) {
    return null;
  }

  return $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>(_self.musicResponsiveListItemFlexColumnRenderer!, (value) {
    return _then(_self.copyWith(musicResponsiveListItemFlexColumnRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlexColumn].
extension FlexColumnPatterns on FlexColumn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlexColumn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlexColumn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlexColumn value)  $default,){
final _that = this;
switch (_that) {
case _FlexColumn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlexColumn value)?  $default,){
final _that = this;
switch (_that) {
case _FlexColumn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlexColumn() when $default != null:
return $default(_that.musicResponsiveListItemFlexColumnRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer)  $default,) {final _that = this;
switch (_that) {
case _FlexColumn():
return $default(_that.musicResponsiveListItemFlexColumnRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer)?  $default,) {final _that = this;
switch (_that) {
case _FlexColumn() when $default != null:
return $default(_that.musicResponsiveListItemFlexColumnRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlexColumn implements FlexColumn {
  const _FlexColumn({this.musicResponsiveListItemFlexColumnRenderer});
  factory _FlexColumn.fromJson(Map<String, dynamic> json) => _$FlexColumnFromJson(json);

@override final  MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer;

/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlexColumnCopyWith<_FlexColumn> get copyWith => __$FlexColumnCopyWithImpl<_FlexColumn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlexColumnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlexColumn&&(identical(other.musicResponsiveListItemFlexColumnRenderer, musicResponsiveListItemFlexColumnRenderer) || other.musicResponsiveListItemFlexColumnRenderer == musicResponsiveListItemFlexColumnRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicResponsiveListItemFlexColumnRenderer);

@override
String toString() {
  return 'FlexColumn(musicResponsiveListItemFlexColumnRenderer: $musicResponsiveListItemFlexColumnRenderer)';
}


}

/// @nodoc
abstract mixin class _$FlexColumnCopyWith<$Res> implements $FlexColumnCopyWith<$Res> {
  factory _$FlexColumnCopyWith(_FlexColumn value, $Res Function(_FlexColumn) _then) = __$FlexColumnCopyWithImpl;
@override @useResult
$Res call({
 MusicResponsiveListItemFlexColumnRenderer? musicResponsiveListItemFlexColumnRenderer
});


@override $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>? get musicResponsiveListItemFlexColumnRenderer;

}
/// @nodoc
class __$FlexColumnCopyWithImpl<$Res>
    implements _$FlexColumnCopyWith<$Res> {
  __$FlexColumnCopyWithImpl(this._self, this._then);

  final _FlexColumn _self;
  final $Res Function(_FlexColumn) _then;

/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicResponsiveListItemFlexColumnRenderer = freezed,}) {
  return _then(_FlexColumn(
musicResponsiveListItemFlexColumnRenderer: freezed == musicResponsiveListItemFlexColumnRenderer ? _self.musicResponsiveListItemFlexColumnRenderer : musicResponsiveListItemFlexColumnRenderer // ignore: cast_nullable_to_non_nullable
as MusicResponsiveListItemFlexColumnRenderer?,
  ));
}

/// Create a copy of FlexColumn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>? get musicResponsiveListItemFlexColumnRenderer {
    if (_self.musicResponsiveListItemFlexColumnRenderer == null) {
    return null;
  }

  return $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>(_self.musicResponsiveListItemFlexColumnRenderer!, (value) {
    return _then(_self.copyWith(musicResponsiveListItemFlexColumnRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicResponsiveListItemFlexColumnRenderer {

 Text? get text; String? get displayPriority;
/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicResponsiveListItemFlexColumnRendererCopyWith<MusicResponsiveListItemFlexColumnRenderer> get copyWith => _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<MusicResponsiveListItemFlexColumnRenderer>(this as MusicResponsiveListItemFlexColumnRenderer, _$identity);

  /// Serializes this MusicResponsiveListItemFlexColumnRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicResponsiveListItemFlexColumnRenderer&&(identical(other.text, text) || other.text == text)&&(identical(other.displayPriority, displayPriority) || other.displayPriority == displayPriority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,displayPriority);

@override
String toString() {
  return 'MusicResponsiveListItemFlexColumnRenderer(text: $text, displayPriority: $displayPriority)';
}


}

/// @nodoc
abstract mixin class $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>  {
  factory $MusicResponsiveListItemFlexColumnRendererCopyWith(MusicResponsiveListItemFlexColumnRenderer value, $Res Function(MusicResponsiveListItemFlexColumnRenderer) _then) = _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl;
@useResult
$Res call({
 Text? text, String? displayPriority
});


$TextCopyWith<$Res>? get text;

}
/// @nodoc
class _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<$Res>
    implements $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl(this._self, this._then);

  final MusicResponsiveListItemFlexColumnRenderer _self;
  final $Res Function(MusicResponsiveListItemFlexColumnRenderer) _then;

/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? displayPriority = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Text?,displayPriority: freezed == displayPriority ? _self.displayPriority : displayPriority // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TextCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicResponsiveListItemFlexColumnRenderer].
extension MusicResponsiveListItemFlexColumnRendererPatterns on MusicResponsiveListItemFlexColumnRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicResponsiveListItemFlexColumnRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicResponsiveListItemFlexColumnRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicResponsiveListItemFlexColumnRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Text? text,  String? displayPriority)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer() when $default != null:
return $default(_that.text,_that.displayPriority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Text? text,  String? displayPriority)  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer():
return $default(_that.text,_that.displayPriority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Text? text,  String? displayPriority)?  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemFlexColumnRenderer() when $default != null:
return $default(_that.text,_that.displayPriority);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicResponsiveListItemFlexColumnRenderer implements MusicResponsiveListItemFlexColumnRenderer {
  const _MusicResponsiveListItemFlexColumnRenderer({this.text, this.displayPriority});
  factory _MusicResponsiveListItemFlexColumnRenderer.fromJson(Map<String, dynamic> json) => _$MusicResponsiveListItemFlexColumnRendererFromJson(json);

@override final  Text? text;
@override final  String? displayPriority;

/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicResponsiveListItemFlexColumnRendererCopyWith<_MusicResponsiveListItemFlexColumnRenderer> get copyWith => __$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<_MusicResponsiveListItemFlexColumnRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicResponsiveListItemFlexColumnRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicResponsiveListItemFlexColumnRenderer&&(identical(other.text, text) || other.text == text)&&(identical(other.displayPriority, displayPriority) || other.displayPriority == displayPriority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,displayPriority);

@override
String toString() {
  return 'MusicResponsiveListItemFlexColumnRenderer(text: $text, displayPriority: $displayPriority)';
}


}

/// @nodoc
abstract mixin class _$MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> implements $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  factory _$MusicResponsiveListItemFlexColumnRendererCopyWith(_MusicResponsiveListItemFlexColumnRenderer value, $Res Function(_MusicResponsiveListItemFlexColumnRenderer) _then) = __$MusicResponsiveListItemFlexColumnRendererCopyWithImpl;
@override @useResult
$Res call({
 Text? text, String? displayPriority
});


@override $TextCopyWith<$Res>? get text;

}
/// @nodoc
class __$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<$Res>
    implements _$MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  __$MusicResponsiveListItemFlexColumnRendererCopyWithImpl(this._self, this._then);

  final _MusicResponsiveListItemFlexColumnRenderer _self;
  final $Res Function(_MusicResponsiveListItemFlexColumnRenderer) _then;

/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? displayPriority = freezed,}) {
  return _then(_MusicResponsiveListItemFlexColumnRenderer(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Text?,displayPriority: freezed == displayPriority ? _self.displayPriority : displayPriority // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MusicResponsiveListItemFlexColumnRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TextCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}


/// @nodoc
mixin _$Text {

 List<PurpleRun>? get runs;
/// Create a copy of Text
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextCopyWith<Text> get copyWith => _$TextCopyWithImpl<Text>(this as Text, _$identity);

  /// Serializes this Text to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Text&&const DeepCollectionEquality().equals(other.runs, runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(runs));

@override
String toString() {
  return 'Text(runs: $runs)';
}


}

/// @nodoc
abstract mixin class $TextCopyWith<$Res>  {
  factory $TextCopyWith(Text value, $Res Function(Text) _then) = _$TextCopyWithImpl;
@useResult
$Res call({
 List<PurpleRun>? runs
});




}
/// @nodoc
class _$TextCopyWithImpl<$Res>
    implements $TextCopyWith<$Res> {
  _$TextCopyWithImpl(this._self, this._then);

  final Text _self;
  final $Res Function(Text) _then;

/// Create a copy of Text
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? runs = freezed,}) {
  return _then(_self.copyWith(
runs: freezed == runs ? _self.runs : runs // ignore: cast_nullable_to_non_nullable
as List<PurpleRun>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Text].
extension TextPatterns on Text {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Text value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Text() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Text value)  $default,){
final _that = this;
switch (_that) {
case _Text():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Text value)?  $default,){
final _that = this;
switch (_that) {
case _Text() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PurpleRun>? runs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Text() when $default != null:
return $default(_that.runs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PurpleRun>? runs)  $default,) {final _that = this;
switch (_that) {
case _Text():
return $default(_that.runs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PurpleRun>? runs)?  $default,) {final _that = this;
switch (_that) {
case _Text() when $default != null:
return $default(_that.runs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Text implements Text {
  const _Text({final  List<PurpleRun>? runs}): _runs = runs;
  factory _Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);

 final  List<PurpleRun>? _runs;
@override List<PurpleRun>? get runs {
  final value = _runs;
  if (value == null) return null;
  if (_runs is EqualUnmodifiableListView) return _runs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Text
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextCopyWith<_Text> get copyWith => __$TextCopyWithImpl<_Text>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Text&&const DeepCollectionEquality().equals(other._runs, _runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_runs));

@override
String toString() {
  return 'Text(runs: $runs)';
}


}

/// @nodoc
abstract mixin class _$TextCopyWith<$Res> implements $TextCopyWith<$Res> {
  factory _$TextCopyWith(_Text value, $Res Function(_Text) _then) = __$TextCopyWithImpl;
@override @useResult
$Res call({
 List<PurpleRun>? runs
});




}
/// @nodoc
class __$TextCopyWithImpl<$Res>
    implements _$TextCopyWith<$Res> {
  __$TextCopyWithImpl(this._self, this._then);

  final _Text _self;
  final $Res Function(_Text) _then;

/// Create a copy of Text
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? runs = freezed,}) {
  return _then(_Text(
runs: freezed == runs ? _self._runs : runs // ignore: cast_nullable_to_non_nullable
as List<PurpleRun>?,
  ));
}


}


/// @nodoc
mixin _$PurpleRun {

 String? get text; RunNavigationEndpoint? get navigationEndpoint;
/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurpleRunCopyWith<PurpleRun> get copyWith => _$PurpleRunCopyWithImpl<PurpleRun>(this as PurpleRun, _$identity);

  /// Serializes this PurpleRun to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurpleRun&&(identical(other.text, text) || other.text == text)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,navigationEndpoint);

@override
String toString() {
  return 'PurpleRun(text: $text, navigationEndpoint: $navigationEndpoint)';
}


}

/// @nodoc
abstract mixin class $PurpleRunCopyWith<$Res>  {
  factory $PurpleRunCopyWith(PurpleRun value, $Res Function(PurpleRun) _then) = _$PurpleRunCopyWithImpl;
@useResult
$Res call({
 String? text, RunNavigationEndpoint? navigationEndpoint
});


$RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint;

}
/// @nodoc
class _$PurpleRunCopyWithImpl<$Res>
    implements $PurpleRunCopyWith<$Res> {
  _$PurpleRunCopyWithImpl(this._self, this._then);

  final PurpleRun _self;
  final $Res Function(PurpleRun) _then;

/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? navigationEndpoint = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as RunNavigationEndpoint?,
  ));
}
/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $RunNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurpleRun].
extension PurpleRunPatterns on PurpleRun {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurpleRun value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurpleRun() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurpleRun value)  $default,){
final _that = this;
switch (_that) {
case _PurpleRun():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurpleRun value)?  $default,){
final _that = this;
switch (_that) {
case _PurpleRun() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  RunNavigationEndpoint? navigationEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurpleRun() when $default != null:
return $default(_that.text,_that.navigationEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  RunNavigationEndpoint? navigationEndpoint)  $default,) {final _that = this;
switch (_that) {
case _PurpleRun():
return $default(_that.text,_that.navigationEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  RunNavigationEndpoint? navigationEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _PurpleRun() when $default != null:
return $default(_that.text,_that.navigationEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurpleRun implements PurpleRun {
  const _PurpleRun({this.text, this.navigationEndpoint});
  factory _PurpleRun.fromJson(Map<String, dynamic> json) => _$PurpleRunFromJson(json);

@override final  String? text;
@override final  RunNavigationEndpoint? navigationEndpoint;

/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurpleRunCopyWith<_PurpleRun> get copyWith => __$PurpleRunCopyWithImpl<_PurpleRun>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurpleRunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurpleRun&&(identical(other.text, text) || other.text == text)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,navigationEndpoint);

@override
String toString() {
  return 'PurpleRun(text: $text, navigationEndpoint: $navigationEndpoint)';
}


}

/// @nodoc
abstract mixin class _$PurpleRunCopyWith<$Res> implements $PurpleRunCopyWith<$Res> {
  factory _$PurpleRunCopyWith(_PurpleRun value, $Res Function(_PurpleRun) _then) = __$PurpleRunCopyWithImpl;
@override @useResult
$Res call({
 String? text, RunNavigationEndpoint? navigationEndpoint
});


@override $RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint;

}
/// @nodoc
class __$PurpleRunCopyWithImpl<$Res>
    implements _$PurpleRunCopyWith<$Res> {
  __$PurpleRunCopyWithImpl(this._self, this._then);

  final _PurpleRun _self;
  final $Res Function(_PurpleRun) _then;

/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? navigationEndpoint = freezed,}) {
  return _then(_PurpleRun(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as RunNavigationEndpoint?,
  ));
}

/// Create a copy of PurpleRun
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $RunNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}
}


/// @nodoc
mixin _$RunNavigationEndpoint {

 String? get clickTrackingParams; PlayNavigationEndpointWatchEndpoint? get watchEndpoint; BrowseEndpoint? get browseEndpoint;
/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunNavigationEndpointCopyWith<RunNavigationEndpoint> get copyWith => _$RunNavigationEndpointCopyWithImpl<RunNavigationEndpoint>(this as RunNavigationEndpoint, _$identity);

  /// Serializes this RunNavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint)&&(identical(other.browseEndpoint, browseEndpoint) || other.browseEndpoint == browseEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint,browseEndpoint);

@override
String toString() {
  return 'RunNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, browseEndpoint: $browseEndpoint)';
}


}

/// @nodoc
abstract mixin class $RunNavigationEndpointCopyWith<$Res>  {
  factory $RunNavigationEndpointCopyWith(RunNavigationEndpoint value, $Res Function(RunNavigationEndpoint) _then) = _$RunNavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, PlayNavigationEndpointWatchEndpoint? watchEndpoint, BrowseEndpoint? browseEndpoint
});


$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;$BrowseEndpointCopyWith<$Res>? get browseEndpoint;

}
/// @nodoc
class _$RunNavigationEndpointCopyWithImpl<$Res>
    implements $RunNavigationEndpointCopyWith<$Res> {
  _$RunNavigationEndpointCopyWithImpl(this._self, this._then);

  final RunNavigationEndpoint _self;
  final $Res Function(RunNavigationEndpoint) _then;

/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,Object? browseEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpointWatchEndpoint?,browseEndpoint: freezed == browseEndpoint ? _self.browseEndpoint : browseEndpoint // ignore: cast_nullable_to_non_nullable
as BrowseEndpoint?,
  ));
}
/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_self.browseEndpoint == null) {
    return null;
  }

  return $BrowseEndpointCopyWith<$Res>(_self.browseEndpoint!, (value) {
    return _then(_self.copyWith(browseEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [RunNavigationEndpoint].
extension RunNavigationEndpointPatterns on RunNavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RunNavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RunNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RunNavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _RunNavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RunNavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _RunNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint,  BrowseEndpoint? browseEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RunNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.browseEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint,  BrowseEndpoint? browseEndpoint)  $default,) {final _that = this;
switch (_that) {
case _RunNavigationEndpoint():
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.browseEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint,  BrowseEndpoint? browseEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _RunNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.browseEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RunNavigationEndpoint implements RunNavigationEndpoint {
  const _RunNavigationEndpoint({this.clickTrackingParams, this.watchEndpoint, this.browseEndpoint});
  factory _RunNavigationEndpoint.fromJson(Map<String, dynamic> json) => _$RunNavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  PlayNavigationEndpointWatchEndpoint? watchEndpoint;
@override final  BrowseEndpoint? browseEndpoint;

/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunNavigationEndpointCopyWith<_RunNavigationEndpoint> get copyWith => __$RunNavigationEndpointCopyWithImpl<_RunNavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunNavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint)&&(identical(other.browseEndpoint, browseEndpoint) || other.browseEndpoint == browseEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint,browseEndpoint);

@override
String toString() {
  return 'RunNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, browseEndpoint: $browseEndpoint)';
}


}

/// @nodoc
abstract mixin class _$RunNavigationEndpointCopyWith<$Res> implements $RunNavigationEndpointCopyWith<$Res> {
  factory _$RunNavigationEndpointCopyWith(_RunNavigationEndpoint value, $Res Function(_RunNavigationEndpoint) _then) = __$RunNavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, PlayNavigationEndpointWatchEndpoint? watchEndpoint, BrowseEndpoint? browseEndpoint
});


@override $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;@override $BrowseEndpointCopyWith<$Res>? get browseEndpoint;

}
/// @nodoc
class __$RunNavigationEndpointCopyWithImpl<$Res>
    implements _$RunNavigationEndpointCopyWith<$Res> {
  __$RunNavigationEndpointCopyWithImpl(this._self, this._then);

  final _RunNavigationEndpoint _self;
  final $Res Function(_RunNavigationEndpoint) _then;

/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,Object? browseEndpoint = freezed,}) {
  return _then(_RunNavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpointWatchEndpoint?,browseEndpoint: freezed == browseEndpoint ? _self.browseEndpoint : browseEndpoint // ignore: cast_nullable_to_non_nullable
as BrowseEndpoint?,
  ));
}

/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}/// Create a copy of RunNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_self.browseEndpoint == null) {
    return null;
  }

  return $BrowseEndpointCopyWith<$Res>(_self.browseEndpoint!, (value) {
    return _then(_self.copyWith(browseEndpoint: value));
  });
}
}


/// @nodoc
mixin _$BrowseEndpoint {

 String? get browseId; BrowseEndpointContextSupportedConfigs? get browseEndpointContextSupportedConfigs;
/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseEndpointCopyWith<BrowseEndpoint> get copyWith => _$BrowseEndpointCopyWithImpl<BrowseEndpoint>(this as BrowseEndpoint, _$identity);

  /// Serializes this BrowseEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseEndpoint&&(identical(other.browseId, browseId) || other.browseId == browseId)&&(identical(other.browseEndpointContextSupportedConfigs, browseEndpointContextSupportedConfigs) || other.browseEndpointContextSupportedConfigs == browseEndpointContextSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,browseId,browseEndpointContextSupportedConfigs);

@override
String toString() {
  return 'BrowseEndpoint(browseId: $browseId, browseEndpointContextSupportedConfigs: $browseEndpointContextSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class $BrowseEndpointCopyWith<$Res>  {
  factory $BrowseEndpointCopyWith(BrowseEndpoint value, $Res Function(BrowseEndpoint) _then) = _$BrowseEndpointCopyWithImpl;
@useResult
$Res call({
 String? browseId, BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs
});


$BrowseEndpointContextSupportedConfigsCopyWith<$Res>? get browseEndpointContextSupportedConfigs;

}
/// @nodoc
class _$BrowseEndpointCopyWithImpl<$Res>
    implements $BrowseEndpointCopyWith<$Res> {
  _$BrowseEndpointCopyWithImpl(this._self, this._then);

  final BrowseEndpoint _self;
  final $Res Function(BrowseEndpoint) _then;

/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? browseId = freezed,Object? browseEndpointContextSupportedConfigs = freezed,}) {
  return _then(_self.copyWith(
browseId: freezed == browseId ? _self.browseId : browseId // ignore: cast_nullable_to_non_nullable
as String?,browseEndpointContextSupportedConfigs: freezed == browseEndpointContextSupportedConfigs ? _self.browseEndpointContextSupportedConfigs : browseEndpointContextSupportedConfigs // ignore: cast_nullable_to_non_nullable
as BrowseEndpointContextSupportedConfigs?,
  ));
}
/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointContextSupportedConfigsCopyWith<$Res>? get browseEndpointContextSupportedConfigs {
    if (_self.browseEndpointContextSupportedConfigs == null) {
    return null;
  }

  return $BrowseEndpointContextSupportedConfigsCopyWith<$Res>(_self.browseEndpointContextSupportedConfigs!, (value) {
    return _then(_self.copyWith(browseEndpointContextSupportedConfigs: value));
  });
}
}


/// Adds pattern-matching-related methods to [BrowseEndpoint].
extension BrowseEndpointPatterns on BrowseEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrowseEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrowseEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrowseEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrowseEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? browseId,  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrowseEndpoint() when $default != null:
return $default(_that.browseId,_that.browseEndpointContextSupportedConfigs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? browseId,  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs)  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpoint():
return $default(_that.browseId,_that.browseEndpointContextSupportedConfigs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? browseId,  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs)?  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpoint() when $default != null:
return $default(_that.browseId,_that.browseEndpointContextSupportedConfigs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrowseEndpoint implements BrowseEndpoint {
  const _BrowseEndpoint({this.browseId, this.browseEndpointContextSupportedConfigs});
  factory _BrowseEndpoint.fromJson(Map<String, dynamic> json) => _$BrowseEndpointFromJson(json);

@override final  String? browseId;
@override final  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs;

/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseEndpointCopyWith<_BrowseEndpoint> get copyWith => __$BrowseEndpointCopyWithImpl<_BrowseEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrowseEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseEndpoint&&(identical(other.browseId, browseId) || other.browseId == browseId)&&(identical(other.browseEndpointContextSupportedConfigs, browseEndpointContextSupportedConfigs) || other.browseEndpointContextSupportedConfigs == browseEndpointContextSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,browseId,browseEndpointContextSupportedConfigs);

@override
String toString() {
  return 'BrowseEndpoint(browseId: $browseId, browseEndpointContextSupportedConfigs: $browseEndpointContextSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class _$BrowseEndpointCopyWith<$Res> implements $BrowseEndpointCopyWith<$Res> {
  factory _$BrowseEndpointCopyWith(_BrowseEndpoint value, $Res Function(_BrowseEndpoint) _then) = __$BrowseEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? browseId, BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs
});


@override $BrowseEndpointContextSupportedConfigsCopyWith<$Res>? get browseEndpointContextSupportedConfigs;

}
/// @nodoc
class __$BrowseEndpointCopyWithImpl<$Res>
    implements _$BrowseEndpointCopyWith<$Res> {
  __$BrowseEndpointCopyWithImpl(this._self, this._then);

  final _BrowseEndpoint _self;
  final $Res Function(_BrowseEndpoint) _then;

/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? browseId = freezed,Object? browseEndpointContextSupportedConfigs = freezed,}) {
  return _then(_BrowseEndpoint(
browseId: freezed == browseId ? _self.browseId : browseId // ignore: cast_nullable_to_non_nullable
as String?,browseEndpointContextSupportedConfigs: freezed == browseEndpointContextSupportedConfigs ? _self.browseEndpointContextSupportedConfigs : browseEndpointContextSupportedConfigs // ignore: cast_nullable_to_non_nullable
as BrowseEndpointContextSupportedConfigs?,
  ));
}

/// Create a copy of BrowseEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointContextSupportedConfigsCopyWith<$Res>? get browseEndpointContextSupportedConfigs {
    if (_self.browseEndpointContextSupportedConfigs == null) {
    return null;
  }

  return $BrowseEndpointContextSupportedConfigsCopyWith<$Res>(_self.browseEndpointContextSupportedConfigs!, (value) {
    return _then(_self.copyWith(browseEndpointContextSupportedConfigs: value));
  });
}
}


/// @nodoc
mixin _$BrowseEndpointContextSupportedConfigs {

 BrowseEndpointContextMusicConfig? get browseEndpointContextMusicConfig;
/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseEndpointContextSupportedConfigsCopyWith<BrowseEndpointContextSupportedConfigs> get copyWith => _$BrowseEndpointContextSupportedConfigsCopyWithImpl<BrowseEndpointContextSupportedConfigs>(this as BrowseEndpointContextSupportedConfigs, _$identity);

  /// Serializes this BrowseEndpointContextSupportedConfigs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseEndpointContextSupportedConfigs&&(identical(other.browseEndpointContextMusicConfig, browseEndpointContextMusicConfig) || other.browseEndpointContextMusicConfig == browseEndpointContextMusicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,browseEndpointContextMusicConfig);

@override
String toString() {
  return 'BrowseEndpointContextSupportedConfigs(browseEndpointContextMusicConfig: $browseEndpointContextMusicConfig)';
}


}

/// @nodoc
abstract mixin class $BrowseEndpointContextSupportedConfigsCopyWith<$Res>  {
  factory $BrowseEndpointContextSupportedConfigsCopyWith(BrowseEndpointContextSupportedConfigs value, $Res Function(BrowseEndpointContextSupportedConfigs) _then) = _$BrowseEndpointContextSupportedConfigsCopyWithImpl;
@useResult
$Res call({
 BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig
});


$BrowseEndpointContextMusicConfigCopyWith<$Res>? get browseEndpointContextMusicConfig;

}
/// @nodoc
class _$BrowseEndpointContextSupportedConfigsCopyWithImpl<$Res>
    implements $BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  _$BrowseEndpointContextSupportedConfigsCopyWithImpl(this._self, this._then);

  final BrowseEndpointContextSupportedConfigs _self;
  final $Res Function(BrowseEndpointContextSupportedConfigs) _then;

/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? browseEndpointContextMusicConfig = freezed,}) {
  return _then(_self.copyWith(
browseEndpointContextMusicConfig: freezed == browseEndpointContextMusicConfig ? _self.browseEndpointContextMusicConfig : browseEndpointContextMusicConfig // ignore: cast_nullable_to_non_nullable
as BrowseEndpointContextMusicConfig?,
  ));
}
/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointContextMusicConfigCopyWith<$Res>? get browseEndpointContextMusicConfig {
    if (_self.browseEndpointContextMusicConfig == null) {
    return null;
  }

  return $BrowseEndpointContextMusicConfigCopyWith<$Res>(_self.browseEndpointContextMusicConfig!, (value) {
    return _then(_self.copyWith(browseEndpointContextMusicConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [BrowseEndpointContextSupportedConfigs].
extension BrowseEndpointContextSupportedConfigsPatterns on BrowseEndpointContextSupportedConfigs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrowseEndpointContextSupportedConfigs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrowseEndpointContextSupportedConfigs value)  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrowseEndpointContextSupportedConfigs value)?  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs() when $default != null:
return $default(_that.browseEndpointContextMusicConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig)  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs():
return $default(_that.browseEndpointContextMusicConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig)?  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpointContextSupportedConfigs() when $default != null:
return $default(_that.browseEndpointContextMusicConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrowseEndpointContextSupportedConfigs implements BrowseEndpointContextSupportedConfigs {
  const _BrowseEndpointContextSupportedConfigs({this.browseEndpointContextMusicConfig});
  factory _BrowseEndpointContextSupportedConfigs.fromJson(Map<String, dynamic> json) => _$BrowseEndpointContextSupportedConfigsFromJson(json);

@override final  BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseEndpointContextSupportedConfigsCopyWith<_BrowseEndpointContextSupportedConfigs> get copyWith => __$BrowseEndpointContextSupportedConfigsCopyWithImpl<_BrowseEndpointContextSupportedConfigs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrowseEndpointContextSupportedConfigsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseEndpointContextSupportedConfigs&&(identical(other.browseEndpointContextMusicConfig, browseEndpointContextMusicConfig) || other.browseEndpointContextMusicConfig == browseEndpointContextMusicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,browseEndpointContextMusicConfig);

@override
String toString() {
  return 'BrowseEndpointContextSupportedConfigs(browseEndpointContextMusicConfig: $browseEndpointContextMusicConfig)';
}


}

/// @nodoc
abstract mixin class _$BrowseEndpointContextSupportedConfigsCopyWith<$Res> implements $BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  factory _$BrowseEndpointContextSupportedConfigsCopyWith(_BrowseEndpointContextSupportedConfigs value, $Res Function(_BrowseEndpointContextSupportedConfigs) _then) = __$BrowseEndpointContextSupportedConfigsCopyWithImpl;
@override @useResult
$Res call({
 BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig
});


@override $BrowseEndpointContextMusicConfigCopyWith<$Res>? get browseEndpointContextMusicConfig;

}
/// @nodoc
class __$BrowseEndpointContextSupportedConfigsCopyWithImpl<$Res>
    implements _$BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  __$BrowseEndpointContextSupportedConfigsCopyWithImpl(this._self, this._then);

  final _BrowseEndpointContextSupportedConfigs _self;
  final $Res Function(_BrowseEndpointContextSupportedConfigs) _then;

/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? browseEndpointContextMusicConfig = freezed,}) {
  return _then(_BrowseEndpointContextSupportedConfigs(
browseEndpointContextMusicConfig: freezed == browseEndpointContextMusicConfig ? _self.browseEndpointContextMusicConfig : browseEndpointContextMusicConfig // ignore: cast_nullable_to_non_nullable
as BrowseEndpointContextMusicConfig?,
  ));
}

/// Create a copy of BrowseEndpointContextSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointContextMusicConfigCopyWith<$Res>? get browseEndpointContextMusicConfig {
    if (_self.browseEndpointContextMusicConfig == null) {
    return null;
  }

  return $BrowseEndpointContextMusicConfigCopyWith<$Res>(_self.browseEndpointContextMusicConfig!, (value) {
    return _then(_self.copyWith(browseEndpointContextMusicConfig: value));
  });
}
}


/// @nodoc
mixin _$BrowseEndpointContextMusicConfig {

 String? get pageType;
/// Create a copy of BrowseEndpointContextMusicConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseEndpointContextMusicConfigCopyWith<BrowseEndpointContextMusicConfig> get copyWith => _$BrowseEndpointContextMusicConfigCopyWithImpl<BrowseEndpointContextMusicConfig>(this as BrowseEndpointContextMusicConfig, _$identity);

  /// Serializes this BrowseEndpointContextMusicConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseEndpointContextMusicConfig&&(identical(other.pageType, pageType) || other.pageType == pageType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageType);

@override
String toString() {
  return 'BrowseEndpointContextMusicConfig(pageType: $pageType)';
}


}

/// @nodoc
abstract mixin class $BrowseEndpointContextMusicConfigCopyWith<$Res>  {
  factory $BrowseEndpointContextMusicConfigCopyWith(BrowseEndpointContextMusicConfig value, $Res Function(BrowseEndpointContextMusicConfig) _then) = _$BrowseEndpointContextMusicConfigCopyWithImpl;
@useResult
$Res call({
 String? pageType
});




}
/// @nodoc
class _$BrowseEndpointContextMusicConfigCopyWithImpl<$Res>
    implements $BrowseEndpointContextMusicConfigCopyWith<$Res> {
  _$BrowseEndpointContextMusicConfigCopyWithImpl(this._self, this._then);

  final BrowseEndpointContextMusicConfig _self;
  final $Res Function(BrowseEndpointContextMusicConfig) _then;

/// Create a copy of BrowseEndpointContextMusicConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageType = freezed,}) {
  return _then(_self.copyWith(
pageType: freezed == pageType ? _self.pageType : pageType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrowseEndpointContextMusicConfig].
extension BrowseEndpointContextMusicConfigPatterns on BrowseEndpointContextMusicConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrowseEndpointContextMusicConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrowseEndpointContextMusicConfig value)  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrowseEndpointContextMusicConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pageType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig() when $default != null:
return $default(_that.pageType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pageType)  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig():
return $default(_that.pageType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pageType)?  $default,) {final _that = this;
switch (_that) {
case _BrowseEndpointContextMusicConfig() when $default != null:
return $default(_that.pageType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrowseEndpointContextMusicConfig implements BrowseEndpointContextMusicConfig {
  const _BrowseEndpointContextMusicConfig({this.pageType});
  factory _BrowseEndpointContextMusicConfig.fromJson(Map<String, dynamic> json) => _$BrowseEndpointContextMusicConfigFromJson(json);

@override final  String? pageType;

/// Create a copy of BrowseEndpointContextMusicConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseEndpointContextMusicConfigCopyWith<_BrowseEndpointContextMusicConfig> get copyWith => __$BrowseEndpointContextMusicConfigCopyWithImpl<_BrowseEndpointContextMusicConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrowseEndpointContextMusicConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseEndpointContextMusicConfig&&(identical(other.pageType, pageType) || other.pageType == pageType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageType);

@override
String toString() {
  return 'BrowseEndpointContextMusicConfig(pageType: $pageType)';
}


}

/// @nodoc
abstract mixin class _$BrowseEndpointContextMusicConfigCopyWith<$Res> implements $BrowseEndpointContextMusicConfigCopyWith<$Res> {
  factory _$BrowseEndpointContextMusicConfigCopyWith(_BrowseEndpointContextMusicConfig value, $Res Function(_BrowseEndpointContextMusicConfig) _then) = __$BrowseEndpointContextMusicConfigCopyWithImpl;
@override @useResult
$Res call({
 String? pageType
});




}
/// @nodoc
class __$BrowseEndpointContextMusicConfigCopyWithImpl<$Res>
    implements _$BrowseEndpointContextMusicConfigCopyWith<$Res> {
  __$BrowseEndpointContextMusicConfigCopyWithImpl(this._self, this._then);

  final _BrowseEndpointContextMusicConfig _self;
  final $Res Function(_BrowseEndpointContextMusicConfig) _then;

/// Create a copy of BrowseEndpointContextMusicConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageType = freezed,}) {
  return _then(_BrowseEndpointContextMusicConfig(
pageType: freezed == pageType ? _self.pageType : pageType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlayNavigationEndpointWatchEndpoint {

 String? get videoId; WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs;
/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayNavigationEndpointWatchEndpointCopyWith<PlayNavigationEndpointWatchEndpoint> get copyWith => _$PlayNavigationEndpointWatchEndpointCopyWithImpl<PlayNavigationEndpointWatchEndpoint>(this as PlayNavigationEndpointWatchEndpoint, _$identity);

  /// Serializes this PlayNavigationEndpointWatchEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayNavigationEndpointWatchEndpoint&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.watchEndpointMusicSupportedConfigs, watchEndpointMusicSupportedConfigs) || other.watchEndpointMusicSupportedConfigs == watchEndpointMusicSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,watchEndpointMusicSupportedConfigs);

@override
String toString() {
  return 'PlayNavigationEndpointWatchEndpoint(videoId: $videoId, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class $PlayNavigationEndpointWatchEndpointCopyWith<$Res>  {
  factory $PlayNavigationEndpointWatchEndpointCopyWith(PlayNavigationEndpointWatchEndpoint value, $Res Function(PlayNavigationEndpointWatchEndpoint) _then) = _$PlayNavigationEndpointWatchEndpointCopyWithImpl;
@useResult
$Res call({
 String? videoId, WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs
});


$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs;

}
/// @nodoc
class _$PlayNavigationEndpointWatchEndpointCopyWithImpl<$Res>
    implements $PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  _$PlayNavigationEndpointWatchEndpointCopyWithImpl(this._self, this._then);

  final PlayNavigationEndpointWatchEndpoint _self;
  final $Res Function(PlayNavigationEndpointWatchEndpoint) _then;

/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = freezed,Object? watchEndpointMusicSupportedConfigs = freezed,}) {
  return _then(_self.copyWith(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,watchEndpointMusicSupportedConfigs: freezed == watchEndpointMusicSupportedConfigs ? _self.watchEndpointMusicSupportedConfigs : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicSupportedConfigs?,
  ));
}
/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs {
    if (_self.watchEndpointMusicSupportedConfigs == null) {
    return null;
  }

  return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(_self.watchEndpointMusicSupportedConfigs!, (value) {
    return _then(_self.copyWith(watchEndpointMusicSupportedConfigs: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayNavigationEndpointWatchEndpoint].
extension PlayNavigationEndpointWatchEndpointPatterns on PlayNavigationEndpointWatchEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayNavigationEndpointWatchEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayNavigationEndpointWatchEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayNavigationEndpointWatchEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? videoId,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint() when $default != null:
return $default(_that.videoId,_that.watchEndpointMusicSupportedConfigs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? videoId,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)  $default,) {final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint():
return $default(_that.videoId,_that.watchEndpointMusicSupportedConfigs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? videoId,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)?  $default,) {final _that = this;
switch (_that) {
case _PlayNavigationEndpointWatchEndpoint() when $default != null:
return $default(_that.videoId,_that.watchEndpointMusicSupportedConfigs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayNavigationEndpointWatchEndpoint implements PlayNavigationEndpointWatchEndpoint {
  const _PlayNavigationEndpointWatchEndpoint({this.videoId, this.watchEndpointMusicSupportedConfigs});
  factory _PlayNavigationEndpointWatchEndpoint.fromJson(Map<String, dynamic> json) => _$PlayNavigationEndpointWatchEndpointFromJson(json);

@override final  String? videoId;
@override final  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs;

/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayNavigationEndpointWatchEndpointCopyWith<_PlayNavigationEndpointWatchEndpoint> get copyWith => __$PlayNavigationEndpointWatchEndpointCopyWithImpl<_PlayNavigationEndpointWatchEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayNavigationEndpointWatchEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayNavigationEndpointWatchEndpoint&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.watchEndpointMusicSupportedConfigs, watchEndpointMusicSupportedConfigs) || other.watchEndpointMusicSupportedConfigs == watchEndpointMusicSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,watchEndpointMusicSupportedConfigs);

@override
String toString() {
  return 'PlayNavigationEndpointWatchEndpoint(videoId: $videoId, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class _$PlayNavigationEndpointWatchEndpointCopyWith<$Res> implements $PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  factory _$PlayNavigationEndpointWatchEndpointCopyWith(_PlayNavigationEndpointWatchEndpoint value, $Res Function(_PlayNavigationEndpointWatchEndpoint) _then) = __$PlayNavigationEndpointWatchEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? videoId, WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs
});


@override $WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs;

}
/// @nodoc
class __$PlayNavigationEndpointWatchEndpointCopyWithImpl<$Res>
    implements _$PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  __$PlayNavigationEndpointWatchEndpointCopyWithImpl(this._self, this._then);

  final _PlayNavigationEndpointWatchEndpoint _self;
  final $Res Function(_PlayNavigationEndpointWatchEndpoint) _then;

/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = freezed,Object? watchEndpointMusicSupportedConfigs = freezed,}) {
  return _then(_PlayNavigationEndpointWatchEndpoint(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,watchEndpointMusicSupportedConfigs: freezed == watchEndpointMusicSupportedConfigs ? _self.watchEndpointMusicSupportedConfigs : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicSupportedConfigs?,
  ));
}

/// Create a copy of PlayNavigationEndpointWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs {
    if (_self.watchEndpointMusicSupportedConfigs == null) {
    return null;
  }

  return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(_self.watchEndpointMusicSupportedConfigs!, (value) {
    return _then(_self.copyWith(watchEndpointMusicSupportedConfigs: value));
  });
}
}


/// @nodoc
mixin _$WatchEndpointMusicSupportedConfigs {

 WatchEndpointMusicConfig? get watchEndpointMusicConfig;
/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchEndpointMusicSupportedConfigsCopyWith<WatchEndpointMusicSupportedConfigs> get copyWith => _$WatchEndpointMusicSupportedConfigsCopyWithImpl<WatchEndpointMusicSupportedConfigs>(this as WatchEndpointMusicSupportedConfigs, _$identity);

  /// Serializes this WatchEndpointMusicSupportedConfigs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchEndpointMusicSupportedConfigs&&(identical(other.watchEndpointMusicConfig, watchEndpointMusicConfig) || other.watchEndpointMusicConfig == watchEndpointMusicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,watchEndpointMusicConfig);

@override
String toString() {
  return 'WatchEndpointMusicSupportedConfigs(watchEndpointMusicConfig: $watchEndpointMusicConfig)';
}


}

/// @nodoc
abstract mixin class $WatchEndpointMusicSupportedConfigsCopyWith<$Res>  {
  factory $WatchEndpointMusicSupportedConfigsCopyWith(WatchEndpointMusicSupportedConfigs value, $Res Function(WatchEndpointMusicSupportedConfigs) _then) = _$WatchEndpointMusicSupportedConfigsCopyWithImpl;
@useResult
$Res call({
 WatchEndpointMusicConfig? watchEndpointMusicConfig
});


$WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig;

}
/// @nodoc
class _$WatchEndpointMusicSupportedConfigsCopyWithImpl<$Res>
    implements $WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  _$WatchEndpointMusicSupportedConfigsCopyWithImpl(this._self, this._then);

  final WatchEndpointMusicSupportedConfigs _self;
  final $Res Function(WatchEndpointMusicSupportedConfigs) _then;

/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? watchEndpointMusicConfig = freezed,}) {
  return _then(_self.copyWith(
watchEndpointMusicConfig: freezed == watchEndpointMusicConfig ? _self.watchEndpointMusicConfig : watchEndpointMusicConfig // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicConfig?,
  ));
}
/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig {
    if (_self.watchEndpointMusicConfig == null) {
    return null;
  }

  return $WatchEndpointMusicConfigCopyWith<$Res>(_self.watchEndpointMusicConfig!, (value) {
    return _then(_self.copyWith(watchEndpointMusicConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchEndpointMusicSupportedConfigs].
extension WatchEndpointMusicSupportedConfigsPatterns on WatchEndpointMusicSupportedConfigs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchEndpointMusicSupportedConfigs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchEndpointMusicSupportedConfigs value)  $default,){
final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchEndpointMusicSupportedConfigs value)?  $default,){
final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WatchEndpointMusicConfig? watchEndpointMusicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs() when $default != null:
return $default(_that.watchEndpointMusicConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WatchEndpointMusicConfig? watchEndpointMusicConfig)  $default,) {final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs():
return $default(_that.watchEndpointMusicConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WatchEndpointMusicConfig? watchEndpointMusicConfig)?  $default,) {final _that = this;
switch (_that) {
case _WatchEndpointMusicSupportedConfigs() when $default != null:
return $default(_that.watchEndpointMusicConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchEndpointMusicSupportedConfigs implements WatchEndpointMusicSupportedConfigs {
  const _WatchEndpointMusicSupportedConfigs({this.watchEndpointMusicConfig});
  factory _WatchEndpointMusicSupportedConfigs.fromJson(Map<String, dynamic> json) => _$WatchEndpointMusicSupportedConfigsFromJson(json);

@override final  WatchEndpointMusicConfig? watchEndpointMusicConfig;

/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchEndpointMusicSupportedConfigsCopyWith<_WatchEndpointMusicSupportedConfigs> get copyWith => __$WatchEndpointMusicSupportedConfigsCopyWithImpl<_WatchEndpointMusicSupportedConfigs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchEndpointMusicSupportedConfigsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchEndpointMusicSupportedConfigs&&(identical(other.watchEndpointMusicConfig, watchEndpointMusicConfig) || other.watchEndpointMusicConfig == watchEndpointMusicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,watchEndpointMusicConfig);

@override
String toString() {
  return 'WatchEndpointMusicSupportedConfigs(watchEndpointMusicConfig: $watchEndpointMusicConfig)';
}


}

/// @nodoc
abstract mixin class _$WatchEndpointMusicSupportedConfigsCopyWith<$Res> implements $WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  factory _$WatchEndpointMusicSupportedConfigsCopyWith(_WatchEndpointMusicSupportedConfigs value, $Res Function(_WatchEndpointMusicSupportedConfigs) _then) = __$WatchEndpointMusicSupportedConfigsCopyWithImpl;
@override @useResult
$Res call({
 WatchEndpointMusicConfig? watchEndpointMusicConfig
});


@override $WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig;

}
/// @nodoc
class __$WatchEndpointMusicSupportedConfigsCopyWithImpl<$Res>
    implements _$WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  __$WatchEndpointMusicSupportedConfigsCopyWithImpl(this._self, this._then);

  final _WatchEndpointMusicSupportedConfigs _self;
  final $Res Function(_WatchEndpointMusicSupportedConfigs) _then;

/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? watchEndpointMusicConfig = freezed,}) {
  return _then(_WatchEndpointMusicSupportedConfigs(
watchEndpointMusicConfig: freezed == watchEndpointMusicConfig ? _self.watchEndpointMusicConfig : watchEndpointMusicConfig // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicConfig?,
  ));
}

/// Create a copy of WatchEndpointMusicSupportedConfigs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig {
    if (_self.watchEndpointMusicConfig == null) {
    return null;
  }

  return $WatchEndpointMusicConfigCopyWith<$Res>(_self.watchEndpointMusicConfig!, (value) {
    return _then(_self.copyWith(watchEndpointMusicConfig: value));
  });
}
}


/// @nodoc
mixin _$WatchEndpointMusicConfig {

 String? get musicVideoType;
/// Create a copy of WatchEndpointMusicConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchEndpointMusicConfigCopyWith<WatchEndpointMusicConfig> get copyWith => _$WatchEndpointMusicConfigCopyWithImpl<WatchEndpointMusicConfig>(this as WatchEndpointMusicConfig, _$identity);

  /// Serializes this WatchEndpointMusicConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchEndpointMusicConfig&&(identical(other.musicVideoType, musicVideoType) || other.musicVideoType == musicVideoType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicVideoType);

@override
String toString() {
  return 'WatchEndpointMusicConfig(musicVideoType: $musicVideoType)';
}


}

/// @nodoc
abstract mixin class $WatchEndpointMusicConfigCopyWith<$Res>  {
  factory $WatchEndpointMusicConfigCopyWith(WatchEndpointMusicConfig value, $Res Function(WatchEndpointMusicConfig) _then) = _$WatchEndpointMusicConfigCopyWithImpl;
@useResult
$Res call({
 String? musicVideoType
});




}
/// @nodoc
class _$WatchEndpointMusicConfigCopyWithImpl<$Res>
    implements $WatchEndpointMusicConfigCopyWith<$Res> {
  _$WatchEndpointMusicConfigCopyWithImpl(this._self, this._then);

  final WatchEndpointMusicConfig _self;
  final $Res Function(WatchEndpointMusicConfig) _then;

/// Create a copy of WatchEndpointMusicConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicVideoType = freezed,}) {
  return _then(_self.copyWith(
musicVideoType: freezed == musicVideoType ? _self.musicVideoType : musicVideoType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchEndpointMusicConfig].
extension WatchEndpointMusicConfigPatterns on WatchEndpointMusicConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchEndpointMusicConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchEndpointMusicConfig value)  $default,){
final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchEndpointMusicConfig value)?  $default,){
final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? musicVideoType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig() when $default != null:
return $default(_that.musicVideoType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? musicVideoType)  $default,) {final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig():
return $default(_that.musicVideoType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? musicVideoType)?  $default,) {final _that = this;
switch (_that) {
case _WatchEndpointMusicConfig() when $default != null:
return $default(_that.musicVideoType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchEndpointMusicConfig implements WatchEndpointMusicConfig {
  const _WatchEndpointMusicConfig({this.musicVideoType});
  factory _WatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) => _$WatchEndpointMusicConfigFromJson(json);

@override final  String? musicVideoType;

/// Create a copy of WatchEndpointMusicConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchEndpointMusicConfigCopyWith<_WatchEndpointMusicConfig> get copyWith => __$WatchEndpointMusicConfigCopyWithImpl<_WatchEndpointMusicConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchEndpointMusicConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchEndpointMusicConfig&&(identical(other.musicVideoType, musicVideoType) || other.musicVideoType == musicVideoType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicVideoType);

@override
String toString() {
  return 'WatchEndpointMusicConfig(musicVideoType: $musicVideoType)';
}


}

/// @nodoc
abstract mixin class _$WatchEndpointMusicConfigCopyWith<$Res> implements $WatchEndpointMusicConfigCopyWith<$Res> {
  factory _$WatchEndpointMusicConfigCopyWith(_WatchEndpointMusicConfig value, $Res Function(_WatchEndpointMusicConfig) _then) = __$WatchEndpointMusicConfigCopyWithImpl;
@override @useResult
$Res call({
 String? musicVideoType
});




}
/// @nodoc
class __$WatchEndpointMusicConfigCopyWithImpl<$Res>
    implements _$WatchEndpointMusicConfigCopyWith<$Res> {
  __$WatchEndpointMusicConfigCopyWithImpl(this._self, this._then);

  final _WatchEndpointMusicConfig _self;
  final $Res Function(_WatchEndpointMusicConfig) _then;

/// Create a copy of WatchEndpointMusicConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicVideoType = freezed,}) {
  return _then(_WatchEndpointMusicConfig(
musicVideoType: freezed == musicVideoType ? _self.musicVideoType : musicVideoType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Menu {

 MenuRenderer? get menuRenderer;
/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCopyWith<Menu> get copyWith => _$MenuCopyWithImpl<Menu>(this as Menu, _$identity);

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Menu&&(identical(other.menuRenderer, menuRenderer) || other.menuRenderer == menuRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuRenderer);

@override
String toString() {
  return 'Menu(menuRenderer: $menuRenderer)';
}


}

/// @nodoc
abstract mixin class $MenuCopyWith<$Res>  {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) _then) = _$MenuCopyWithImpl;
@useResult
$Res call({
 MenuRenderer? menuRenderer
});


$MenuRendererCopyWith<$Res>? get menuRenderer;

}
/// @nodoc
class _$MenuCopyWithImpl<$Res>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._self, this._then);

  final Menu _self;
  final $Res Function(Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuRenderer = freezed,}) {
  return _then(_self.copyWith(
menuRenderer: freezed == menuRenderer ? _self.menuRenderer : menuRenderer // ignore: cast_nullable_to_non_nullable
as MenuRenderer?,
  ));
}
/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuRendererCopyWith<$Res>? get menuRenderer {
    if (_self.menuRenderer == null) {
    return null;
  }

  return $MenuRendererCopyWith<$Res>(_self.menuRenderer!, (value) {
    return _then(_self.copyWith(menuRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Menu].
extension MenuPatterns on Menu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Menu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Menu value)  $default,){
final _that = this;
switch (_that) {
case _Menu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Menu value)?  $default,){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuRenderer? menuRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that.menuRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuRenderer? menuRenderer)  $default,) {final _that = this;
switch (_that) {
case _Menu():
return $default(_that.menuRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuRenderer? menuRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that.menuRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Menu implements Menu {
  const _Menu({this.menuRenderer});
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

@override final  MenuRenderer? menuRenderer;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCopyWith<_Menu> get copyWith => __$MenuCopyWithImpl<_Menu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Menu&&(identical(other.menuRenderer, menuRenderer) || other.menuRenderer == menuRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuRenderer);

@override
String toString() {
  return 'Menu(menuRenderer: $menuRenderer)';
}


}

/// @nodoc
abstract mixin class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) _then) = __$MenuCopyWithImpl;
@override @useResult
$Res call({
 MenuRenderer? menuRenderer
});


@override $MenuRendererCopyWith<$Res>? get menuRenderer;

}
/// @nodoc
class __$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(this._self, this._then);

  final _Menu _self;
  final $Res Function(_Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuRenderer = freezed,}) {
  return _then(_Menu(
menuRenderer: freezed == menuRenderer ? _self.menuRenderer : menuRenderer // ignore: cast_nullable_to_non_nullable
as MenuRenderer?,
  ));
}

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuRendererCopyWith<$Res>? get menuRenderer {
    if (_self.menuRenderer == null) {
    return null;
  }

  return $MenuRendererCopyWith<$Res>(_self.menuRenderer!, (value) {
    return _then(_self.copyWith(menuRenderer: value));
  });
}
}


/// @nodoc
mixin _$MenuRenderer {

 List<ItemElement>? get items; String? get trackingParams; Accessibility? get accessibility;
/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuRendererCopyWith<MenuRenderer> get copyWith => _$MenuRendererCopyWithImpl<MenuRenderer>(this as MenuRenderer, _$identity);

  /// Serializes this MenuRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuRenderer&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.accessibility, accessibility) || other.accessibility == accessibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),trackingParams,accessibility);

@override
String toString() {
  return 'MenuRenderer(items: $items, trackingParams: $trackingParams, accessibility: $accessibility)';
}


}

/// @nodoc
abstract mixin class $MenuRendererCopyWith<$Res>  {
  factory $MenuRendererCopyWith(MenuRenderer value, $Res Function(MenuRenderer) _then) = _$MenuRendererCopyWithImpl;
@useResult
$Res call({
 List<ItemElement>? items, String? trackingParams, Accessibility? accessibility
});


$AccessibilityCopyWith<$Res>? get accessibility;

}
/// @nodoc
class _$MenuRendererCopyWithImpl<$Res>
    implements $MenuRendererCopyWith<$Res> {
  _$MenuRendererCopyWithImpl(this._self, this._then);

  final MenuRenderer _self;
  final $Res Function(MenuRenderer) _then;

/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? trackingParams = freezed,Object? accessibility = freezed,}) {
  return _then(_self.copyWith(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ItemElement>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,accessibility: freezed == accessibility ? _self.accessibility : accessibility // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}
/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibility {
    if (_self.accessibility == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibility!, (value) {
    return _then(_self.copyWith(accessibility: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuRenderer].
extension MenuRendererPatterns on MenuRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MenuRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MenuRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ItemElement>? items,  String? trackingParams,  Accessibility? accessibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuRenderer() when $default != null:
return $default(_that.items,_that.trackingParams,_that.accessibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ItemElement>? items,  String? trackingParams,  Accessibility? accessibility)  $default,) {final _that = this;
switch (_that) {
case _MenuRenderer():
return $default(_that.items,_that.trackingParams,_that.accessibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ItemElement>? items,  String? trackingParams,  Accessibility? accessibility)?  $default,) {final _that = this;
switch (_that) {
case _MenuRenderer() when $default != null:
return $default(_that.items,_that.trackingParams,_that.accessibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuRenderer implements MenuRenderer {
  const _MenuRenderer({final  List<ItemElement>? items, this.trackingParams, this.accessibility}): _items = items;
  factory _MenuRenderer.fromJson(Map<String, dynamic> json) => _$MenuRendererFromJson(json);

 final  List<ItemElement>? _items;
@override List<ItemElement>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? trackingParams;
@override final  Accessibility? accessibility;

/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuRendererCopyWith<_MenuRenderer> get copyWith => __$MenuRendererCopyWithImpl<_MenuRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuRenderer&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.accessibility, accessibility) || other.accessibility == accessibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),trackingParams,accessibility);

@override
String toString() {
  return 'MenuRenderer(items: $items, trackingParams: $trackingParams, accessibility: $accessibility)';
}


}

/// @nodoc
abstract mixin class _$MenuRendererCopyWith<$Res> implements $MenuRendererCopyWith<$Res> {
  factory _$MenuRendererCopyWith(_MenuRenderer value, $Res Function(_MenuRenderer) _then) = __$MenuRendererCopyWithImpl;
@override @useResult
$Res call({
 List<ItemElement>? items, String? trackingParams, Accessibility? accessibility
});


@override $AccessibilityCopyWith<$Res>? get accessibility;

}
/// @nodoc
class __$MenuRendererCopyWithImpl<$Res>
    implements _$MenuRendererCopyWith<$Res> {
  __$MenuRendererCopyWithImpl(this._self, this._then);

  final _MenuRenderer _self;
  final $Res Function(_MenuRenderer) _then;

/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? trackingParams = freezed,Object? accessibility = freezed,}) {
  return _then(_MenuRenderer(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ItemElement>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,accessibility: freezed == accessibility ? _self.accessibility : accessibility // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}

/// Create a copy of MenuRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibility {
    if (_self.accessibility == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibility!, (value) {
    return _then(_self.copyWith(accessibility: value));
  });
}
}


/// @nodoc
mixin _$ItemElement {

 MenuItemRenderer? get menuNavigationItemRenderer; MenuItemRenderer? get menuServiceItemRenderer; ToggleMenuServiceItemRenderer? get toggleMenuServiceItemRenderer;
/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemElementCopyWith<ItemElement> get copyWith => _$ItemElementCopyWithImpl<ItemElement>(this as ItemElement, _$identity);

  /// Serializes this ItemElement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemElement&&(identical(other.menuNavigationItemRenderer, menuNavigationItemRenderer) || other.menuNavigationItemRenderer == menuNavigationItemRenderer)&&(identical(other.menuServiceItemRenderer, menuServiceItemRenderer) || other.menuServiceItemRenderer == menuServiceItemRenderer)&&(identical(other.toggleMenuServiceItemRenderer, toggleMenuServiceItemRenderer) || other.toggleMenuServiceItemRenderer == toggleMenuServiceItemRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuNavigationItemRenderer,menuServiceItemRenderer,toggleMenuServiceItemRenderer);

@override
String toString() {
  return 'ItemElement(menuNavigationItemRenderer: $menuNavigationItemRenderer, menuServiceItemRenderer: $menuServiceItemRenderer, toggleMenuServiceItemRenderer: $toggleMenuServiceItemRenderer)';
}


}

/// @nodoc
abstract mixin class $ItemElementCopyWith<$Res>  {
  factory $ItemElementCopyWith(ItemElement value, $Res Function(ItemElement) _then) = _$ItemElementCopyWithImpl;
@useResult
$Res call({
 MenuItemRenderer? menuNavigationItemRenderer, MenuItemRenderer? menuServiceItemRenderer, ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer
});


$MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer;$MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer;$ToggleMenuServiceItemRendererCopyWith<$Res>? get toggleMenuServiceItemRenderer;

}
/// @nodoc
class _$ItemElementCopyWithImpl<$Res>
    implements $ItemElementCopyWith<$Res> {
  _$ItemElementCopyWithImpl(this._self, this._then);

  final ItemElement _self;
  final $Res Function(ItemElement) _then;

/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuNavigationItemRenderer = freezed,Object? menuServiceItemRenderer = freezed,Object? toggleMenuServiceItemRenderer = freezed,}) {
  return _then(_self.copyWith(
menuNavigationItemRenderer: freezed == menuNavigationItemRenderer ? _self.menuNavigationItemRenderer : menuNavigationItemRenderer // ignore: cast_nullable_to_non_nullable
as MenuItemRenderer?,menuServiceItemRenderer: freezed == menuServiceItemRenderer ? _self.menuServiceItemRenderer : menuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
as MenuItemRenderer?,toggleMenuServiceItemRenderer: freezed == toggleMenuServiceItemRenderer ? _self.toggleMenuServiceItemRenderer : toggleMenuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
as ToggleMenuServiceItemRenderer?,
  ));
}
/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer {
    if (_self.menuNavigationItemRenderer == null) {
    return null;
  }

  return $MenuItemRendererCopyWith<$Res>(_self.menuNavigationItemRenderer!, (value) {
    return _then(_self.copyWith(menuNavigationItemRenderer: value));
  });
}/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer {
    if (_self.menuServiceItemRenderer == null) {
    return null;
  }

  return $MenuItemRendererCopyWith<$Res>(_self.menuServiceItemRenderer!, (value) {
    return _then(_self.copyWith(menuServiceItemRenderer: value));
  });
}/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToggleMenuServiceItemRendererCopyWith<$Res>? get toggleMenuServiceItemRenderer {
    if (_self.toggleMenuServiceItemRenderer == null) {
    return null;
  }

  return $ToggleMenuServiceItemRendererCopyWith<$Res>(_self.toggleMenuServiceItemRenderer!, (value) {
    return _then(_self.copyWith(toggleMenuServiceItemRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemElement].
extension ItemElementPatterns on ItemElement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemElement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemElement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemElement value)  $default,){
final _that = this;
switch (_that) {
case _ItemElement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemElement value)?  $default,){
final _that = this;
switch (_that) {
case _ItemElement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuItemRenderer? menuNavigationItemRenderer,  MenuItemRenderer? menuServiceItemRenderer,  ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemElement() when $default != null:
return $default(_that.menuNavigationItemRenderer,_that.menuServiceItemRenderer,_that.toggleMenuServiceItemRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuItemRenderer? menuNavigationItemRenderer,  MenuItemRenderer? menuServiceItemRenderer,  ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer)  $default,) {final _that = this;
switch (_that) {
case _ItemElement():
return $default(_that.menuNavigationItemRenderer,_that.menuServiceItemRenderer,_that.toggleMenuServiceItemRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuItemRenderer? menuNavigationItemRenderer,  MenuItemRenderer? menuServiceItemRenderer,  ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer)?  $default,) {final _that = this;
switch (_that) {
case _ItemElement() when $default != null:
return $default(_that.menuNavigationItemRenderer,_that.menuServiceItemRenderer,_that.toggleMenuServiceItemRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemElement implements ItemElement {
  const _ItemElement({this.menuNavigationItemRenderer, this.menuServiceItemRenderer, this.toggleMenuServiceItemRenderer});
  factory _ItemElement.fromJson(Map<String, dynamic> json) => _$ItemElementFromJson(json);

@override final  MenuItemRenderer? menuNavigationItemRenderer;
@override final  MenuItemRenderer? menuServiceItemRenderer;
@override final  ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer;

/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemElementCopyWith<_ItemElement> get copyWith => __$ItemElementCopyWithImpl<_ItemElement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemElement&&(identical(other.menuNavigationItemRenderer, menuNavigationItemRenderer) || other.menuNavigationItemRenderer == menuNavigationItemRenderer)&&(identical(other.menuServiceItemRenderer, menuServiceItemRenderer) || other.menuServiceItemRenderer == menuServiceItemRenderer)&&(identical(other.toggleMenuServiceItemRenderer, toggleMenuServiceItemRenderer) || other.toggleMenuServiceItemRenderer == toggleMenuServiceItemRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuNavigationItemRenderer,menuServiceItemRenderer,toggleMenuServiceItemRenderer);

@override
String toString() {
  return 'ItemElement(menuNavigationItemRenderer: $menuNavigationItemRenderer, menuServiceItemRenderer: $menuServiceItemRenderer, toggleMenuServiceItemRenderer: $toggleMenuServiceItemRenderer)';
}


}

/// @nodoc
abstract mixin class _$ItemElementCopyWith<$Res> implements $ItemElementCopyWith<$Res> {
  factory _$ItemElementCopyWith(_ItemElement value, $Res Function(_ItemElement) _then) = __$ItemElementCopyWithImpl;
@override @useResult
$Res call({
 MenuItemRenderer? menuNavigationItemRenderer, MenuItemRenderer? menuServiceItemRenderer, ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer
});


@override $MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer;@override $MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer;@override $ToggleMenuServiceItemRendererCopyWith<$Res>? get toggleMenuServiceItemRenderer;

}
/// @nodoc
class __$ItemElementCopyWithImpl<$Res>
    implements _$ItemElementCopyWith<$Res> {
  __$ItemElementCopyWithImpl(this._self, this._then);

  final _ItemElement _self;
  final $Res Function(_ItemElement) _then;

/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuNavigationItemRenderer = freezed,Object? menuServiceItemRenderer = freezed,Object? toggleMenuServiceItemRenderer = freezed,}) {
  return _then(_ItemElement(
menuNavigationItemRenderer: freezed == menuNavigationItemRenderer ? _self.menuNavigationItemRenderer : menuNavigationItemRenderer // ignore: cast_nullable_to_non_nullable
as MenuItemRenderer?,menuServiceItemRenderer: freezed == menuServiceItemRenderer ? _self.menuServiceItemRenderer : menuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
as MenuItemRenderer?,toggleMenuServiceItemRenderer: freezed == toggleMenuServiceItemRenderer ? _self.toggleMenuServiceItemRenderer : toggleMenuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
as ToggleMenuServiceItemRenderer?,
  ));
}

/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer {
    if (_self.menuNavigationItemRenderer == null) {
    return null;
  }

  return $MenuItemRendererCopyWith<$Res>(_self.menuNavigationItemRenderer!, (value) {
    return _then(_self.copyWith(menuNavigationItemRenderer: value));
  });
}/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer {
    if (_self.menuServiceItemRenderer == null) {
    return null;
  }

  return $MenuItemRendererCopyWith<$Res>(_self.menuServiceItemRenderer!, (value) {
    return _then(_self.copyWith(menuServiceItemRenderer: value));
  });
}/// Create a copy of ItemElement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToggleMenuServiceItemRendererCopyWith<$Res>? get toggleMenuServiceItemRenderer {
    if (_self.toggleMenuServiceItemRenderer == null) {
    return null;
  }

  return $ToggleMenuServiceItemRendererCopyWith<$Res>(_self.toggleMenuServiceItemRenderer!, (value) {
    return _then(_self.copyWith(toggleMenuServiceItemRenderer: value));
  });
}
}


/// @nodoc
mixin _$MenuItemRenderer {

 Title? get text; Icon? get icon; MenuNavigationItemRendererNavigationEndpoint? get navigationEndpoint; String? get trackingParams; ServiceEndpoint? get serviceEndpoint;
/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemRendererCopyWith<MenuItemRenderer> get copyWith => _$MenuItemRendererCopyWithImpl<MenuItemRenderer>(this as MenuItemRenderer, _$identity);

  /// Serializes this MenuItemRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemRenderer&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.serviceEndpoint, serviceEndpoint) || other.serviceEndpoint == serviceEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon,navigationEndpoint,trackingParams,serviceEndpoint);

@override
String toString() {
  return 'MenuItemRenderer(text: $text, icon: $icon, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, serviceEndpoint: $serviceEndpoint)';
}


}

/// @nodoc
abstract mixin class $MenuItemRendererCopyWith<$Res>  {
  factory $MenuItemRendererCopyWith(MenuItemRenderer value, $Res Function(MenuItemRenderer) _then) = _$MenuItemRendererCopyWithImpl;
@useResult
$Res call({
 Title? text, Icon? icon, MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint, String? trackingParams, ServiceEndpoint? serviceEndpoint
});


$TitleCopyWith<$Res>? get text;$IconCopyWith<$Res>? get icon;$MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;$ServiceEndpointCopyWith<$Res>? get serviceEndpoint;

}
/// @nodoc
class _$MenuItemRendererCopyWithImpl<$Res>
    implements $MenuItemRendererCopyWith<$Res> {
  _$MenuItemRendererCopyWithImpl(this._self, this._then);

  final MenuItemRenderer _self;
  final $Res Function(MenuItemRenderer) _then;

/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? icon = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? serviceEndpoint = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as MenuNavigationItemRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,serviceEndpoint: freezed == serviceEndpoint ? _self.serviceEndpoint : serviceEndpoint // ignore: cast_nullable_to_non_nullable
as ServiceEndpoint?,
  ));
}
/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceEndpointCopyWith<$Res>? get serviceEndpoint {
    if (_self.serviceEndpoint == null) {
    return null;
  }

  return $ServiceEndpointCopyWith<$Res>(_self.serviceEndpoint!, (value) {
    return _then(_self.copyWith(serviceEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuItemRenderer].
extension MenuItemRendererPatterns on MenuItemRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? text,  Icon? icon,  MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  ServiceEndpoint? serviceEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemRenderer() when $default != null:
return $default(_that.text,_that.icon,_that.navigationEndpoint,_that.trackingParams,_that.serviceEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? text,  Icon? icon,  MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  ServiceEndpoint? serviceEndpoint)  $default,) {final _that = this;
switch (_that) {
case _MenuItemRenderer():
return $default(_that.text,_that.icon,_that.navigationEndpoint,_that.trackingParams,_that.serviceEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? text,  Icon? icon,  MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  ServiceEndpoint? serviceEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemRenderer() when $default != null:
return $default(_that.text,_that.icon,_that.navigationEndpoint,_that.trackingParams,_that.serviceEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemRenderer implements MenuItemRenderer {
  const _MenuItemRenderer({this.text, this.icon, this.navigationEndpoint, this.trackingParams, this.serviceEndpoint});
  factory _MenuItemRenderer.fromJson(Map<String, dynamic> json) => _$MenuItemRendererFromJson(json);

@override final  Title? text;
@override final  Icon? icon;
@override final  MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint;
@override final  String? trackingParams;
@override final  ServiceEndpoint? serviceEndpoint;

/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemRendererCopyWith<_MenuItemRenderer> get copyWith => __$MenuItemRendererCopyWithImpl<_MenuItemRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemRenderer&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.serviceEndpoint, serviceEndpoint) || other.serviceEndpoint == serviceEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon,navigationEndpoint,trackingParams,serviceEndpoint);

@override
String toString() {
  return 'MenuItemRenderer(text: $text, icon: $icon, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, serviceEndpoint: $serviceEndpoint)';
}


}

/// @nodoc
abstract mixin class _$MenuItemRendererCopyWith<$Res> implements $MenuItemRendererCopyWith<$Res> {
  factory _$MenuItemRendererCopyWith(_MenuItemRenderer value, $Res Function(_MenuItemRenderer) _then) = __$MenuItemRendererCopyWithImpl;
@override @useResult
$Res call({
 Title? text, Icon? icon, MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint, String? trackingParams, ServiceEndpoint? serviceEndpoint
});


@override $TitleCopyWith<$Res>? get text;@override $IconCopyWith<$Res>? get icon;@override $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;@override $ServiceEndpointCopyWith<$Res>? get serviceEndpoint;

}
/// @nodoc
class __$MenuItemRendererCopyWithImpl<$Res>
    implements _$MenuItemRendererCopyWith<$Res> {
  __$MenuItemRendererCopyWithImpl(this._self, this._then);

  final _MenuItemRenderer _self;
  final $Res Function(_MenuItemRenderer) _then;

/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? icon = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? serviceEndpoint = freezed,}) {
  return _then(_MenuItemRenderer(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as MenuNavigationItemRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,serviceEndpoint: freezed == serviceEndpoint ? _self.serviceEndpoint : serviceEndpoint // ignore: cast_nullable_to_non_nullable
as ServiceEndpoint?,
  ));
}

/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of MenuItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceEndpointCopyWith<$Res>? get serviceEndpoint {
    if (_self.serviceEndpoint == null) {
    return null;
  }

  return $ServiceEndpointCopyWith<$Res>(_self.serviceEndpoint!, (value) {
    return _then(_self.copyWith(serviceEndpoint: value));
  });
}
}


/// @nodoc
mixin _$MenuNavigationItemRendererNavigationEndpoint {

 String? get clickTrackingParams; PurpleWatchEndpoint? get watchEndpoint; ModalEndpoint? get modalEndpoint; BrowseEndpoint? get browseEndpoint; ShareEntityEndpoint? get shareEntityEndpoint;
/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuNavigationItemRendererNavigationEndpointCopyWith<MenuNavigationItemRendererNavigationEndpoint> get copyWith => _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<MenuNavigationItemRendererNavigationEndpoint>(this as MenuNavigationItemRendererNavigationEndpoint, _$identity);

  /// Serializes this MenuNavigationItemRendererNavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuNavigationItemRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint)&&(identical(other.modalEndpoint, modalEndpoint) || other.modalEndpoint == modalEndpoint)&&(identical(other.browseEndpoint, browseEndpoint) || other.browseEndpoint == browseEndpoint)&&(identical(other.shareEntityEndpoint, shareEntityEndpoint) || other.shareEntityEndpoint == shareEntityEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint,modalEndpoint,browseEndpoint,shareEntityEndpoint);

@override
String toString() {
  return 'MenuNavigationItemRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, modalEndpoint: $modalEndpoint, browseEndpoint: $browseEndpoint, shareEntityEndpoint: $shareEntityEndpoint)';
}


}

/// @nodoc
abstract mixin class $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>  {
  factory $MenuNavigationItemRendererNavigationEndpointCopyWith(MenuNavigationItemRendererNavigationEndpoint value, $Res Function(MenuNavigationItemRendererNavigationEndpoint) _then) = _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, PurpleWatchEndpoint? watchEndpoint, ModalEndpoint? modalEndpoint, BrowseEndpoint? browseEndpoint, ShareEntityEndpoint? shareEntityEndpoint
});


$PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint;$ModalEndpointCopyWith<$Res>? get modalEndpoint;$BrowseEndpointCopyWith<$Res>? get browseEndpoint;$ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint;

}
/// @nodoc
class _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<$Res>
    implements $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final MenuNavigationItemRendererNavigationEndpoint _self;
  final $Res Function(MenuNavigationItemRendererNavigationEndpoint) _then;

/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,Object? modalEndpoint = freezed,Object? browseEndpoint = freezed,Object? shareEntityEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PurpleWatchEndpoint?,modalEndpoint: freezed == modalEndpoint ? _self.modalEndpoint : modalEndpoint // ignore: cast_nullable_to_non_nullable
as ModalEndpoint?,browseEndpoint: freezed == browseEndpoint ? _self.browseEndpoint : browseEndpoint // ignore: cast_nullable_to_non_nullable
as BrowseEndpoint?,shareEntityEndpoint: freezed == shareEntityEndpoint ? _self.shareEntityEndpoint : shareEntityEndpoint // ignore: cast_nullable_to_non_nullable
as ShareEntityEndpoint?,
  ));
}
/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PurpleWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_self.modalEndpoint == null) {
    return null;
  }

  return $ModalEndpointCopyWith<$Res>(_self.modalEndpoint!, (value) {
    return _then(_self.copyWith(modalEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_self.browseEndpoint == null) {
    return null;
  }

  return $BrowseEndpointCopyWith<$Res>(_self.browseEndpoint!, (value) {
    return _then(_self.copyWith(browseEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint {
    if (_self.shareEntityEndpoint == null) {
    return null;
  }

  return $ShareEntityEndpointCopyWith<$Res>(_self.shareEntityEndpoint!, (value) {
    return _then(_self.copyWith(shareEntityEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuNavigationItemRendererNavigationEndpoint].
extension MenuNavigationItemRendererNavigationEndpointPatterns on MenuNavigationItemRendererNavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuNavigationItemRendererNavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuNavigationItemRendererNavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuNavigationItemRendererNavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PurpleWatchEndpoint? watchEndpoint,  ModalEndpoint? modalEndpoint,  BrowseEndpoint? browseEndpoint,  ShareEntityEndpoint? shareEntityEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.modalEndpoint,_that.browseEndpoint,_that.shareEntityEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PurpleWatchEndpoint? watchEndpoint,  ModalEndpoint? modalEndpoint,  BrowseEndpoint? browseEndpoint,  ShareEntityEndpoint? shareEntityEndpoint)  $default,) {final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint():
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.modalEndpoint,_that.browseEndpoint,_that.shareEntityEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  PurpleWatchEndpoint? watchEndpoint,  ModalEndpoint? modalEndpoint,  BrowseEndpoint? browseEndpoint,  ShareEntityEndpoint? shareEntityEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _MenuNavigationItemRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint,_that.modalEndpoint,_that.browseEndpoint,_that.shareEntityEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuNavigationItemRendererNavigationEndpoint implements MenuNavigationItemRendererNavigationEndpoint {
  const _MenuNavigationItemRendererNavigationEndpoint({this.clickTrackingParams, this.watchEndpoint, this.modalEndpoint, this.browseEndpoint, this.shareEntityEndpoint});
  factory _MenuNavigationItemRendererNavigationEndpoint.fromJson(Map<String, dynamic> json) => _$MenuNavigationItemRendererNavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  PurpleWatchEndpoint? watchEndpoint;
@override final  ModalEndpoint? modalEndpoint;
@override final  BrowseEndpoint? browseEndpoint;
@override final  ShareEntityEndpoint? shareEntityEndpoint;

/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuNavigationItemRendererNavigationEndpointCopyWith<_MenuNavigationItemRendererNavigationEndpoint> get copyWith => __$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<_MenuNavigationItemRendererNavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuNavigationItemRendererNavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuNavigationItemRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint)&&(identical(other.modalEndpoint, modalEndpoint) || other.modalEndpoint == modalEndpoint)&&(identical(other.browseEndpoint, browseEndpoint) || other.browseEndpoint == browseEndpoint)&&(identical(other.shareEntityEndpoint, shareEntityEndpoint) || other.shareEntityEndpoint == shareEntityEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint,modalEndpoint,browseEndpoint,shareEntityEndpoint);

@override
String toString() {
  return 'MenuNavigationItemRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, modalEndpoint: $modalEndpoint, browseEndpoint: $browseEndpoint, shareEntityEndpoint: $shareEntityEndpoint)';
}


}

/// @nodoc
abstract mixin class _$MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> implements $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  factory _$MenuNavigationItemRendererNavigationEndpointCopyWith(_MenuNavigationItemRendererNavigationEndpoint value, $Res Function(_MenuNavigationItemRendererNavigationEndpoint) _then) = __$MenuNavigationItemRendererNavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, PurpleWatchEndpoint? watchEndpoint, ModalEndpoint? modalEndpoint, BrowseEndpoint? browseEndpoint, ShareEntityEndpoint? shareEntityEndpoint
});


@override $PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint;@override $ModalEndpointCopyWith<$Res>? get modalEndpoint;@override $BrowseEndpointCopyWith<$Res>? get browseEndpoint;@override $ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint;

}
/// @nodoc
class __$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<$Res>
    implements _$MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  __$MenuNavigationItemRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final _MenuNavigationItemRendererNavigationEndpoint _self;
  final $Res Function(_MenuNavigationItemRendererNavigationEndpoint) _then;

/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,Object? modalEndpoint = freezed,Object? browseEndpoint = freezed,Object? shareEntityEndpoint = freezed,}) {
  return _then(_MenuNavigationItemRendererNavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PurpleWatchEndpoint?,modalEndpoint: freezed == modalEndpoint ? _self.modalEndpoint : modalEndpoint // ignore: cast_nullable_to_non_nullable
as ModalEndpoint?,browseEndpoint: freezed == browseEndpoint ? _self.browseEndpoint : browseEndpoint // ignore: cast_nullable_to_non_nullable
as BrowseEndpoint?,shareEntityEndpoint: freezed == shareEntityEndpoint ? _self.shareEntityEndpoint : shareEntityEndpoint // ignore: cast_nullable_to_non_nullable
as ShareEntityEndpoint?,
  ));
}

/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PurpleWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_self.modalEndpoint == null) {
    return null;
  }

  return $ModalEndpointCopyWith<$Res>(_self.modalEndpoint!, (value) {
    return _then(_self.copyWith(modalEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_self.browseEndpoint == null) {
    return null;
  }

  return $BrowseEndpointCopyWith<$Res>(_self.browseEndpoint!, (value) {
    return _then(_self.copyWith(browseEndpoint: value));
  });
}/// Create a copy of MenuNavigationItemRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint {
    if (_self.shareEntityEndpoint == null) {
    return null;
  }

  return $ShareEntityEndpointCopyWith<$Res>(_self.shareEntityEndpoint!, (value) {
    return _then(_self.copyWith(shareEntityEndpoint: value));
  });
}
}


/// @nodoc
mixin _$Title {

 List<TitleRun>? get runs;
/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleCopyWith<Title> get copyWith => _$TitleCopyWithImpl<Title>(this as Title, _$identity);

  /// Serializes this Title to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Title&&const DeepCollectionEquality().equals(other.runs, runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(runs));

@override
String toString() {
  return 'Title(runs: $runs)';
}


}

/// @nodoc
abstract mixin class $TitleCopyWith<$Res>  {
  factory $TitleCopyWith(Title value, $Res Function(Title) _then) = _$TitleCopyWithImpl;
@useResult
$Res call({
 List<TitleRun>? runs
});




}
/// @nodoc
class _$TitleCopyWithImpl<$Res>
    implements $TitleCopyWith<$Res> {
  _$TitleCopyWithImpl(this._self, this._then);

  final Title _self;
  final $Res Function(Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? runs = freezed,}) {
  return _then(_self.copyWith(
runs: freezed == runs ? _self.runs : runs // ignore: cast_nullable_to_non_nullable
as List<TitleRun>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Title].
extension TitlePatterns on Title {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Title value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Title() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Title value)  $default,){
final _that = this;
switch (_that) {
case _Title():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Title value)?  $default,){
final _that = this;
switch (_that) {
case _Title() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TitleRun>? runs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that.runs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TitleRun>? runs)  $default,) {final _that = this;
switch (_that) {
case _Title():
return $default(_that.runs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TitleRun>? runs)?  $default,) {final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that.runs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Title implements Title {
  const _Title({final  List<TitleRun>? runs}): _runs = runs;
  factory _Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

 final  List<TitleRun>? _runs;
@override List<TitleRun>? get runs {
  final value = _runs;
  if (value == null) return null;
  if (_runs is EqualUnmodifiableListView) return _runs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleCopyWith<_Title> get copyWith => __$TitleCopyWithImpl<_Title>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Title&&const DeepCollectionEquality().equals(other._runs, _runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_runs));

@override
String toString() {
  return 'Title(runs: $runs)';
}


}

/// @nodoc
abstract mixin class _$TitleCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$TitleCopyWith(_Title value, $Res Function(_Title) _then) = __$TitleCopyWithImpl;
@override @useResult
$Res call({
 List<TitleRun>? runs
});




}
/// @nodoc
class __$TitleCopyWithImpl<$Res>
    implements _$TitleCopyWith<$Res> {
  __$TitleCopyWithImpl(this._self, this._then);

  final _Title _self;
  final $Res Function(_Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? runs = freezed,}) {
  return _then(_Title(
runs: freezed == runs ? _self._runs : runs // ignore: cast_nullable_to_non_nullable
as List<TitleRun>?,
  ));
}


}


/// @nodoc
mixin _$TitleRun {

 String? get text;
/// Create a copy of TitleRun
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleRunCopyWith<TitleRun> get copyWith => _$TitleRunCopyWithImpl<TitleRun>(this as TitleRun, _$identity);

  /// Serializes this TitleRun to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TitleRun&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TitleRun(text: $text)';
}


}

/// @nodoc
abstract mixin class $TitleRunCopyWith<$Res>  {
  factory $TitleRunCopyWith(TitleRun value, $Res Function(TitleRun) _then) = _$TitleRunCopyWithImpl;
@useResult
$Res call({
 String? text
});




}
/// @nodoc
class _$TitleRunCopyWithImpl<$Res>
    implements $TitleRunCopyWith<$Res> {
  _$TitleRunCopyWithImpl(this._self, this._then);

  final TitleRun _self;
  final $Res Function(TitleRun) _then;

/// Create a copy of TitleRun
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TitleRun].
extension TitleRunPatterns on TitleRun {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TitleRun value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitleRun() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TitleRun value)  $default,){
final _that = this;
switch (_that) {
case _TitleRun():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TitleRun value)?  $default,){
final _that = this;
switch (_that) {
case _TitleRun() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitleRun() when $default != null:
return $default(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text)  $default,) {final _that = this;
switch (_that) {
case _TitleRun():
return $default(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text)?  $default,) {final _that = this;
switch (_that) {
case _TitleRun() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TitleRun implements TitleRun {
  const _TitleRun({this.text});
  factory _TitleRun.fromJson(Map<String, dynamic> json) => _$TitleRunFromJson(json);

@override final  String? text;

/// Create a copy of TitleRun
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleRunCopyWith<_TitleRun> get copyWith => __$TitleRunCopyWithImpl<_TitleRun>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleRunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleRun&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TitleRun(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TitleRunCopyWith<$Res> implements $TitleRunCopyWith<$Res> {
  factory _$TitleRunCopyWith(_TitleRun value, $Res Function(_TitleRun) _then) = __$TitleRunCopyWithImpl;
@override @useResult
$Res call({
 String? text
});




}
/// @nodoc
class __$TitleRunCopyWithImpl<$Res>
    implements _$TitleRunCopyWith<$Res> {
  __$TitleRunCopyWithImpl(this._self, this._then);

  final _TitleRun _self;
  final $Res Function(_TitleRun) _then;

/// Create a copy of TitleRun
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,}) {
  return _then(_TitleRun(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShareEntityEndpoint {

 String? get serializedShareEntity; String? get sharePanelType;
/// Create a copy of ShareEntityEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareEntityEndpointCopyWith<ShareEntityEndpoint> get copyWith => _$ShareEntityEndpointCopyWithImpl<ShareEntityEndpoint>(this as ShareEntityEndpoint, _$identity);

  /// Serializes this ShareEntityEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareEntityEndpoint&&(identical(other.serializedShareEntity, serializedShareEntity) || other.serializedShareEntity == serializedShareEntity)&&(identical(other.sharePanelType, sharePanelType) || other.sharePanelType == sharePanelType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serializedShareEntity,sharePanelType);

@override
String toString() {
  return 'ShareEntityEndpoint(serializedShareEntity: $serializedShareEntity, sharePanelType: $sharePanelType)';
}


}

/// @nodoc
abstract mixin class $ShareEntityEndpointCopyWith<$Res>  {
  factory $ShareEntityEndpointCopyWith(ShareEntityEndpoint value, $Res Function(ShareEntityEndpoint) _then) = _$ShareEntityEndpointCopyWithImpl;
@useResult
$Res call({
 String? serializedShareEntity, String? sharePanelType
});




}
/// @nodoc
class _$ShareEntityEndpointCopyWithImpl<$Res>
    implements $ShareEntityEndpointCopyWith<$Res> {
  _$ShareEntityEndpointCopyWithImpl(this._self, this._then);

  final ShareEntityEndpoint _self;
  final $Res Function(ShareEntityEndpoint) _then;

/// Create a copy of ShareEntityEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serializedShareEntity = freezed,Object? sharePanelType = freezed,}) {
  return _then(_self.copyWith(
serializedShareEntity: freezed == serializedShareEntity ? _self.serializedShareEntity : serializedShareEntity // ignore: cast_nullable_to_non_nullable
as String?,sharePanelType: freezed == sharePanelType ? _self.sharePanelType : sharePanelType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareEntityEndpoint].
extension ShareEntityEndpointPatterns on ShareEntityEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareEntityEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareEntityEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareEntityEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _ShareEntityEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareEntityEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _ShareEntityEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serializedShareEntity,  String? sharePanelType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareEntityEndpoint() when $default != null:
return $default(_that.serializedShareEntity,_that.sharePanelType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serializedShareEntity,  String? sharePanelType)  $default,) {final _that = this;
switch (_that) {
case _ShareEntityEndpoint():
return $default(_that.serializedShareEntity,_that.sharePanelType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serializedShareEntity,  String? sharePanelType)?  $default,) {final _that = this;
switch (_that) {
case _ShareEntityEndpoint() when $default != null:
return $default(_that.serializedShareEntity,_that.sharePanelType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareEntityEndpoint implements ShareEntityEndpoint {
  const _ShareEntityEndpoint({this.serializedShareEntity, this.sharePanelType});
  factory _ShareEntityEndpoint.fromJson(Map<String, dynamic> json) => _$ShareEntityEndpointFromJson(json);

@override final  String? serializedShareEntity;
@override final  String? sharePanelType;

/// Create a copy of ShareEntityEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareEntityEndpointCopyWith<_ShareEntityEndpoint> get copyWith => __$ShareEntityEndpointCopyWithImpl<_ShareEntityEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareEntityEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareEntityEndpoint&&(identical(other.serializedShareEntity, serializedShareEntity) || other.serializedShareEntity == serializedShareEntity)&&(identical(other.sharePanelType, sharePanelType) || other.sharePanelType == sharePanelType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serializedShareEntity,sharePanelType);

@override
String toString() {
  return 'ShareEntityEndpoint(serializedShareEntity: $serializedShareEntity, sharePanelType: $sharePanelType)';
}


}

/// @nodoc
abstract mixin class _$ShareEntityEndpointCopyWith<$Res> implements $ShareEntityEndpointCopyWith<$Res> {
  factory _$ShareEntityEndpointCopyWith(_ShareEntityEndpoint value, $Res Function(_ShareEntityEndpoint) _then) = __$ShareEntityEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? serializedShareEntity, String? sharePanelType
});




}
/// @nodoc
class __$ShareEntityEndpointCopyWithImpl<$Res>
    implements _$ShareEntityEndpointCopyWith<$Res> {
  __$ShareEntityEndpointCopyWithImpl(this._self, this._then);

  final _ShareEntityEndpoint _self;
  final $Res Function(_ShareEntityEndpoint) _then;

/// Create a copy of ShareEntityEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serializedShareEntity = freezed,Object? sharePanelType = freezed,}) {
  return _then(_ShareEntityEndpoint(
serializedShareEntity: freezed == serializedShareEntity ? _self.serializedShareEntity : serializedShareEntity // ignore: cast_nullable_to_non_nullable
as String?,sharePanelType: freezed == sharePanelType ? _self.sharePanelType : sharePanelType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ModalEndpoint {

 Modal? get modal;
/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalEndpointCopyWith<ModalEndpoint> get copyWith => _$ModalEndpointCopyWithImpl<ModalEndpoint>(this as ModalEndpoint, _$identity);

  /// Serializes this ModalEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModalEndpoint&&(identical(other.modal, modal) || other.modal == modal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modal);

@override
String toString() {
  return 'ModalEndpoint(modal: $modal)';
}


}

/// @nodoc
abstract mixin class $ModalEndpointCopyWith<$Res>  {
  factory $ModalEndpointCopyWith(ModalEndpoint value, $Res Function(ModalEndpoint) _then) = _$ModalEndpointCopyWithImpl;
@useResult
$Res call({
 Modal? modal
});


$ModalCopyWith<$Res>? get modal;

}
/// @nodoc
class _$ModalEndpointCopyWithImpl<$Res>
    implements $ModalEndpointCopyWith<$Res> {
  _$ModalEndpointCopyWithImpl(this._self, this._then);

  final ModalEndpoint _self;
  final $Res Function(ModalEndpoint) _then;

/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modal = freezed,}) {
  return _then(_self.copyWith(
modal: freezed == modal ? _self.modal : modal // ignore: cast_nullable_to_non_nullable
as Modal?,
  ));
}
/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalCopyWith<$Res>? get modal {
    if (_self.modal == null) {
    return null;
  }

  return $ModalCopyWith<$Res>(_self.modal!, (value) {
    return _then(_self.copyWith(modal: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModalEndpoint].
extension ModalEndpointPatterns on ModalEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModalEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModalEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModalEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _ModalEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModalEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _ModalEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Modal? modal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModalEndpoint() when $default != null:
return $default(_that.modal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Modal? modal)  $default,) {final _that = this;
switch (_that) {
case _ModalEndpoint():
return $default(_that.modal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Modal? modal)?  $default,) {final _that = this;
switch (_that) {
case _ModalEndpoint() when $default != null:
return $default(_that.modal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModalEndpoint implements ModalEndpoint {
  const _ModalEndpoint({this.modal});
  factory _ModalEndpoint.fromJson(Map<String, dynamic> json) => _$ModalEndpointFromJson(json);

@override final  Modal? modal;

/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalEndpointCopyWith<_ModalEndpoint> get copyWith => __$ModalEndpointCopyWithImpl<_ModalEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModalEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModalEndpoint&&(identical(other.modal, modal) || other.modal == modal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modal);

@override
String toString() {
  return 'ModalEndpoint(modal: $modal)';
}


}

/// @nodoc
abstract mixin class _$ModalEndpointCopyWith<$Res> implements $ModalEndpointCopyWith<$Res> {
  factory _$ModalEndpointCopyWith(_ModalEndpoint value, $Res Function(_ModalEndpoint) _then) = __$ModalEndpointCopyWithImpl;
@override @useResult
$Res call({
 Modal? modal
});


@override $ModalCopyWith<$Res>? get modal;

}
/// @nodoc
class __$ModalEndpointCopyWithImpl<$Res>
    implements _$ModalEndpointCopyWith<$Res> {
  __$ModalEndpointCopyWithImpl(this._self, this._then);

  final _ModalEndpoint _self;
  final $Res Function(_ModalEndpoint) _then;

/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modal = freezed,}) {
  return _then(_ModalEndpoint(
modal: freezed == modal ? _self.modal : modal // ignore: cast_nullable_to_non_nullable
as Modal?,
  ));
}

/// Create a copy of ModalEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalCopyWith<$Res>? get modal {
    if (_self.modal == null) {
    return null;
  }

  return $ModalCopyWith<$Res>(_self.modal!, (value) {
    return _then(_self.copyWith(modal: value));
  });
}
}


/// @nodoc
mixin _$Modal {

 ModalWithTitleAndButtonRenderer? get modalWithTitleAndButtonRenderer;
/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalCopyWith<Modal> get copyWith => _$ModalCopyWithImpl<Modal>(this as Modal, _$identity);

  /// Serializes this Modal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Modal&&(identical(other.modalWithTitleAndButtonRenderer, modalWithTitleAndButtonRenderer) || other.modalWithTitleAndButtonRenderer == modalWithTitleAndButtonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modalWithTitleAndButtonRenderer);

@override
String toString() {
  return 'Modal(modalWithTitleAndButtonRenderer: $modalWithTitleAndButtonRenderer)';
}


}

/// @nodoc
abstract mixin class $ModalCopyWith<$Res>  {
  factory $ModalCopyWith(Modal value, $Res Function(Modal) _then) = _$ModalCopyWithImpl;
@useResult
$Res call({
 ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer
});


$ModalWithTitleAndButtonRendererCopyWith<$Res>? get modalWithTitleAndButtonRenderer;

}
/// @nodoc
class _$ModalCopyWithImpl<$Res>
    implements $ModalCopyWith<$Res> {
  _$ModalCopyWithImpl(this._self, this._then);

  final Modal _self;
  final $Res Function(Modal) _then;

/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modalWithTitleAndButtonRenderer = freezed,}) {
  return _then(_self.copyWith(
modalWithTitleAndButtonRenderer: freezed == modalWithTitleAndButtonRenderer ? _self.modalWithTitleAndButtonRenderer : modalWithTitleAndButtonRenderer // ignore: cast_nullable_to_non_nullable
as ModalWithTitleAndButtonRenderer?,
  ));
}
/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalWithTitleAndButtonRendererCopyWith<$Res>? get modalWithTitleAndButtonRenderer {
    if (_self.modalWithTitleAndButtonRenderer == null) {
    return null;
  }

  return $ModalWithTitleAndButtonRendererCopyWith<$Res>(_self.modalWithTitleAndButtonRenderer!, (value) {
    return _then(_self.copyWith(modalWithTitleAndButtonRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Modal].
extension ModalPatterns on Modal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Modal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Modal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Modal value)  $default,){
final _that = this;
switch (_that) {
case _Modal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Modal value)?  $default,){
final _that = this;
switch (_that) {
case _Modal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Modal() when $default != null:
return $default(_that.modalWithTitleAndButtonRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer)  $default,) {final _that = this;
switch (_that) {
case _Modal():
return $default(_that.modalWithTitleAndButtonRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Modal() when $default != null:
return $default(_that.modalWithTitleAndButtonRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Modal implements Modal {
  const _Modal({this.modalWithTitleAndButtonRenderer});
  factory _Modal.fromJson(Map<String, dynamic> json) => _$ModalFromJson(json);

@override final  ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer;

/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalCopyWith<_Modal> get copyWith => __$ModalCopyWithImpl<_Modal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Modal&&(identical(other.modalWithTitleAndButtonRenderer, modalWithTitleAndButtonRenderer) || other.modalWithTitleAndButtonRenderer == modalWithTitleAndButtonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modalWithTitleAndButtonRenderer);

@override
String toString() {
  return 'Modal(modalWithTitleAndButtonRenderer: $modalWithTitleAndButtonRenderer)';
}


}

/// @nodoc
abstract mixin class _$ModalCopyWith<$Res> implements $ModalCopyWith<$Res> {
  factory _$ModalCopyWith(_Modal value, $Res Function(_Modal) _then) = __$ModalCopyWithImpl;
@override @useResult
$Res call({
 ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer
});


@override $ModalWithTitleAndButtonRendererCopyWith<$Res>? get modalWithTitleAndButtonRenderer;

}
/// @nodoc
class __$ModalCopyWithImpl<$Res>
    implements _$ModalCopyWith<$Res> {
  __$ModalCopyWithImpl(this._self, this._then);

  final _Modal _self;
  final $Res Function(_Modal) _then;

/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modalWithTitleAndButtonRenderer = freezed,}) {
  return _then(_Modal(
modalWithTitleAndButtonRenderer: freezed == modalWithTitleAndButtonRenderer ? _self.modalWithTitleAndButtonRenderer : modalWithTitleAndButtonRenderer // ignore: cast_nullable_to_non_nullable
as ModalWithTitleAndButtonRenderer?,
  ));
}

/// Create a copy of Modal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalWithTitleAndButtonRendererCopyWith<$Res>? get modalWithTitleAndButtonRenderer {
    if (_self.modalWithTitleAndButtonRenderer == null) {
    return null;
  }

  return $ModalWithTitleAndButtonRendererCopyWith<$Res>(_self.modalWithTitleAndButtonRenderer!, (value) {
    return _then(_self.copyWith(modalWithTitleAndButtonRenderer: value));
  });
}
}


/// @nodoc
mixin _$ModalWithTitleAndButtonRenderer {

 Title? get title; Title? get content; Button? get button;
/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalWithTitleAndButtonRendererCopyWith<ModalWithTitleAndButtonRenderer> get copyWith => _$ModalWithTitleAndButtonRendererCopyWithImpl<ModalWithTitleAndButtonRenderer>(this as ModalWithTitleAndButtonRenderer, _$identity);

  /// Serializes this ModalWithTitleAndButtonRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModalWithTitleAndButtonRenderer&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.button, button) || other.button == button));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,button);

@override
String toString() {
  return 'ModalWithTitleAndButtonRenderer(title: $title, content: $content, button: $button)';
}


}

/// @nodoc
abstract mixin class $ModalWithTitleAndButtonRendererCopyWith<$Res>  {
  factory $ModalWithTitleAndButtonRendererCopyWith(ModalWithTitleAndButtonRenderer value, $Res Function(ModalWithTitleAndButtonRenderer) _then) = _$ModalWithTitleAndButtonRendererCopyWithImpl;
@useResult
$Res call({
 Title? title, Title? content, Button? button
});


$TitleCopyWith<$Res>? get title;$TitleCopyWith<$Res>? get content;$ButtonCopyWith<$Res>? get button;

}
/// @nodoc
class _$ModalWithTitleAndButtonRendererCopyWithImpl<$Res>
    implements $ModalWithTitleAndButtonRendererCopyWith<$Res> {
  _$ModalWithTitleAndButtonRendererCopyWithImpl(this._self, this._then);

  final ModalWithTitleAndButtonRenderer _self;
  final $Res Function(ModalWithTitleAndButtonRenderer) _then;

/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? content = freezed,Object? button = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Title?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as Button?,
  ));
}
/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $ButtonCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModalWithTitleAndButtonRenderer].
extension ModalWithTitleAndButtonRendererPatterns on ModalWithTitleAndButtonRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModalWithTitleAndButtonRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModalWithTitleAndButtonRenderer value)  $default,){
final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModalWithTitleAndButtonRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? title,  Title? content,  Button? button)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer() when $default != null:
return $default(_that.title,_that.content,_that.button);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? title,  Title? content,  Button? button)  $default,) {final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer():
return $default(_that.title,_that.content,_that.button);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? title,  Title? content,  Button? button)?  $default,) {final _that = this;
switch (_that) {
case _ModalWithTitleAndButtonRenderer() when $default != null:
return $default(_that.title,_that.content,_that.button);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModalWithTitleAndButtonRenderer implements ModalWithTitleAndButtonRenderer {
  const _ModalWithTitleAndButtonRenderer({this.title, this.content, this.button});
  factory _ModalWithTitleAndButtonRenderer.fromJson(Map<String, dynamic> json) => _$ModalWithTitleAndButtonRendererFromJson(json);

@override final  Title? title;
@override final  Title? content;
@override final  Button? button;

/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalWithTitleAndButtonRendererCopyWith<_ModalWithTitleAndButtonRenderer> get copyWith => __$ModalWithTitleAndButtonRendererCopyWithImpl<_ModalWithTitleAndButtonRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModalWithTitleAndButtonRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModalWithTitleAndButtonRenderer&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.button, button) || other.button == button));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,button);

@override
String toString() {
  return 'ModalWithTitleAndButtonRenderer(title: $title, content: $content, button: $button)';
}


}

/// @nodoc
abstract mixin class _$ModalWithTitleAndButtonRendererCopyWith<$Res> implements $ModalWithTitleAndButtonRendererCopyWith<$Res> {
  factory _$ModalWithTitleAndButtonRendererCopyWith(_ModalWithTitleAndButtonRenderer value, $Res Function(_ModalWithTitleAndButtonRenderer) _then) = __$ModalWithTitleAndButtonRendererCopyWithImpl;
@override @useResult
$Res call({
 Title? title, Title? content, Button? button
});


@override $TitleCopyWith<$Res>? get title;@override $TitleCopyWith<$Res>? get content;@override $ButtonCopyWith<$Res>? get button;

}
/// @nodoc
class __$ModalWithTitleAndButtonRendererCopyWithImpl<$Res>
    implements _$ModalWithTitleAndButtonRendererCopyWith<$Res> {
  __$ModalWithTitleAndButtonRendererCopyWithImpl(this._self, this._then);

  final _ModalWithTitleAndButtonRenderer _self;
  final $Res Function(_ModalWithTitleAndButtonRenderer) _then;

/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? content = freezed,Object? button = freezed,}) {
  return _then(_ModalWithTitleAndButtonRenderer(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Title?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as Button?,
  ));
}

/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of ModalWithTitleAndButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $ButtonCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}
}


/// @nodoc
mixin _$Button {

 ButtonRenderer? get buttonRenderer;
/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ButtonCopyWith<Button> get copyWith => _$ButtonCopyWithImpl<Button>(this as Button, _$identity);

  /// Serializes this Button to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Button&&(identical(other.buttonRenderer, buttonRenderer) || other.buttonRenderer == buttonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buttonRenderer);

@override
String toString() {
  return 'Button(buttonRenderer: $buttonRenderer)';
}


}

/// @nodoc
abstract mixin class $ButtonCopyWith<$Res>  {
  factory $ButtonCopyWith(Button value, $Res Function(Button) _then) = _$ButtonCopyWithImpl;
@useResult
$Res call({
 ButtonRenderer? buttonRenderer
});


$ButtonRendererCopyWith<$Res>? get buttonRenderer;

}
/// @nodoc
class _$ButtonCopyWithImpl<$Res>
    implements $ButtonCopyWith<$Res> {
  _$ButtonCopyWithImpl(this._self, this._then);

  final Button _self;
  final $Res Function(Button) _then;

/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buttonRenderer = freezed,}) {
  return _then(_self.copyWith(
buttonRenderer: freezed == buttonRenderer ? _self.buttonRenderer : buttonRenderer // ignore: cast_nullable_to_non_nullable
as ButtonRenderer?,
  ));
}
/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonRendererCopyWith<$Res>? get buttonRenderer {
    if (_self.buttonRenderer == null) {
    return null;
  }

  return $ButtonRendererCopyWith<$Res>(_self.buttonRenderer!, (value) {
    return _then(_self.copyWith(buttonRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Button].
extension ButtonPatterns on Button {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Button value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Button() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Button value)  $default,){
final _that = this;
switch (_that) {
case _Button():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Button value)?  $default,){
final _that = this;
switch (_that) {
case _Button() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ButtonRenderer? buttonRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Button() when $default != null:
return $default(_that.buttonRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ButtonRenderer? buttonRenderer)  $default,) {final _that = this;
switch (_that) {
case _Button():
return $default(_that.buttonRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ButtonRenderer? buttonRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Button() when $default != null:
return $default(_that.buttonRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Button implements Button {
  const _Button({this.buttonRenderer});
  factory _Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);

@override final  ButtonRenderer? buttonRenderer;

/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ButtonCopyWith<_Button> get copyWith => __$ButtonCopyWithImpl<_Button>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ButtonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Button&&(identical(other.buttonRenderer, buttonRenderer) || other.buttonRenderer == buttonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buttonRenderer);

@override
String toString() {
  return 'Button(buttonRenderer: $buttonRenderer)';
}


}

/// @nodoc
abstract mixin class _$ButtonCopyWith<$Res> implements $ButtonCopyWith<$Res> {
  factory _$ButtonCopyWith(_Button value, $Res Function(_Button) _then) = __$ButtonCopyWithImpl;
@override @useResult
$Res call({
 ButtonRenderer? buttonRenderer
});


@override $ButtonRendererCopyWith<$Res>? get buttonRenderer;

}
/// @nodoc
class __$ButtonCopyWithImpl<$Res>
    implements _$ButtonCopyWith<$Res> {
  __$ButtonCopyWithImpl(this._self, this._then);

  final _Button _self;
  final $Res Function(_Button) _then;

/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buttonRenderer = freezed,}) {
  return _then(_Button(
buttonRenderer: freezed == buttonRenderer ? _self.buttonRenderer : buttonRenderer // ignore: cast_nullable_to_non_nullable
as ButtonRenderer?,
  ));
}

/// Create a copy of Button
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonRendererCopyWith<$Res>? get buttonRenderer {
    if (_self.buttonRenderer == null) {
    return null;
  }

  return $ButtonRendererCopyWith<$Res>(_self.buttonRenderer!, (value) {
    return _then(_self.copyWith(buttonRenderer: value));
  });
}
}


/// @nodoc
mixin _$ButtonRenderer {

 String? get style; bool? get isDisabled; Title? get text; ButtonRendererNavigationEndpoint? get navigationEndpoint; String? get trackingParams;
/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ButtonRendererCopyWith<ButtonRenderer> get copyWith => _$ButtonRendererCopyWithImpl<ButtonRenderer>(this as ButtonRenderer, _$identity);

  /// Serializes this ButtonRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ButtonRenderer&&(identical(other.style, style) || other.style == style)&&(identical(other.isDisabled, isDisabled) || other.isDisabled == isDisabled)&&(identical(other.text, text) || other.text == text)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,isDisabled,text,navigationEndpoint,trackingParams);

@override
String toString() {
  return 'ButtonRenderer(style: $style, isDisabled: $isDisabled, text: $text, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $ButtonRendererCopyWith<$Res>  {
  factory $ButtonRendererCopyWith(ButtonRenderer value, $Res Function(ButtonRenderer) _then) = _$ButtonRendererCopyWithImpl;
@useResult
$Res call({
 String? style, bool? isDisabled, Title? text, ButtonRendererNavigationEndpoint? navigationEndpoint, String? trackingParams
});


$TitleCopyWith<$Res>? get text;$ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;

}
/// @nodoc
class _$ButtonRendererCopyWithImpl<$Res>
    implements $ButtonRendererCopyWith<$Res> {
  _$ButtonRendererCopyWithImpl(this._self, this._then);

  final ButtonRenderer _self;
  final $Res Function(ButtonRenderer) _then;

/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? style = freezed,Object? isDisabled = freezed,Object? text = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,isDisabled: freezed == isDisabled ? _self.isDisabled : isDisabled // ignore: cast_nullable_to_non_nullable
as bool?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as ButtonRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $ButtonRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [ButtonRenderer].
extension ButtonRendererPatterns on ButtonRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ButtonRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ButtonRenderer value)  $default,){
final _that = this;
switch (_that) {
case _ButtonRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ButtonRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _ButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? style,  bool? isDisabled,  Title? text,  ButtonRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ButtonRenderer() when $default != null:
return $default(_that.style,_that.isDisabled,_that.text,_that.navigationEndpoint,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? style,  bool? isDisabled,  Title? text,  ButtonRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _ButtonRenderer():
return $default(_that.style,_that.isDisabled,_that.text,_that.navigationEndpoint,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? style,  bool? isDisabled,  Title? text,  ButtonRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _ButtonRenderer() when $default != null:
return $default(_that.style,_that.isDisabled,_that.text,_that.navigationEndpoint,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ButtonRenderer implements ButtonRenderer {
  const _ButtonRenderer({this.style, this.isDisabled, this.text, this.navigationEndpoint, this.trackingParams});
  factory _ButtonRenderer.fromJson(Map<String, dynamic> json) => _$ButtonRendererFromJson(json);

@override final  String? style;
@override final  bool? isDisabled;
@override final  Title? text;
@override final  ButtonRendererNavigationEndpoint? navigationEndpoint;
@override final  String? trackingParams;

/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ButtonRendererCopyWith<_ButtonRenderer> get copyWith => __$ButtonRendererCopyWithImpl<_ButtonRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ButtonRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ButtonRenderer&&(identical(other.style, style) || other.style == style)&&(identical(other.isDisabled, isDisabled) || other.isDisabled == isDisabled)&&(identical(other.text, text) || other.text == text)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,isDisabled,text,navigationEndpoint,trackingParams);

@override
String toString() {
  return 'ButtonRenderer(style: $style, isDisabled: $isDisabled, text: $text, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$ButtonRendererCopyWith<$Res> implements $ButtonRendererCopyWith<$Res> {
  factory _$ButtonRendererCopyWith(_ButtonRenderer value, $Res Function(_ButtonRenderer) _then) = __$ButtonRendererCopyWithImpl;
@override @useResult
$Res call({
 String? style, bool? isDisabled, Title? text, ButtonRendererNavigationEndpoint? navigationEndpoint, String? trackingParams
});


@override $TitleCopyWith<$Res>? get text;@override $ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;

}
/// @nodoc
class __$ButtonRendererCopyWithImpl<$Res>
    implements _$ButtonRendererCopyWith<$Res> {
  __$ButtonRendererCopyWithImpl(this._self, this._then);

  final _ButtonRenderer _self;
  final $Res Function(_ButtonRenderer) _then;

/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? style = freezed,Object? isDisabled = freezed,Object? text = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,}) {
  return _then(_ButtonRenderer(
style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String?,isDisabled: freezed == isDisabled ? _self.isDisabled : isDisabled // ignore: cast_nullable_to_non_nullable
as bool?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as ButtonRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}/// Create a copy of ButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $ButtonRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}
}


/// @nodoc
mixin _$ButtonRendererNavigationEndpoint {

 String? get clickTrackingParams; SignInEndpoint? get signInEndpoint;
/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ButtonRendererNavigationEndpointCopyWith<ButtonRendererNavigationEndpoint> get copyWith => _$ButtonRendererNavigationEndpointCopyWithImpl<ButtonRendererNavigationEndpoint>(this as ButtonRendererNavigationEndpoint, _$identity);

  /// Serializes this ButtonRendererNavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ButtonRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.signInEndpoint, signInEndpoint) || other.signInEndpoint == signInEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,signInEndpoint);

@override
String toString() {
  return 'ButtonRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, signInEndpoint: $signInEndpoint)';
}


}

/// @nodoc
abstract mixin class $ButtonRendererNavigationEndpointCopyWith<$Res>  {
  factory $ButtonRendererNavigationEndpointCopyWith(ButtonRendererNavigationEndpoint value, $Res Function(ButtonRendererNavigationEndpoint) _then) = _$ButtonRendererNavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, SignInEndpoint? signInEndpoint
});


$SignInEndpointCopyWith<$Res>? get signInEndpoint;

}
/// @nodoc
class _$ButtonRendererNavigationEndpointCopyWithImpl<$Res>
    implements $ButtonRendererNavigationEndpointCopyWith<$Res> {
  _$ButtonRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final ButtonRendererNavigationEndpoint _self;
  final $Res Function(ButtonRendererNavigationEndpoint) _then;

/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? signInEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,signInEndpoint: freezed == signInEndpoint ? _self.signInEndpoint : signInEndpoint // ignore: cast_nullable_to_non_nullable
as SignInEndpoint?,
  ));
}
/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInEndpointCopyWith<$Res>? get signInEndpoint {
    if (_self.signInEndpoint == null) {
    return null;
  }

  return $SignInEndpointCopyWith<$Res>(_self.signInEndpoint!, (value) {
    return _then(_self.copyWith(signInEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [ButtonRendererNavigationEndpoint].
extension ButtonRendererNavigationEndpointPatterns on ButtonRendererNavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ButtonRendererNavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ButtonRendererNavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ButtonRendererNavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  SignInEndpoint? signInEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.signInEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  SignInEndpoint? signInEndpoint)  $default,) {final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint():
return $default(_that.clickTrackingParams,_that.signInEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  SignInEndpoint? signInEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _ButtonRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.signInEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ButtonRendererNavigationEndpoint implements ButtonRendererNavigationEndpoint {
  const _ButtonRendererNavigationEndpoint({this.clickTrackingParams, this.signInEndpoint});
  factory _ButtonRendererNavigationEndpoint.fromJson(Map<String, dynamic> json) => _$ButtonRendererNavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  SignInEndpoint? signInEndpoint;

/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ButtonRendererNavigationEndpointCopyWith<_ButtonRendererNavigationEndpoint> get copyWith => __$ButtonRendererNavigationEndpointCopyWithImpl<_ButtonRendererNavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ButtonRendererNavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ButtonRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.signInEndpoint, signInEndpoint) || other.signInEndpoint == signInEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,signInEndpoint);

@override
String toString() {
  return 'ButtonRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, signInEndpoint: $signInEndpoint)';
}


}

/// @nodoc
abstract mixin class _$ButtonRendererNavigationEndpointCopyWith<$Res> implements $ButtonRendererNavigationEndpointCopyWith<$Res> {
  factory _$ButtonRendererNavigationEndpointCopyWith(_ButtonRendererNavigationEndpoint value, $Res Function(_ButtonRendererNavigationEndpoint) _then) = __$ButtonRendererNavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, SignInEndpoint? signInEndpoint
});


@override $SignInEndpointCopyWith<$Res>? get signInEndpoint;

}
/// @nodoc
class __$ButtonRendererNavigationEndpointCopyWithImpl<$Res>
    implements _$ButtonRendererNavigationEndpointCopyWith<$Res> {
  __$ButtonRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final _ButtonRendererNavigationEndpoint _self;
  final $Res Function(_ButtonRendererNavigationEndpoint) _then;

/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? signInEndpoint = freezed,}) {
  return _then(_ButtonRendererNavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,signInEndpoint: freezed == signInEndpoint ? _self.signInEndpoint : signInEndpoint // ignore: cast_nullable_to_non_nullable
as SignInEndpoint?,
  ));
}

/// Create a copy of ButtonRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInEndpointCopyWith<$Res>? get signInEndpoint {
    if (_self.signInEndpoint == null) {
    return null;
  }

  return $SignInEndpointCopyWith<$Res>(_self.signInEndpoint!, (value) {
    return _then(_self.copyWith(signInEndpoint: value));
  });
}
}


/// @nodoc
mixin _$SignInEndpoint {

 bool? get hack;
/// Create a copy of SignInEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInEndpointCopyWith<SignInEndpoint> get copyWith => _$SignInEndpointCopyWithImpl<SignInEndpoint>(this as SignInEndpoint, _$identity);

  /// Serializes this SignInEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInEndpoint&&(identical(other.hack, hack) || other.hack == hack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hack);

@override
String toString() {
  return 'SignInEndpoint(hack: $hack)';
}


}

/// @nodoc
abstract mixin class $SignInEndpointCopyWith<$Res>  {
  factory $SignInEndpointCopyWith(SignInEndpoint value, $Res Function(SignInEndpoint) _then) = _$SignInEndpointCopyWithImpl;
@useResult
$Res call({
 bool? hack
});




}
/// @nodoc
class _$SignInEndpointCopyWithImpl<$Res>
    implements $SignInEndpointCopyWith<$Res> {
  _$SignInEndpointCopyWithImpl(this._self, this._then);

  final SignInEndpoint _self;
  final $Res Function(SignInEndpoint) _then;

/// Create a copy of SignInEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hack = freezed,}) {
  return _then(_self.copyWith(
hack: freezed == hack ? _self.hack : hack // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInEndpoint].
extension SignInEndpointPatterns on SignInEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _SignInEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _SignInEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? hack)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInEndpoint() when $default != null:
return $default(_that.hack);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? hack)  $default,) {final _that = this;
switch (_that) {
case _SignInEndpoint():
return $default(_that.hack);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? hack)?  $default,) {final _that = this;
switch (_that) {
case _SignInEndpoint() when $default != null:
return $default(_that.hack);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignInEndpoint implements SignInEndpoint {
  const _SignInEndpoint({this.hack});
  factory _SignInEndpoint.fromJson(Map<String, dynamic> json) => _$SignInEndpointFromJson(json);

@override final  bool? hack;

/// Create a copy of SignInEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInEndpointCopyWith<_SignInEndpoint> get copyWith => __$SignInEndpointCopyWithImpl<_SignInEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignInEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInEndpoint&&(identical(other.hack, hack) || other.hack == hack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hack);

@override
String toString() {
  return 'SignInEndpoint(hack: $hack)';
}


}

/// @nodoc
abstract mixin class _$SignInEndpointCopyWith<$Res> implements $SignInEndpointCopyWith<$Res> {
  factory _$SignInEndpointCopyWith(_SignInEndpoint value, $Res Function(_SignInEndpoint) _then) = __$SignInEndpointCopyWithImpl;
@override @useResult
$Res call({
 bool? hack
});




}
/// @nodoc
class __$SignInEndpointCopyWithImpl<$Res>
    implements _$SignInEndpointCopyWith<$Res> {
  __$SignInEndpointCopyWithImpl(this._self, this._then);

  final _SignInEndpoint _self;
  final $Res Function(_SignInEndpoint) _then;

/// Create a copy of SignInEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hack = freezed,}) {
  return _then(_SignInEndpoint(
hack: freezed == hack ? _self.hack : hack // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$PurpleWatchEndpoint {

 String? get videoId; String? get playlistId; String? get params; LoggingContext? get loggingContext; WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs;
/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurpleWatchEndpointCopyWith<PurpleWatchEndpoint> get copyWith => _$PurpleWatchEndpointCopyWithImpl<PurpleWatchEndpoint>(this as PurpleWatchEndpoint, _$identity);

  /// Serializes this PurpleWatchEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurpleWatchEndpoint&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.params, params) || other.params == params)&&(identical(other.loggingContext, loggingContext) || other.loggingContext == loggingContext)&&(identical(other.watchEndpointMusicSupportedConfigs, watchEndpointMusicSupportedConfigs) || other.watchEndpointMusicSupportedConfigs == watchEndpointMusicSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,playlistId,params,loggingContext,watchEndpointMusicSupportedConfigs);

@override
String toString() {
  return 'PurpleWatchEndpoint(videoId: $videoId, playlistId: $playlistId, params: $params, loggingContext: $loggingContext, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class $PurpleWatchEndpointCopyWith<$Res>  {
  factory $PurpleWatchEndpointCopyWith(PurpleWatchEndpoint value, $Res Function(PurpleWatchEndpoint) _then) = _$PurpleWatchEndpointCopyWithImpl;
@useResult
$Res call({
 String? videoId, String? playlistId, String? params, LoggingContext? loggingContext, WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs
});


$LoggingContextCopyWith<$Res>? get loggingContext;$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs;

}
/// @nodoc
class _$PurpleWatchEndpointCopyWithImpl<$Res>
    implements $PurpleWatchEndpointCopyWith<$Res> {
  _$PurpleWatchEndpointCopyWithImpl(this._self, this._then);

  final PurpleWatchEndpoint _self;
  final $Res Function(PurpleWatchEndpoint) _then;

/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = freezed,Object? playlistId = freezed,Object? params = freezed,Object? loggingContext = freezed,Object? watchEndpointMusicSupportedConfigs = freezed,}) {
  return _then(_self.copyWith(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,playlistId: freezed == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as String?,loggingContext: freezed == loggingContext ? _self.loggingContext : loggingContext // ignore: cast_nullable_to_non_nullable
as LoggingContext?,watchEndpointMusicSupportedConfigs: freezed == watchEndpointMusicSupportedConfigs ? _self.watchEndpointMusicSupportedConfigs : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicSupportedConfigs?,
  ));
}
/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoggingContextCopyWith<$Res>? get loggingContext {
    if (_self.loggingContext == null) {
    return null;
  }

  return $LoggingContextCopyWith<$Res>(_self.loggingContext!, (value) {
    return _then(_self.copyWith(loggingContext: value));
  });
}/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs {
    if (_self.watchEndpointMusicSupportedConfigs == null) {
    return null;
  }

  return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(_self.watchEndpointMusicSupportedConfigs!, (value) {
    return _then(_self.copyWith(watchEndpointMusicSupportedConfigs: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurpleWatchEndpoint].
extension PurpleWatchEndpointPatterns on PurpleWatchEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurpleWatchEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurpleWatchEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurpleWatchEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _PurpleWatchEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurpleWatchEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _PurpleWatchEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? videoId,  String? playlistId,  String? params,  LoggingContext? loggingContext,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurpleWatchEndpoint() when $default != null:
return $default(_that.videoId,_that.playlistId,_that.params,_that.loggingContext,_that.watchEndpointMusicSupportedConfigs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? videoId,  String? playlistId,  String? params,  LoggingContext? loggingContext,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)  $default,) {final _that = this;
switch (_that) {
case _PurpleWatchEndpoint():
return $default(_that.videoId,_that.playlistId,_that.params,_that.loggingContext,_that.watchEndpointMusicSupportedConfigs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? videoId,  String? playlistId,  String? params,  LoggingContext? loggingContext,  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs)?  $default,) {final _that = this;
switch (_that) {
case _PurpleWatchEndpoint() when $default != null:
return $default(_that.videoId,_that.playlistId,_that.params,_that.loggingContext,_that.watchEndpointMusicSupportedConfigs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurpleWatchEndpoint implements PurpleWatchEndpoint {
  const _PurpleWatchEndpoint({this.videoId, this.playlistId, this.params, this.loggingContext, this.watchEndpointMusicSupportedConfigs});
  factory _PurpleWatchEndpoint.fromJson(Map<String, dynamic> json) => _$PurpleWatchEndpointFromJson(json);

@override final  String? videoId;
@override final  String? playlistId;
@override final  String? params;
@override final  LoggingContext? loggingContext;
@override final  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs;

/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurpleWatchEndpointCopyWith<_PurpleWatchEndpoint> get copyWith => __$PurpleWatchEndpointCopyWithImpl<_PurpleWatchEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurpleWatchEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurpleWatchEndpoint&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.params, params) || other.params == params)&&(identical(other.loggingContext, loggingContext) || other.loggingContext == loggingContext)&&(identical(other.watchEndpointMusicSupportedConfigs, watchEndpointMusicSupportedConfigs) || other.watchEndpointMusicSupportedConfigs == watchEndpointMusicSupportedConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,playlistId,params,loggingContext,watchEndpointMusicSupportedConfigs);

@override
String toString() {
  return 'PurpleWatchEndpoint(videoId: $videoId, playlistId: $playlistId, params: $params, loggingContext: $loggingContext, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
}


}

/// @nodoc
abstract mixin class _$PurpleWatchEndpointCopyWith<$Res> implements $PurpleWatchEndpointCopyWith<$Res> {
  factory _$PurpleWatchEndpointCopyWith(_PurpleWatchEndpoint value, $Res Function(_PurpleWatchEndpoint) _then) = __$PurpleWatchEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? videoId, String? playlistId, String? params, LoggingContext? loggingContext, WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs
});


@override $LoggingContextCopyWith<$Res>? get loggingContext;@override $WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs;

}
/// @nodoc
class __$PurpleWatchEndpointCopyWithImpl<$Res>
    implements _$PurpleWatchEndpointCopyWith<$Res> {
  __$PurpleWatchEndpointCopyWithImpl(this._self, this._then);

  final _PurpleWatchEndpoint _self;
  final $Res Function(_PurpleWatchEndpoint) _then;

/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = freezed,Object? playlistId = freezed,Object? params = freezed,Object? loggingContext = freezed,Object? watchEndpointMusicSupportedConfigs = freezed,}) {
  return _then(_PurpleWatchEndpoint(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,playlistId: freezed == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as String?,loggingContext: freezed == loggingContext ? _self.loggingContext : loggingContext // ignore: cast_nullable_to_non_nullable
as LoggingContext?,watchEndpointMusicSupportedConfigs: freezed == watchEndpointMusicSupportedConfigs ? _self.watchEndpointMusicSupportedConfigs : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
as WatchEndpointMusicSupportedConfigs?,
  ));
}

/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoggingContextCopyWith<$Res>? get loggingContext {
    if (_self.loggingContext == null) {
    return null;
  }

  return $LoggingContextCopyWith<$Res>(_self.loggingContext!, (value) {
    return _then(_self.copyWith(loggingContext: value));
  });
}/// Create a copy of PurpleWatchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchEndpointMusicSupportedConfigsCopyWith<$Res>? get watchEndpointMusicSupportedConfigs {
    if (_self.watchEndpointMusicSupportedConfigs == null) {
    return null;
  }

  return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(_self.watchEndpointMusicSupportedConfigs!, (value) {
    return _then(_self.copyWith(watchEndpointMusicSupportedConfigs: value));
  });
}
}


/// @nodoc
mixin _$LoggingContext {

 VssLoggingContext? get vssLoggingContext;
/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggingContextCopyWith<LoggingContext> get copyWith => _$LoggingContextCopyWithImpl<LoggingContext>(this as LoggingContext, _$identity);

  /// Serializes this LoggingContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggingContext&&(identical(other.vssLoggingContext, vssLoggingContext) || other.vssLoggingContext == vssLoggingContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vssLoggingContext);

@override
String toString() {
  return 'LoggingContext(vssLoggingContext: $vssLoggingContext)';
}


}

/// @nodoc
abstract mixin class $LoggingContextCopyWith<$Res>  {
  factory $LoggingContextCopyWith(LoggingContext value, $Res Function(LoggingContext) _then) = _$LoggingContextCopyWithImpl;
@useResult
$Res call({
 VssLoggingContext? vssLoggingContext
});


$VssLoggingContextCopyWith<$Res>? get vssLoggingContext;

}
/// @nodoc
class _$LoggingContextCopyWithImpl<$Res>
    implements $LoggingContextCopyWith<$Res> {
  _$LoggingContextCopyWithImpl(this._self, this._then);

  final LoggingContext _self;
  final $Res Function(LoggingContext) _then;

/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vssLoggingContext = freezed,}) {
  return _then(_self.copyWith(
vssLoggingContext: freezed == vssLoggingContext ? _self.vssLoggingContext : vssLoggingContext // ignore: cast_nullable_to_non_nullable
as VssLoggingContext?,
  ));
}
/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VssLoggingContextCopyWith<$Res>? get vssLoggingContext {
    if (_self.vssLoggingContext == null) {
    return null;
  }

  return $VssLoggingContextCopyWith<$Res>(_self.vssLoggingContext!, (value) {
    return _then(_self.copyWith(vssLoggingContext: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoggingContext].
extension LoggingContextPatterns on LoggingContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoggingContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoggingContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoggingContext value)  $default,){
final _that = this;
switch (_that) {
case _LoggingContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoggingContext value)?  $default,){
final _that = this;
switch (_that) {
case _LoggingContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VssLoggingContext? vssLoggingContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoggingContext() when $default != null:
return $default(_that.vssLoggingContext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VssLoggingContext? vssLoggingContext)  $default,) {final _that = this;
switch (_that) {
case _LoggingContext():
return $default(_that.vssLoggingContext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VssLoggingContext? vssLoggingContext)?  $default,) {final _that = this;
switch (_that) {
case _LoggingContext() when $default != null:
return $default(_that.vssLoggingContext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoggingContext implements LoggingContext {
  const _LoggingContext({this.vssLoggingContext});
  factory _LoggingContext.fromJson(Map<String, dynamic> json) => _$LoggingContextFromJson(json);

@override final  VssLoggingContext? vssLoggingContext;

/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoggingContextCopyWith<_LoggingContext> get copyWith => __$LoggingContextCopyWithImpl<_LoggingContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggingContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggingContext&&(identical(other.vssLoggingContext, vssLoggingContext) || other.vssLoggingContext == vssLoggingContext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vssLoggingContext);

@override
String toString() {
  return 'LoggingContext(vssLoggingContext: $vssLoggingContext)';
}


}

/// @nodoc
abstract mixin class _$LoggingContextCopyWith<$Res> implements $LoggingContextCopyWith<$Res> {
  factory _$LoggingContextCopyWith(_LoggingContext value, $Res Function(_LoggingContext) _then) = __$LoggingContextCopyWithImpl;
@override @useResult
$Res call({
 VssLoggingContext? vssLoggingContext
});


@override $VssLoggingContextCopyWith<$Res>? get vssLoggingContext;

}
/// @nodoc
class __$LoggingContextCopyWithImpl<$Res>
    implements _$LoggingContextCopyWith<$Res> {
  __$LoggingContextCopyWithImpl(this._self, this._then);

  final _LoggingContext _self;
  final $Res Function(_LoggingContext) _then;

/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vssLoggingContext = freezed,}) {
  return _then(_LoggingContext(
vssLoggingContext: freezed == vssLoggingContext ? _self.vssLoggingContext : vssLoggingContext // ignore: cast_nullable_to_non_nullable
as VssLoggingContext?,
  ));
}

/// Create a copy of LoggingContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VssLoggingContextCopyWith<$Res>? get vssLoggingContext {
    if (_self.vssLoggingContext == null) {
    return null;
  }

  return $VssLoggingContextCopyWith<$Res>(_self.vssLoggingContext!, (value) {
    return _then(_self.copyWith(vssLoggingContext: value));
  });
}
}


/// @nodoc
mixin _$VssLoggingContext {

 String? get serializedContextData;
/// Create a copy of VssLoggingContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VssLoggingContextCopyWith<VssLoggingContext> get copyWith => _$VssLoggingContextCopyWithImpl<VssLoggingContext>(this as VssLoggingContext, _$identity);

  /// Serializes this VssLoggingContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VssLoggingContext&&(identical(other.serializedContextData, serializedContextData) || other.serializedContextData == serializedContextData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serializedContextData);

@override
String toString() {
  return 'VssLoggingContext(serializedContextData: $serializedContextData)';
}


}

/// @nodoc
abstract mixin class $VssLoggingContextCopyWith<$Res>  {
  factory $VssLoggingContextCopyWith(VssLoggingContext value, $Res Function(VssLoggingContext) _then) = _$VssLoggingContextCopyWithImpl;
@useResult
$Res call({
 String? serializedContextData
});




}
/// @nodoc
class _$VssLoggingContextCopyWithImpl<$Res>
    implements $VssLoggingContextCopyWith<$Res> {
  _$VssLoggingContextCopyWithImpl(this._self, this._then);

  final VssLoggingContext _self;
  final $Res Function(VssLoggingContext) _then;

/// Create a copy of VssLoggingContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serializedContextData = freezed,}) {
  return _then(_self.copyWith(
serializedContextData: freezed == serializedContextData ? _self.serializedContextData : serializedContextData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VssLoggingContext].
extension VssLoggingContextPatterns on VssLoggingContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VssLoggingContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VssLoggingContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VssLoggingContext value)  $default,){
final _that = this;
switch (_that) {
case _VssLoggingContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VssLoggingContext value)?  $default,){
final _that = this;
switch (_that) {
case _VssLoggingContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serializedContextData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VssLoggingContext() when $default != null:
return $default(_that.serializedContextData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serializedContextData)  $default,) {final _that = this;
switch (_that) {
case _VssLoggingContext():
return $default(_that.serializedContextData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serializedContextData)?  $default,) {final _that = this;
switch (_that) {
case _VssLoggingContext() when $default != null:
return $default(_that.serializedContextData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VssLoggingContext implements VssLoggingContext {
  const _VssLoggingContext({this.serializedContextData});
  factory _VssLoggingContext.fromJson(Map<String, dynamic> json) => _$VssLoggingContextFromJson(json);

@override final  String? serializedContextData;

/// Create a copy of VssLoggingContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VssLoggingContextCopyWith<_VssLoggingContext> get copyWith => __$VssLoggingContextCopyWithImpl<_VssLoggingContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VssLoggingContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VssLoggingContext&&(identical(other.serializedContextData, serializedContextData) || other.serializedContextData == serializedContextData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serializedContextData);

@override
String toString() {
  return 'VssLoggingContext(serializedContextData: $serializedContextData)';
}


}

/// @nodoc
abstract mixin class _$VssLoggingContextCopyWith<$Res> implements $VssLoggingContextCopyWith<$Res> {
  factory _$VssLoggingContextCopyWith(_VssLoggingContext value, $Res Function(_VssLoggingContext) _then) = __$VssLoggingContextCopyWithImpl;
@override @useResult
$Res call({
 String? serializedContextData
});




}
/// @nodoc
class __$VssLoggingContextCopyWithImpl<$Res>
    implements _$VssLoggingContextCopyWith<$Res> {
  __$VssLoggingContextCopyWithImpl(this._self, this._then);

  final _VssLoggingContext _self;
  final $Res Function(_VssLoggingContext) _then;

/// Create a copy of VssLoggingContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serializedContextData = freezed,}) {
  return _then(_VssLoggingContext(
serializedContextData: freezed == serializedContextData ? _self.serializedContextData : serializedContextData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ServiceEndpoint {

 String? get clickTrackingParams; QueueAddEndpoint? get queueAddEndpoint;
/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceEndpointCopyWith<ServiceEndpoint> get copyWith => _$ServiceEndpointCopyWithImpl<ServiceEndpoint>(this as ServiceEndpoint, _$identity);

  /// Serializes this ServiceEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.queueAddEndpoint, queueAddEndpoint) || other.queueAddEndpoint == queueAddEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,queueAddEndpoint);

@override
String toString() {
  return 'ServiceEndpoint(clickTrackingParams: $clickTrackingParams, queueAddEndpoint: $queueAddEndpoint)';
}


}

/// @nodoc
abstract mixin class $ServiceEndpointCopyWith<$Res>  {
  factory $ServiceEndpointCopyWith(ServiceEndpoint value, $Res Function(ServiceEndpoint) _then) = _$ServiceEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, QueueAddEndpoint? queueAddEndpoint
});


$QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint;

}
/// @nodoc
class _$ServiceEndpointCopyWithImpl<$Res>
    implements $ServiceEndpointCopyWith<$Res> {
  _$ServiceEndpointCopyWithImpl(this._self, this._then);

  final ServiceEndpoint _self;
  final $Res Function(ServiceEndpoint) _then;

/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? queueAddEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,queueAddEndpoint: freezed == queueAddEndpoint ? _self.queueAddEndpoint : queueAddEndpoint // ignore: cast_nullable_to_non_nullable
as QueueAddEndpoint?,
  ));
}
/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint {
    if (_self.queueAddEndpoint == null) {
    return null;
  }

  return $QueueAddEndpointCopyWith<$Res>(_self.queueAddEndpoint!, (value) {
    return _then(_self.copyWith(queueAddEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceEndpoint].
extension ServiceEndpointPatterns on ServiceEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _ServiceEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  QueueAddEndpoint? queueAddEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.queueAddEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  QueueAddEndpoint? queueAddEndpoint)  $default,) {final _that = this;
switch (_that) {
case _ServiceEndpoint():
return $default(_that.clickTrackingParams,_that.queueAddEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  QueueAddEndpoint? queueAddEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _ServiceEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.queueAddEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceEndpoint implements ServiceEndpoint {
  const _ServiceEndpoint({this.clickTrackingParams, this.queueAddEndpoint});
  factory _ServiceEndpoint.fromJson(Map<String, dynamic> json) => _$ServiceEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  QueueAddEndpoint? queueAddEndpoint;

/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceEndpointCopyWith<_ServiceEndpoint> get copyWith => __$ServiceEndpointCopyWithImpl<_ServiceEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.queueAddEndpoint, queueAddEndpoint) || other.queueAddEndpoint == queueAddEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,queueAddEndpoint);

@override
String toString() {
  return 'ServiceEndpoint(clickTrackingParams: $clickTrackingParams, queueAddEndpoint: $queueAddEndpoint)';
}


}

/// @nodoc
abstract mixin class _$ServiceEndpointCopyWith<$Res> implements $ServiceEndpointCopyWith<$Res> {
  factory _$ServiceEndpointCopyWith(_ServiceEndpoint value, $Res Function(_ServiceEndpoint) _then) = __$ServiceEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, QueueAddEndpoint? queueAddEndpoint
});


@override $QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint;

}
/// @nodoc
class __$ServiceEndpointCopyWithImpl<$Res>
    implements _$ServiceEndpointCopyWith<$Res> {
  __$ServiceEndpointCopyWithImpl(this._self, this._then);

  final _ServiceEndpoint _self;
  final $Res Function(_ServiceEndpoint) _then;

/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? queueAddEndpoint = freezed,}) {
  return _then(_ServiceEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,queueAddEndpoint: freezed == queueAddEndpoint ? _self.queueAddEndpoint : queueAddEndpoint // ignore: cast_nullable_to_non_nullable
as QueueAddEndpoint?,
  ));
}

/// Create a copy of ServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint {
    if (_self.queueAddEndpoint == null) {
    return null;
  }

  return $QueueAddEndpointCopyWith<$Res>(_self.queueAddEndpoint!, (value) {
    return _then(_self.copyWith(queueAddEndpoint: value));
  });
}
}


/// @nodoc
mixin _$QueueAddEndpoint {

 QueueTarget? get queueTarget; String? get queueInsertPosition; List<Command>? get commands;
/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueAddEndpointCopyWith<QueueAddEndpoint> get copyWith => _$QueueAddEndpointCopyWithImpl<QueueAddEndpoint>(this as QueueAddEndpoint, _$identity);

  /// Serializes this QueueAddEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueAddEndpoint&&(identical(other.queueTarget, queueTarget) || other.queueTarget == queueTarget)&&(identical(other.queueInsertPosition, queueInsertPosition) || other.queueInsertPosition == queueInsertPosition)&&const DeepCollectionEquality().equals(other.commands, commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queueTarget,queueInsertPosition,const DeepCollectionEquality().hash(commands));

@override
String toString() {
  return 'QueueAddEndpoint(queueTarget: $queueTarget, queueInsertPosition: $queueInsertPosition, commands: $commands)';
}


}

/// @nodoc
abstract mixin class $QueueAddEndpointCopyWith<$Res>  {
  factory $QueueAddEndpointCopyWith(QueueAddEndpoint value, $Res Function(QueueAddEndpoint) _then) = _$QueueAddEndpointCopyWithImpl;
@useResult
$Res call({
 QueueTarget? queueTarget, String? queueInsertPosition, List<Command>? commands
});


$QueueTargetCopyWith<$Res>? get queueTarget;

}
/// @nodoc
class _$QueueAddEndpointCopyWithImpl<$Res>
    implements $QueueAddEndpointCopyWith<$Res> {
  _$QueueAddEndpointCopyWithImpl(this._self, this._then);

  final QueueAddEndpoint _self;
  final $Res Function(QueueAddEndpoint) _then;

/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queueTarget = freezed,Object? queueInsertPosition = freezed,Object? commands = freezed,}) {
  return _then(_self.copyWith(
queueTarget: freezed == queueTarget ? _self.queueTarget : queueTarget // ignore: cast_nullable_to_non_nullable
as QueueTarget?,queueInsertPosition: freezed == queueInsertPosition ? _self.queueInsertPosition : queueInsertPosition // ignore: cast_nullable_to_non_nullable
as String?,commands: freezed == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as List<Command>?,
  ));
}
/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTargetCopyWith<$Res>? get queueTarget {
    if (_self.queueTarget == null) {
    return null;
  }

  return $QueueTargetCopyWith<$Res>(_self.queueTarget!, (value) {
    return _then(_self.copyWith(queueTarget: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueAddEndpoint].
extension QueueAddEndpointPatterns on QueueAddEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueAddEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueAddEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueAddEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _QueueAddEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueAddEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _QueueAddEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QueueTarget? queueTarget,  String? queueInsertPosition,  List<Command>? commands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueAddEndpoint() when $default != null:
return $default(_that.queueTarget,_that.queueInsertPosition,_that.commands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QueueTarget? queueTarget,  String? queueInsertPosition,  List<Command>? commands)  $default,) {final _that = this;
switch (_that) {
case _QueueAddEndpoint():
return $default(_that.queueTarget,_that.queueInsertPosition,_that.commands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QueueTarget? queueTarget,  String? queueInsertPosition,  List<Command>? commands)?  $default,) {final _that = this;
switch (_that) {
case _QueueAddEndpoint() when $default != null:
return $default(_that.queueTarget,_that.queueInsertPosition,_that.commands);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueAddEndpoint implements QueueAddEndpoint {
  const _QueueAddEndpoint({this.queueTarget, this.queueInsertPosition, final  List<Command>? commands}): _commands = commands;
  factory _QueueAddEndpoint.fromJson(Map<String, dynamic> json) => _$QueueAddEndpointFromJson(json);

@override final  QueueTarget? queueTarget;
@override final  String? queueInsertPosition;
 final  List<Command>? _commands;
@override List<Command>? get commands {
  final value = _commands;
  if (value == null) return null;
  if (_commands is EqualUnmodifiableListView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueAddEndpointCopyWith<_QueueAddEndpoint> get copyWith => __$QueueAddEndpointCopyWithImpl<_QueueAddEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueAddEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueAddEndpoint&&(identical(other.queueTarget, queueTarget) || other.queueTarget == queueTarget)&&(identical(other.queueInsertPosition, queueInsertPosition) || other.queueInsertPosition == queueInsertPosition)&&const DeepCollectionEquality().equals(other._commands, _commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,queueTarget,queueInsertPosition,const DeepCollectionEquality().hash(_commands));

@override
String toString() {
  return 'QueueAddEndpoint(queueTarget: $queueTarget, queueInsertPosition: $queueInsertPosition, commands: $commands)';
}


}

/// @nodoc
abstract mixin class _$QueueAddEndpointCopyWith<$Res> implements $QueueAddEndpointCopyWith<$Res> {
  factory _$QueueAddEndpointCopyWith(_QueueAddEndpoint value, $Res Function(_QueueAddEndpoint) _then) = __$QueueAddEndpointCopyWithImpl;
@override @useResult
$Res call({
 QueueTarget? queueTarget, String? queueInsertPosition, List<Command>? commands
});


@override $QueueTargetCopyWith<$Res>? get queueTarget;

}
/// @nodoc
class __$QueueAddEndpointCopyWithImpl<$Res>
    implements _$QueueAddEndpointCopyWith<$Res> {
  __$QueueAddEndpointCopyWithImpl(this._self, this._then);

  final _QueueAddEndpoint _self;
  final $Res Function(_QueueAddEndpoint) _then;

/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queueTarget = freezed,Object? queueInsertPosition = freezed,Object? commands = freezed,}) {
  return _then(_QueueAddEndpoint(
queueTarget: freezed == queueTarget ? _self.queueTarget : queueTarget // ignore: cast_nullable_to_non_nullable
as QueueTarget?,queueInsertPosition: freezed == queueInsertPosition ? _self.queueInsertPosition : queueInsertPosition // ignore: cast_nullable_to_non_nullable
as String?,commands: freezed == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as List<Command>?,
  ));
}

/// Create a copy of QueueAddEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTargetCopyWith<$Res>? get queueTarget {
    if (_self.queueTarget == null) {
    return null;
  }

  return $QueueTargetCopyWith<$Res>(_self.queueTarget!, (value) {
    return _then(_self.copyWith(queueTarget: value));
  });
}
}


/// @nodoc
mixin _$Command {

 String? get clickTrackingParams; AddToToastAction? get addToToastAction;
/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandCopyWith<Command> get copyWith => _$CommandCopyWithImpl<Command>(this as Command, _$identity);

  /// Serializes this Command to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Command&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.addToToastAction, addToToastAction) || other.addToToastAction == addToToastAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,addToToastAction);

@override
String toString() {
  return 'Command(clickTrackingParams: $clickTrackingParams, addToToastAction: $addToToastAction)';
}


}

/// @nodoc
abstract mixin class $CommandCopyWith<$Res>  {
  factory $CommandCopyWith(Command value, $Res Function(Command) _then) = _$CommandCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, AddToToastAction? addToToastAction
});


$AddToToastActionCopyWith<$Res>? get addToToastAction;

}
/// @nodoc
class _$CommandCopyWithImpl<$Res>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._self, this._then);

  final Command _self;
  final $Res Function(Command) _then;

/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? addToToastAction = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,addToToastAction: freezed == addToToastAction ? _self.addToToastAction : addToToastAction // ignore: cast_nullable_to_non_nullable
as AddToToastAction?,
  ));
}
/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddToToastActionCopyWith<$Res>? get addToToastAction {
    if (_self.addToToastAction == null) {
    return null;
  }

  return $AddToToastActionCopyWith<$Res>(_self.addToToastAction!, (value) {
    return _then(_self.copyWith(addToToastAction: value));
  });
}
}


/// Adds pattern-matching-related methods to [Command].
extension CommandPatterns on Command {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Command value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Command() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Command value)  $default,){
final _that = this;
switch (_that) {
case _Command():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Command value)?  $default,){
final _that = this;
switch (_that) {
case _Command() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  AddToToastAction? addToToastAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Command() when $default != null:
return $default(_that.clickTrackingParams,_that.addToToastAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  AddToToastAction? addToToastAction)  $default,) {final _that = this;
switch (_that) {
case _Command():
return $default(_that.clickTrackingParams,_that.addToToastAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  AddToToastAction? addToToastAction)?  $default,) {final _that = this;
switch (_that) {
case _Command() when $default != null:
return $default(_that.clickTrackingParams,_that.addToToastAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Command implements Command {
  const _Command({this.clickTrackingParams, this.addToToastAction});
  factory _Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);

@override final  String? clickTrackingParams;
@override final  AddToToastAction? addToToastAction;

/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandCopyWith<_Command> get copyWith => __$CommandCopyWithImpl<_Command>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Command&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.addToToastAction, addToToastAction) || other.addToToastAction == addToToastAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,addToToastAction);

@override
String toString() {
  return 'Command(clickTrackingParams: $clickTrackingParams, addToToastAction: $addToToastAction)';
}


}

/// @nodoc
abstract mixin class _$CommandCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$CommandCopyWith(_Command value, $Res Function(_Command) _then) = __$CommandCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, AddToToastAction? addToToastAction
});


@override $AddToToastActionCopyWith<$Res>? get addToToastAction;

}
/// @nodoc
class __$CommandCopyWithImpl<$Res>
    implements _$CommandCopyWith<$Res> {
  __$CommandCopyWithImpl(this._self, this._then);

  final _Command _self;
  final $Res Function(_Command) _then;

/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? addToToastAction = freezed,}) {
  return _then(_Command(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,addToToastAction: freezed == addToToastAction ? _self.addToToastAction : addToToastAction // ignore: cast_nullable_to_non_nullable
as AddToToastAction?,
  ));
}

/// Create a copy of Command
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddToToastActionCopyWith<$Res>? get addToToastAction {
    if (_self.addToToastAction == null) {
    return null;
  }

  return $AddToToastActionCopyWith<$Res>(_self.addToToastAction!, (value) {
    return _then(_self.copyWith(addToToastAction: value));
  });
}
}


/// @nodoc
mixin _$AddToToastAction {

 AddToToastActionItem? get item;
/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToToastActionCopyWith<AddToToastAction> get copyWith => _$AddToToastActionCopyWithImpl<AddToToastAction>(this as AddToToastAction, _$identity);

  /// Serializes this AddToToastAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToToastAction&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'AddToToastAction(item: $item)';
}


}

/// @nodoc
abstract mixin class $AddToToastActionCopyWith<$Res>  {
  factory $AddToToastActionCopyWith(AddToToastAction value, $Res Function(AddToToastAction) _then) = _$AddToToastActionCopyWithImpl;
@useResult
$Res call({
 AddToToastActionItem? item
});


$AddToToastActionItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$AddToToastActionCopyWithImpl<$Res>
    implements $AddToToastActionCopyWith<$Res> {
  _$AddToToastActionCopyWithImpl(this._self, this._then);

  final AddToToastAction _self;
  final $Res Function(AddToToastAction) _then;

/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = freezed,}) {
  return _then(_self.copyWith(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AddToToastActionItem?,
  ));
}
/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddToToastActionItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $AddToToastActionItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddToToastAction].
extension AddToToastActionPatterns on AddToToastAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddToToastAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddToToastAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddToToastAction value)  $default,){
final _that = this;
switch (_that) {
case _AddToToastAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddToToastAction value)?  $default,){
final _that = this;
switch (_that) {
case _AddToToastAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AddToToastActionItem? item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddToToastAction() when $default != null:
return $default(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AddToToastActionItem? item)  $default,) {final _that = this;
switch (_that) {
case _AddToToastAction():
return $default(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AddToToastActionItem? item)?  $default,) {final _that = this;
switch (_that) {
case _AddToToastAction() when $default != null:
return $default(_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddToToastAction implements AddToToastAction {
  const _AddToToastAction({this.item});
  factory _AddToToastAction.fromJson(Map<String, dynamic> json) => _$AddToToastActionFromJson(json);

@override final  AddToToastActionItem? item;

/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToToastActionCopyWith<_AddToToastAction> get copyWith => __$AddToToastActionCopyWithImpl<_AddToToastAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddToToastActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToToastAction&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'AddToToastAction(item: $item)';
}


}

/// @nodoc
abstract mixin class _$AddToToastActionCopyWith<$Res> implements $AddToToastActionCopyWith<$Res> {
  factory _$AddToToastActionCopyWith(_AddToToastAction value, $Res Function(_AddToToastAction) _then) = __$AddToToastActionCopyWithImpl;
@override @useResult
$Res call({
 AddToToastActionItem? item
});


@override $AddToToastActionItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$AddToToastActionCopyWithImpl<$Res>
    implements _$AddToToastActionCopyWith<$Res> {
  __$AddToToastActionCopyWithImpl(this._self, this._then);

  final _AddToToastAction _self;
  final $Res Function(_AddToToastAction) _then;

/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = freezed,}) {
  return _then(_AddToToastAction(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AddToToastActionItem?,
  ));
}

/// Create a copy of AddToToastAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddToToastActionItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $AddToToastActionItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$AddToToastActionItem {

 NotificationTextRenderer? get notificationTextRenderer;
/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToToastActionItemCopyWith<AddToToastActionItem> get copyWith => _$AddToToastActionItemCopyWithImpl<AddToToastActionItem>(this as AddToToastActionItem, _$identity);

  /// Serializes this AddToToastActionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToToastActionItem&&(identical(other.notificationTextRenderer, notificationTextRenderer) || other.notificationTextRenderer == notificationTextRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationTextRenderer);

@override
String toString() {
  return 'AddToToastActionItem(notificationTextRenderer: $notificationTextRenderer)';
}


}

/// @nodoc
abstract mixin class $AddToToastActionItemCopyWith<$Res>  {
  factory $AddToToastActionItemCopyWith(AddToToastActionItem value, $Res Function(AddToToastActionItem) _then) = _$AddToToastActionItemCopyWithImpl;
@useResult
$Res call({
 NotificationTextRenderer? notificationTextRenderer
});


$NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer;

}
/// @nodoc
class _$AddToToastActionItemCopyWithImpl<$Res>
    implements $AddToToastActionItemCopyWith<$Res> {
  _$AddToToastActionItemCopyWithImpl(this._self, this._then);

  final AddToToastActionItem _self;
  final $Res Function(AddToToastActionItem) _then;

/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationTextRenderer = freezed,}) {
  return _then(_self.copyWith(
notificationTextRenderer: freezed == notificationTextRenderer ? _self.notificationTextRenderer : notificationTextRenderer // ignore: cast_nullable_to_non_nullable
as NotificationTextRenderer?,
  ));
}
/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer {
    if (_self.notificationTextRenderer == null) {
    return null;
  }

  return $NotificationTextRendererCopyWith<$Res>(_self.notificationTextRenderer!, (value) {
    return _then(_self.copyWith(notificationTextRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddToToastActionItem].
extension AddToToastActionItemPatterns on AddToToastActionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddToToastActionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddToToastActionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddToToastActionItem value)  $default,){
final _that = this;
switch (_that) {
case _AddToToastActionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddToToastActionItem value)?  $default,){
final _that = this;
switch (_that) {
case _AddToToastActionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationTextRenderer? notificationTextRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddToToastActionItem() when $default != null:
return $default(_that.notificationTextRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationTextRenderer? notificationTextRenderer)  $default,) {final _that = this;
switch (_that) {
case _AddToToastActionItem():
return $default(_that.notificationTextRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationTextRenderer? notificationTextRenderer)?  $default,) {final _that = this;
switch (_that) {
case _AddToToastActionItem() when $default != null:
return $default(_that.notificationTextRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddToToastActionItem implements AddToToastActionItem {
  const _AddToToastActionItem({this.notificationTextRenderer});
  factory _AddToToastActionItem.fromJson(Map<String, dynamic> json) => _$AddToToastActionItemFromJson(json);

@override final  NotificationTextRenderer? notificationTextRenderer;

/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToToastActionItemCopyWith<_AddToToastActionItem> get copyWith => __$AddToToastActionItemCopyWithImpl<_AddToToastActionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddToToastActionItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToToastActionItem&&(identical(other.notificationTextRenderer, notificationTextRenderer) || other.notificationTextRenderer == notificationTextRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationTextRenderer);

@override
String toString() {
  return 'AddToToastActionItem(notificationTextRenderer: $notificationTextRenderer)';
}


}

/// @nodoc
abstract mixin class _$AddToToastActionItemCopyWith<$Res> implements $AddToToastActionItemCopyWith<$Res> {
  factory _$AddToToastActionItemCopyWith(_AddToToastActionItem value, $Res Function(_AddToToastActionItem) _then) = __$AddToToastActionItemCopyWithImpl;
@override @useResult
$Res call({
 NotificationTextRenderer? notificationTextRenderer
});


@override $NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer;

}
/// @nodoc
class __$AddToToastActionItemCopyWithImpl<$Res>
    implements _$AddToToastActionItemCopyWith<$Res> {
  __$AddToToastActionItemCopyWithImpl(this._self, this._then);

  final _AddToToastActionItem _self;
  final $Res Function(_AddToToastActionItem) _then;

/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationTextRenderer = freezed,}) {
  return _then(_AddToToastActionItem(
notificationTextRenderer: freezed == notificationTextRenderer ? _self.notificationTextRenderer : notificationTextRenderer // ignore: cast_nullable_to_non_nullable
as NotificationTextRenderer?,
  ));
}

/// Create a copy of AddToToastActionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer {
    if (_self.notificationTextRenderer == null) {
    return null;
  }

  return $NotificationTextRendererCopyWith<$Res>(_self.notificationTextRenderer!, (value) {
    return _then(_self.copyWith(notificationTextRenderer: value));
  });
}
}


/// @nodoc
mixin _$NotificationTextRenderer {

 Title? get successResponseText; String? get trackingParams;
/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTextRendererCopyWith<NotificationTextRenderer> get copyWith => _$NotificationTextRendererCopyWithImpl<NotificationTextRenderer>(this as NotificationTextRenderer, _$identity);

  /// Serializes this NotificationTextRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTextRenderer&&(identical(other.successResponseText, successResponseText) || other.successResponseText == successResponseText)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successResponseText,trackingParams);

@override
String toString() {
  return 'NotificationTextRenderer(successResponseText: $successResponseText, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $NotificationTextRendererCopyWith<$Res>  {
  factory $NotificationTextRendererCopyWith(NotificationTextRenderer value, $Res Function(NotificationTextRenderer) _then) = _$NotificationTextRendererCopyWithImpl;
@useResult
$Res call({
 Title? successResponseText, String? trackingParams
});


$TitleCopyWith<$Res>? get successResponseText;

}
/// @nodoc
class _$NotificationTextRendererCopyWithImpl<$Res>
    implements $NotificationTextRendererCopyWith<$Res> {
  _$NotificationTextRendererCopyWithImpl(this._self, this._then);

  final NotificationTextRenderer _self;
  final $Res Function(NotificationTextRenderer) _then;

/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? successResponseText = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
successResponseText: freezed == successResponseText ? _self.successResponseText : successResponseText // ignore: cast_nullable_to_non_nullable
as Title?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get successResponseText {
    if (_self.successResponseText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.successResponseText!, (value) {
    return _then(_self.copyWith(successResponseText: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationTextRenderer].
extension NotificationTextRendererPatterns on NotificationTextRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTextRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTextRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTextRenderer value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTextRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTextRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTextRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? successResponseText,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationTextRenderer() when $default != null:
return $default(_that.successResponseText,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? successResponseText,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _NotificationTextRenderer():
return $default(_that.successResponseText,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? successResponseText,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _NotificationTextRenderer() when $default != null:
return $default(_that.successResponseText,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationTextRenderer implements NotificationTextRenderer {
  const _NotificationTextRenderer({this.successResponseText, this.trackingParams});
  factory _NotificationTextRenderer.fromJson(Map<String, dynamic> json) => _$NotificationTextRendererFromJson(json);

@override final  Title? successResponseText;
@override final  String? trackingParams;

/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTextRendererCopyWith<_NotificationTextRenderer> get copyWith => __$NotificationTextRendererCopyWithImpl<_NotificationTextRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTextRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTextRenderer&&(identical(other.successResponseText, successResponseText) || other.successResponseText == successResponseText)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successResponseText,trackingParams);

@override
String toString() {
  return 'NotificationTextRenderer(successResponseText: $successResponseText, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$NotificationTextRendererCopyWith<$Res> implements $NotificationTextRendererCopyWith<$Res> {
  factory _$NotificationTextRendererCopyWith(_NotificationTextRenderer value, $Res Function(_NotificationTextRenderer) _then) = __$NotificationTextRendererCopyWithImpl;
@override @useResult
$Res call({
 Title? successResponseText, String? trackingParams
});


@override $TitleCopyWith<$Res>? get successResponseText;

}
/// @nodoc
class __$NotificationTextRendererCopyWithImpl<$Res>
    implements _$NotificationTextRendererCopyWith<$Res> {
  __$NotificationTextRendererCopyWithImpl(this._self, this._then);

  final _NotificationTextRenderer _self;
  final $Res Function(_NotificationTextRenderer) _then;

/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? successResponseText = freezed,Object? trackingParams = freezed,}) {
  return _then(_NotificationTextRenderer(
successResponseText: freezed == successResponseText ? _self.successResponseText : successResponseText // ignore: cast_nullable_to_non_nullable
as Title?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NotificationTextRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get successResponseText {
    if (_self.successResponseText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.successResponseText!, (value) {
    return _then(_self.copyWith(successResponseText: value));
  });
}
}


/// @nodoc
mixin _$QueueTarget {

 String? get videoId; OnEmptyQueue? get onEmptyQueue;
/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueTargetCopyWith<QueueTarget> get copyWith => _$QueueTargetCopyWithImpl<QueueTarget>(this as QueueTarget, _$identity);

  /// Serializes this QueueTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueTarget&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.onEmptyQueue, onEmptyQueue) || other.onEmptyQueue == onEmptyQueue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,onEmptyQueue);

@override
String toString() {
  return 'QueueTarget(videoId: $videoId, onEmptyQueue: $onEmptyQueue)';
}


}

/// @nodoc
abstract mixin class $QueueTargetCopyWith<$Res>  {
  factory $QueueTargetCopyWith(QueueTarget value, $Res Function(QueueTarget) _then) = _$QueueTargetCopyWithImpl;
@useResult
$Res call({
 String? videoId, OnEmptyQueue? onEmptyQueue
});


$OnEmptyQueueCopyWith<$Res>? get onEmptyQueue;

}
/// @nodoc
class _$QueueTargetCopyWithImpl<$Res>
    implements $QueueTargetCopyWith<$Res> {
  _$QueueTargetCopyWithImpl(this._self, this._then);

  final QueueTarget _self;
  final $Res Function(QueueTarget) _then;

/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = freezed,Object? onEmptyQueue = freezed,}) {
  return _then(_self.copyWith(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,onEmptyQueue: freezed == onEmptyQueue ? _self.onEmptyQueue : onEmptyQueue // ignore: cast_nullable_to_non_nullable
as OnEmptyQueue?,
  ));
}
/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnEmptyQueueCopyWith<$Res>? get onEmptyQueue {
    if (_self.onEmptyQueue == null) {
    return null;
  }

  return $OnEmptyQueueCopyWith<$Res>(_self.onEmptyQueue!, (value) {
    return _then(_self.copyWith(onEmptyQueue: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueTarget].
extension QueueTargetPatterns on QueueTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueTarget value)  $default,){
final _that = this;
switch (_that) {
case _QueueTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueTarget value)?  $default,){
final _that = this;
switch (_that) {
case _QueueTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? videoId,  OnEmptyQueue? onEmptyQueue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueTarget() when $default != null:
return $default(_that.videoId,_that.onEmptyQueue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? videoId,  OnEmptyQueue? onEmptyQueue)  $default,) {final _that = this;
switch (_that) {
case _QueueTarget():
return $default(_that.videoId,_that.onEmptyQueue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? videoId,  OnEmptyQueue? onEmptyQueue)?  $default,) {final _that = this;
switch (_that) {
case _QueueTarget() when $default != null:
return $default(_that.videoId,_that.onEmptyQueue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueTarget implements QueueTarget {
  const _QueueTarget({this.videoId, this.onEmptyQueue});
  factory _QueueTarget.fromJson(Map<String, dynamic> json) => _$QueueTargetFromJson(json);

@override final  String? videoId;
@override final  OnEmptyQueue? onEmptyQueue;

/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueTargetCopyWith<_QueueTarget> get copyWith => __$QueueTargetCopyWithImpl<_QueueTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueTargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueTarget&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.onEmptyQueue, onEmptyQueue) || other.onEmptyQueue == onEmptyQueue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,onEmptyQueue);

@override
String toString() {
  return 'QueueTarget(videoId: $videoId, onEmptyQueue: $onEmptyQueue)';
}


}

/// @nodoc
abstract mixin class _$QueueTargetCopyWith<$Res> implements $QueueTargetCopyWith<$Res> {
  factory _$QueueTargetCopyWith(_QueueTarget value, $Res Function(_QueueTarget) _then) = __$QueueTargetCopyWithImpl;
@override @useResult
$Res call({
 String? videoId, OnEmptyQueue? onEmptyQueue
});


@override $OnEmptyQueueCopyWith<$Res>? get onEmptyQueue;

}
/// @nodoc
class __$QueueTargetCopyWithImpl<$Res>
    implements _$QueueTargetCopyWith<$Res> {
  __$QueueTargetCopyWithImpl(this._self, this._then);

  final _QueueTarget _self;
  final $Res Function(_QueueTarget) _then;

/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = freezed,Object? onEmptyQueue = freezed,}) {
  return _then(_QueueTarget(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,onEmptyQueue: freezed == onEmptyQueue ? _self.onEmptyQueue : onEmptyQueue // ignore: cast_nullable_to_non_nullable
as OnEmptyQueue?,
  ));
}

/// Create a copy of QueueTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnEmptyQueueCopyWith<$Res>? get onEmptyQueue {
    if (_self.onEmptyQueue == null) {
    return null;
  }

  return $OnEmptyQueueCopyWith<$Res>(_self.onEmptyQueue!, (value) {
    return _then(_self.copyWith(onEmptyQueue: value));
  });
}
}


/// @nodoc
mixin _$OnEmptyQueue {

 String? get clickTrackingParams; PlaylistItemData? get watchEndpoint;
/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnEmptyQueueCopyWith<OnEmptyQueue> get copyWith => _$OnEmptyQueueCopyWithImpl<OnEmptyQueue>(this as OnEmptyQueue, _$identity);

  /// Serializes this OnEmptyQueue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnEmptyQueue&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint);

@override
String toString() {
  return 'OnEmptyQueue(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
}


}

/// @nodoc
abstract mixin class $OnEmptyQueueCopyWith<$Res>  {
  factory $OnEmptyQueueCopyWith(OnEmptyQueue value, $Res Function(OnEmptyQueue) _then) = _$OnEmptyQueueCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, PlaylistItemData? watchEndpoint
});


$PlaylistItemDataCopyWith<$Res>? get watchEndpoint;

}
/// @nodoc
class _$OnEmptyQueueCopyWithImpl<$Res>
    implements $OnEmptyQueueCopyWith<$Res> {
  _$OnEmptyQueueCopyWithImpl(this._self, this._then);

  final OnEmptyQueue _self;
  final $Res Function(OnEmptyQueue) _then;

/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlaylistItemData?,
  ));
}
/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistItemDataCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlaylistItemDataCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnEmptyQueue].
extension OnEmptyQueuePatterns on OnEmptyQueue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnEmptyQueue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnEmptyQueue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnEmptyQueue value)  $default,){
final _that = this;
switch (_that) {
case _OnEmptyQueue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnEmptyQueue value)?  $default,){
final _that = this;
switch (_that) {
case _OnEmptyQueue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlaylistItemData? watchEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnEmptyQueue() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlaylistItemData? watchEndpoint)  $default,) {final _that = this;
switch (_that) {
case _OnEmptyQueue():
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  PlaylistItemData? watchEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _OnEmptyQueue() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnEmptyQueue implements OnEmptyQueue {
  const _OnEmptyQueue({this.clickTrackingParams, this.watchEndpoint});
  factory _OnEmptyQueue.fromJson(Map<String, dynamic> json) => _$OnEmptyQueueFromJson(json);

@override final  String? clickTrackingParams;
@override final  PlaylistItemData? watchEndpoint;

/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnEmptyQueueCopyWith<_OnEmptyQueue> get copyWith => __$OnEmptyQueueCopyWithImpl<_OnEmptyQueue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnEmptyQueueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnEmptyQueue&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint);

@override
String toString() {
  return 'OnEmptyQueue(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
}


}

/// @nodoc
abstract mixin class _$OnEmptyQueueCopyWith<$Res> implements $OnEmptyQueueCopyWith<$Res> {
  factory _$OnEmptyQueueCopyWith(_OnEmptyQueue value, $Res Function(_OnEmptyQueue) _then) = __$OnEmptyQueueCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, PlaylistItemData? watchEndpoint
});


@override $PlaylistItemDataCopyWith<$Res>? get watchEndpoint;

}
/// @nodoc
class __$OnEmptyQueueCopyWithImpl<$Res>
    implements _$OnEmptyQueueCopyWith<$Res> {
  __$OnEmptyQueueCopyWithImpl(this._self, this._then);

  final _OnEmptyQueue _self;
  final $Res Function(_OnEmptyQueue) _then;

/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,}) {
  return _then(_OnEmptyQueue(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlaylistItemData?,
  ));
}

/// Create a copy of OnEmptyQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistItemDataCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlaylistItemDataCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}
}


/// @nodoc
mixin _$PlaylistItemData {

 String? get videoId;
/// Create a copy of PlaylistItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistItemDataCopyWith<PlaylistItemData> get copyWith => _$PlaylistItemDataCopyWithImpl<PlaylistItemData>(this as PlaylistItemData, _$identity);

  /// Serializes this PlaylistItemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistItemData&&(identical(other.videoId, videoId) || other.videoId == videoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId);

@override
String toString() {
  return 'PlaylistItemData(videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class $PlaylistItemDataCopyWith<$Res>  {
  factory $PlaylistItemDataCopyWith(PlaylistItemData value, $Res Function(PlaylistItemData) _then) = _$PlaylistItemDataCopyWithImpl;
@useResult
$Res call({
 String? videoId
});




}
/// @nodoc
class _$PlaylistItemDataCopyWithImpl<$Res>
    implements $PlaylistItemDataCopyWith<$Res> {
  _$PlaylistItemDataCopyWithImpl(this._self, this._then);

  final PlaylistItemData _self;
  final $Res Function(PlaylistItemData) _then;

/// Create a copy of PlaylistItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = freezed,}) {
  return _then(_self.copyWith(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistItemData].
extension PlaylistItemDataPatterns on PlaylistItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistItemData value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistItemData value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? videoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistItemData() when $default != null:
return $default(_that.videoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? videoId)  $default,) {final _that = this;
switch (_that) {
case _PlaylistItemData():
return $default(_that.videoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? videoId)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistItemData() when $default != null:
return $default(_that.videoId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistItemData implements PlaylistItemData {
  const _PlaylistItemData({this.videoId});
  factory _PlaylistItemData.fromJson(Map<String, dynamic> json) => _$PlaylistItemDataFromJson(json);

@override final  String? videoId;

/// Create a copy of PlaylistItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistItemDataCopyWith<_PlaylistItemData> get copyWith => __$PlaylistItemDataCopyWithImpl<_PlaylistItemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistItemDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistItemData&&(identical(other.videoId, videoId) || other.videoId == videoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId);

@override
String toString() {
  return 'PlaylistItemData(videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class _$PlaylistItemDataCopyWith<$Res> implements $PlaylistItemDataCopyWith<$Res> {
  factory _$PlaylistItemDataCopyWith(_PlaylistItemData value, $Res Function(_PlaylistItemData) _then) = __$PlaylistItemDataCopyWithImpl;
@override @useResult
$Res call({
 String? videoId
});




}
/// @nodoc
class __$PlaylistItemDataCopyWithImpl<$Res>
    implements _$PlaylistItemDataCopyWith<$Res> {
  __$PlaylistItemDataCopyWithImpl(this._self, this._then);

  final _PlaylistItemData _self;
  final $Res Function(_PlaylistItemData) _then;

/// Create a copy of PlaylistItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = freezed,}) {
  return _then(_PlaylistItemData(
videoId: freezed == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ToggleMenuServiceItemRenderer {

 Title? get defaultText; Icon? get defaultIcon; DefaultServiceEndpoint? get defaultServiceEndpoint; Title? get toggledText; Icon? get toggledIcon; String? get trackingParams;
/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleMenuServiceItemRendererCopyWith<ToggleMenuServiceItemRenderer> get copyWith => _$ToggleMenuServiceItemRendererCopyWithImpl<ToggleMenuServiceItemRenderer>(this as ToggleMenuServiceItemRenderer, _$identity);

  /// Serializes this ToggleMenuServiceItemRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleMenuServiceItemRenderer&&(identical(other.defaultText, defaultText) || other.defaultText == defaultText)&&(identical(other.defaultIcon, defaultIcon) || other.defaultIcon == defaultIcon)&&(identical(other.defaultServiceEndpoint, defaultServiceEndpoint) || other.defaultServiceEndpoint == defaultServiceEndpoint)&&(identical(other.toggledText, toggledText) || other.toggledText == toggledText)&&(identical(other.toggledIcon, toggledIcon) || other.toggledIcon == toggledIcon)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultText,defaultIcon,defaultServiceEndpoint,toggledText,toggledIcon,trackingParams);

@override
String toString() {
  return 'ToggleMenuServiceItemRenderer(defaultText: $defaultText, defaultIcon: $defaultIcon, defaultServiceEndpoint: $defaultServiceEndpoint, toggledText: $toggledText, toggledIcon: $toggledIcon, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $ToggleMenuServiceItemRendererCopyWith<$Res>  {
  factory $ToggleMenuServiceItemRendererCopyWith(ToggleMenuServiceItemRenderer value, $Res Function(ToggleMenuServiceItemRenderer) _then) = _$ToggleMenuServiceItemRendererCopyWithImpl;
@useResult
$Res call({
 Title? defaultText, Icon? defaultIcon, DefaultServiceEndpoint? defaultServiceEndpoint, Title? toggledText, Icon? toggledIcon, String? trackingParams
});


$TitleCopyWith<$Res>? get defaultText;$IconCopyWith<$Res>? get defaultIcon;$DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint;$TitleCopyWith<$Res>? get toggledText;$IconCopyWith<$Res>? get toggledIcon;

}
/// @nodoc
class _$ToggleMenuServiceItemRendererCopyWithImpl<$Res>
    implements $ToggleMenuServiceItemRendererCopyWith<$Res> {
  _$ToggleMenuServiceItemRendererCopyWithImpl(this._self, this._then);

  final ToggleMenuServiceItemRenderer _self;
  final $Res Function(ToggleMenuServiceItemRenderer) _then;

/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultText = freezed,Object? defaultIcon = freezed,Object? defaultServiceEndpoint = freezed,Object? toggledText = freezed,Object? toggledIcon = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
defaultText: freezed == defaultText ? _self.defaultText : defaultText // ignore: cast_nullable_to_non_nullable
as Title?,defaultIcon: freezed == defaultIcon ? _self.defaultIcon : defaultIcon // ignore: cast_nullable_to_non_nullable
as Icon?,defaultServiceEndpoint: freezed == defaultServiceEndpoint ? _self.defaultServiceEndpoint : defaultServiceEndpoint // ignore: cast_nullable_to_non_nullable
as DefaultServiceEndpoint?,toggledText: freezed == toggledText ? _self.toggledText : toggledText // ignore: cast_nullable_to_non_nullable
as Title?,toggledIcon: freezed == toggledIcon ? _self.toggledIcon : toggledIcon // ignore: cast_nullable_to_non_nullable
as Icon?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get defaultText {
    if (_self.defaultText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.defaultText!, (value) {
    return _then(_self.copyWith(defaultText: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get defaultIcon {
    if (_self.defaultIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.defaultIcon!, (value) {
    return _then(_self.copyWith(defaultIcon: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint {
    if (_self.defaultServiceEndpoint == null) {
    return null;
  }

  return $DefaultServiceEndpointCopyWith<$Res>(_self.defaultServiceEndpoint!, (value) {
    return _then(_self.copyWith(defaultServiceEndpoint: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get toggledText {
    if (_self.toggledText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.toggledText!, (value) {
    return _then(_self.copyWith(toggledText: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get toggledIcon {
    if (_self.toggledIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.toggledIcon!, (value) {
    return _then(_self.copyWith(toggledIcon: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToggleMenuServiceItemRenderer].
extension ToggleMenuServiceItemRendererPatterns on ToggleMenuServiceItemRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToggleMenuServiceItemRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToggleMenuServiceItemRenderer value)  $default,){
final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToggleMenuServiceItemRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? defaultText,  Icon? defaultIcon,  DefaultServiceEndpoint? defaultServiceEndpoint,  Title? toggledText,  Icon? toggledIcon,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer() when $default != null:
return $default(_that.defaultText,_that.defaultIcon,_that.defaultServiceEndpoint,_that.toggledText,_that.toggledIcon,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? defaultText,  Icon? defaultIcon,  DefaultServiceEndpoint? defaultServiceEndpoint,  Title? toggledText,  Icon? toggledIcon,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer():
return $default(_that.defaultText,_that.defaultIcon,_that.defaultServiceEndpoint,_that.toggledText,_that.toggledIcon,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? defaultText,  Icon? defaultIcon,  DefaultServiceEndpoint? defaultServiceEndpoint,  Title? toggledText,  Icon? toggledIcon,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _ToggleMenuServiceItemRenderer() when $default != null:
return $default(_that.defaultText,_that.defaultIcon,_that.defaultServiceEndpoint,_that.toggledText,_that.toggledIcon,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToggleMenuServiceItemRenderer implements ToggleMenuServiceItemRenderer {
  const _ToggleMenuServiceItemRenderer({this.defaultText, this.defaultIcon, this.defaultServiceEndpoint, this.toggledText, this.toggledIcon, this.trackingParams});
  factory _ToggleMenuServiceItemRenderer.fromJson(Map<String, dynamic> json) => _$ToggleMenuServiceItemRendererFromJson(json);

@override final  Title? defaultText;
@override final  Icon? defaultIcon;
@override final  DefaultServiceEndpoint? defaultServiceEndpoint;
@override final  Title? toggledText;
@override final  Icon? toggledIcon;
@override final  String? trackingParams;

/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleMenuServiceItemRendererCopyWith<_ToggleMenuServiceItemRenderer> get copyWith => __$ToggleMenuServiceItemRendererCopyWithImpl<_ToggleMenuServiceItemRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleMenuServiceItemRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleMenuServiceItemRenderer&&(identical(other.defaultText, defaultText) || other.defaultText == defaultText)&&(identical(other.defaultIcon, defaultIcon) || other.defaultIcon == defaultIcon)&&(identical(other.defaultServiceEndpoint, defaultServiceEndpoint) || other.defaultServiceEndpoint == defaultServiceEndpoint)&&(identical(other.toggledText, toggledText) || other.toggledText == toggledText)&&(identical(other.toggledIcon, toggledIcon) || other.toggledIcon == toggledIcon)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultText,defaultIcon,defaultServiceEndpoint,toggledText,toggledIcon,trackingParams);

@override
String toString() {
  return 'ToggleMenuServiceItemRenderer(defaultText: $defaultText, defaultIcon: $defaultIcon, defaultServiceEndpoint: $defaultServiceEndpoint, toggledText: $toggledText, toggledIcon: $toggledIcon, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$ToggleMenuServiceItemRendererCopyWith<$Res> implements $ToggleMenuServiceItemRendererCopyWith<$Res> {
  factory _$ToggleMenuServiceItemRendererCopyWith(_ToggleMenuServiceItemRenderer value, $Res Function(_ToggleMenuServiceItemRenderer) _then) = __$ToggleMenuServiceItemRendererCopyWithImpl;
@override @useResult
$Res call({
 Title? defaultText, Icon? defaultIcon, DefaultServiceEndpoint? defaultServiceEndpoint, Title? toggledText, Icon? toggledIcon, String? trackingParams
});


@override $TitleCopyWith<$Res>? get defaultText;@override $IconCopyWith<$Res>? get defaultIcon;@override $DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint;@override $TitleCopyWith<$Res>? get toggledText;@override $IconCopyWith<$Res>? get toggledIcon;

}
/// @nodoc
class __$ToggleMenuServiceItemRendererCopyWithImpl<$Res>
    implements _$ToggleMenuServiceItemRendererCopyWith<$Res> {
  __$ToggleMenuServiceItemRendererCopyWithImpl(this._self, this._then);

  final _ToggleMenuServiceItemRenderer _self;
  final $Res Function(_ToggleMenuServiceItemRenderer) _then;

/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultText = freezed,Object? defaultIcon = freezed,Object? defaultServiceEndpoint = freezed,Object? toggledText = freezed,Object? toggledIcon = freezed,Object? trackingParams = freezed,}) {
  return _then(_ToggleMenuServiceItemRenderer(
defaultText: freezed == defaultText ? _self.defaultText : defaultText // ignore: cast_nullable_to_non_nullable
as Title?,defaultIcon: freezed == defaultIcon ? _self.defaultIcon : defaultIcon // ignore: cast_nullable_to_non_nullable
as Icon?,defaultServiceEndpoint: freezed == defaultServiceEndpoint ? _self.defaultServiceEndpoint : defaultServiceEndpoint // ignore: cast_nullable_to_non_nullable
as DefaultServiceEndpoint?,toggledText: freezed == toggledText ? _self.toggledText : toggledText // ignore: cast_nullable_to_non_nullable
as Title?,toggledIcon: freezed == toggledIcon ? _self.toggledIcon : toggledIcon // ignore: cast_nullable_to_non_nullable
as Icon?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get defaultText {
    if (_self.defaultText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.defaultText!, (value) {
    return _then(_self.copyWith(defaultText: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get defaultIcon {
    if (_self.defaultIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.defaultIcon!, (value) {
    return _then(_self.copyWith(defaultIcon: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint {
    if (_self.defaultServiceEndpoint == null) {
    return null;
  }

  return $DefaultServiceEndpointCopyWith<$Res>(_self.defaultServiceEndpoint!, (value) {
    return _then(_self.copyWith(defaultServiceEndpoint: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get toggledText {
    if (_self.toggledText == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.toggledText!, (value) {
    return _then(_self.copyWith(toggledText: value));
  });
}/// Create a copy of ToggleMenuServiceItemRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get toggledIcon {
    if (_self.toggledIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.toggledIcon!, (value) {
    return _then(_self.copyWith(toggledIcon: value));
  });
}
}


/// @nodoc
mixin _$DefaultServiceEndpoint {

 String? get clickTrackingParams; ModalEndpoint? get modalEndpoint;
/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultServiceEndpointCopyWith<DefaultServiceEndpoint> get copyWith => _$DefaultServiceEndpointCopyWithImpl<DefaultServiceEndpoint>(this as DefaultServiceEndpoint, _$identity);

  /// Serializes this DefaultServiceEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultServiceEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.modalEndpoint, modalEndpoint) || other.modalEndpoint == modalEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,modalEndpoint);

@override
String toString() {
  return 'DefaultServiceEndpoint(clickTrackingParams: $clickTrackingParams, modalEndpoint: $modalEndpoint)';
}


}

/// @nodoc
abstract mixin class $DefaultServiceEndpointCopyWith<$Res>  {
  factory $DefaultServiceEndpointCopyWith(DefaultServiceEndpoint value, $Res Function(DefaultServiceEndpoint) _then) = _$DefaultServiceEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, ModalEndpoint? modalEndpoint
});


$ModalEndpointCopyWith<$Res>? get modalEndpoint;

}
/// @nodoc
class _$DefaultServiceEndpointCopyWithImpl<$Res>
    implements $DefaultServiceEndpointCopyWith<$Res> {
  _$DefaultServiceEndpointCopyWithImpl(this._self, this._then);

  final DefaultServiceEndpoint _self;
  final $Res Function(DefaultServiceEndpoint) _then;

/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? modalEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,modalEndpoint: freezed == modalEndpoint ? _self.modalEndpoint : modalEndpoint // ignore: cast_nullable_to_non_nullable
as ModalEndpoint?,
  ));
}
/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_self.modalEndpoint == null) {
    return null;
  }

  return $ModalEndpointCopyWith<$Res>(_self.modalEndpoint!, (value) {
    return _then(_self.copyWith(modalEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [DefaultServiceEndpoint].
extension DefaultServiceEndpointPatterns on DefaultServiceEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultServiceEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultServiceEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultServiceEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _DefaultServiceEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultServiceEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultServiceEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  ModalEndpoint? modalEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultServiceEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.modalEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  ModalEndpoint? modalEndpoint)  $default,) {final _that = this;
switch (_that) {
case _DefaultServiceEndpoint():
return $default(_that.clickTrackingParams,_that.modalEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  ModalEndpoint? modalEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _DefaultServiceEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.modalEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DefaultServiceEndpoint implements DefaultServiceEndpoint {
  const _DefaultServiceEndpoint({this.clickTrackingParams, this.modalEndpoint});
  factory _DefaultServiceEndpoint.fromJson(Map<String, dynamic> json) => _$DefaultServiceEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  ModalEndpoint? modalEndpoint;

/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultServiceEndpointCopyWith<_DefaultServiceEndpoint> get copyWith => __$DefaultServiceEndpointCopyWithImpl<_DefaultServiceEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefaultServiceEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultServiceEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.modalEndpoint, modalEndpoint) || other.modalEndpoint == modalEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,modalEndpoint);

@override
String toString() {
  return 'DefaultServiceEndpoint(clickTrackingParams: $clickTrackingParams, modalEndpoint: $modalEndpoint)';
}


}

/// @nodoc
abstract mixin class _$DefaultServiceEndpointCopyWith<$Res> implements $DefaultServiceEndpointCopyWith<$Res> {
  factory _$DefaultServiceEndpointCopyWith(_DefaultServiceEndpoint value, $Res Function(_DefaultServiceEndpoint) _then) = __$DefaultServiceEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, ModalEndpoint? modalEndpoint
});


@override $ModalEndpointCopyWith<$Res>? get modalEndpoint;

}
/// @nodoc
class __$DefaultServiceEndpointCopyWithImpl<$Res>
    implements _$DefaultServiceEndpointCopyWith<$Res> {
  __$DefaultServiceEndpointCopyWithImpl(this._self, this._then);

  final _DefaultServiceEndpoint _self;
  final $Res Function(_DefaultServiceEndpoint) _then;

/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? modalEndpoint = freezed,}) {
  return _then(_DefaultServiceEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,modalEndpoint: freezed == modalEndpoint ? _self.modalEndpoint : modalEndpoint // ignore: cast_nullable_to_non_nullable
as ModalEndpoint?,
  ));
}

/// Create a copy of DefaultServiceEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_self.modalEndpoint == null) {
    return null;
  }

  return $ModalEndpointCopyWith<$Res>(_self.modalEndpoint!, (value) {
    return _then(_self.copyWith(modalEndpoint: value));
  });
}
}


/// @nodoc
mixin _$Overlay {

 MusicItemThumbnailOverlayRenderer? get musicItemThumbnailOverlayRenderer;
/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayCopyWith<Overlay> get copyWith => _$OverlayCopyWithImpl<Overlay>(this as Overlay, _$identity);

  /// Serializes this Overlay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Overlay&&(identical(other.musicItemThumbnailOverlayRenderer, musicItemThumbnailOverlayRenderer) || other.musicItemThumbnailOverlayRenderer == musicItemThumbnailOverlayRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicItemThumbnailOverlayRenderer);

@override
String toString() {
  return 'Overlay(musicItemThumbnailOverlayRenderer: $musicItemThumbnailOverlayRenderer)';
}


}

/// @nodoc
abstract mixin class $OverlayCopyWith<$Res>  {
  factory $OverlayCopyWith(Overlay value, $Res Function(Overlay) _then) = _$OverlayCopyWithImpl;
@useResult
$Res call({
 MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer
});


$MusicItemThumbnailOverlayRendererCopyWith<$Res>? get musicItemThumbnailOverlayRenderer;

}
/// @nodoc
class _$OverlayCopyWithImpl<$Res>
    implements $OverlayCopyWith<$Res> {
  _$OverlayCopyWithImpl(this._self, this._then);

  final Overlay _self;
  final $Res Function(Overlay) _then;

/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicItemThumbnailOverlayRenderer = freezed,}) {
  return _then(_self.copyWith(
musicItemThumbnailOverlayRenderer: freezed == musicItemThumbnailOverlayRenderer ? _self.musicItemThumbnailOverlayRenderer : musicItemThumbnailOverlayRenderer // ignore: cast_nullable_to_non_nullable
as MusicItemThumbnailOverlayRenderer?,
  ));
}
/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererCopyWith<$Res>? get musicItemThumbnailOverlayRenderer {
    if (_self.musicItemThumbnailOverlayRenderer == null) {
    return null;
  }

  return $MusicItemThumbnailOverlayRendererCopyWith<$Res>(_self.musicItemThumbnailOverlayRenderer!, (value) {
    return _then(_self.copyWith(musicItemThumbnailOverlayRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Overlay].
extension OverlayPatterns on Overlay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Overlay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Overlay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Overlay value)  $default,){
final _that = this;
switch (_that) {
case _Overlay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Overlay value)?  $default,){
final _that = this;
switch (_that) {
case _Overlay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Overlay() when $default != null:
return $default(_that.musicItemThumbnailOverlayRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer)  $default,) {final _that = this;
switch (_that) {
case _Overlay():
return $default(_that.musicItemThumbnailOverlayRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Overlay() when $default != null:
return $default(_that.musicItemThumbnailOverlayRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Overlay implements Overlay {
  const _Overlay({this.musicItemThumbnailOverlayRenderer});
  factory _Overlay.fromJson(Map<String, dynamic> json) => _$OverlayFromJson(json);

@override final  MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer;

/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverlayCopyWith<_Overlay> get copyWith => __$OverlayCopyWithImpl<_Overlay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverlayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Overlay&&(identical(other.musicItemThumbnailOverlayRenderer, musicItemThumbnailOverlayRenderer) || other.musicItemThumbnailOverlayRenderer == musicItemThumbnailOverlayRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicItemThumbnailOverlayRenderer);

@override
String toString() {
  return 'Overlay(musicItemThumbnailOverlayRenderer: $musicItemThumbnailOverlayRenderer)';
}


}

/// @nodoc
abstract mixin class _$OverlayCopyWith<$Res> implements $OverlayCopyWith<$Res> {
  factory _$OverlayCopyWith(_Overlay value, $Res Function(_Overlay) _then) = __$OverlayCopyWithImpl;
@override @useResult
$Res call({
 MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer
});


@override $MusicItemThumbnailOverlayRendererCopyWith<$Res>? get musicItemThumbnailOverlayRenderer;

}
/// @nodoc
class __$OverlayCopyWithImpl<$Res>
    implements _$OverlayCopyWith<$Res> {
  __$OverlayCopyWithImpl(this._self, this._then);

  final _Overlay _self;
  final $Res Function(_Overlay) _then;

/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicItemThumbnailOverlayRenderer = freezed,}) {
  return _then(_Overlay(
musicItemThumbnailOverlayRenderer: freezed == musicItemThumbnailOverlayRenderer ? _self.musicItemThumbnailOverlayRenderer : musicItemThumbnailOverlayRenderer // ignore: cast_nullable_to_non_nullable
as MusicItemThumbnailOverlayRenderer?,
  ));
}

/// Create a copy of Overlay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererCopyWith<$Res>? get musicItemThumbnailOverlayRenderer {
    if (_self.musicItemThumbnailOverlayRenderer == null) {
    return null;
  }

  return $MusicItemThumbnailOverlayRendererCopyWith<$Res>(_self.musicItemThumbnailOverlayRenderer!, (value) {
    return _then(_self.copyWith(musicItemThumbnailOverlayRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicItemThumbnailOverlayRenderer {

 Background? get background; MusicItemThumbnailOverlayRendererContent? get content; String? get contentPosition; String? get displayStyle;
/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererCopyWith<MusicItemThumbnailOverlayRenderer> get copyWith => _$MusicItemThumbnailOverlayRendererCopyWithImpl<MusicItemThumbnailOverlayRenderer>(this as MusicItemThumbnailOverlayRenderer, _$identity);

  /// Serializes this MusicItemThumbnailOverlayRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicItemThumbnailOverlayRenderer&&(identical(other.background, background) || other.background == background)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentPosition, contentPosition) || other.contentPosition == contentPosition)&&(identical(other.displayStyle, displayStyle) || other.displayStyle == displayStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,background,content,contentPosition,displayStyle);

@override
String toString() {
  return 'MusicItemThumbnailOverlayRenderer(background: $background, content: $content, contentPosition: $contentPosition, displayStyle: $displayStyle)';
}


}

/// @nodoc
abstract mixin class $MusicItemThumbnailOverlayRendererCopyWith<$Res>  {
  factory $MusicItemThumbnailOverlayRendererCopyWith(MusicItemThumbnailOverlayRenderer value, $Res Function(MusicItemThumbnailOverlayRenderer) _then) = _$MusicItemThumbnailOverlayRendererCopyWithImpl;
@useResult
$Res call({
 Background? background, MusicItemThumbnailOverlayRendererContent? content, String? contentPosition, String? displayStyle
});


$BackgroundCopyWith<$Res>? get background;$MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content;

}
/// @nodoc
class _$MusicItemThumbnailOverlayRendererCopyWithImpl<$Res>
    implements $MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  _$MusicItemThumbnailOverlayRendererCopyWithImpl(this._self, this._then);

  final MusicItemThumbnailOverlayRenderer _self;
  final $Res Function(MusicItemThumbnailOverlayRenderer) _then;

/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? background = freezed,Object? content = freezed,Object? contentPosition = freezed,Object? displayStyle = freezed,}) {
  return _then(_self.copyWith(
background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Background?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as MusicItemThumbnailOverlayRendererContent?,contentPosition: freezed == contentPosition ? _self.contentPosition : contentPosition // ignore: cast_nullable_to_non_nullable
as String?,displayStyle: freezed == displayStyle ? _self.displayStyle : displayStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundCopyWith<$Res>? get background {
    if (_self.background == null) {
    return null;
  }

  return $BackgroundCopyWith<$Res>(_self.background!, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicItemThumbnailOverlayRenderer].
extension MusicItemThumbnailOverlayRendererPatterns on MusicItemThumbnailOverlayRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicItemThumbnailOverlayRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicItemThumbnailOverlayRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicItemThumbnailOverlayRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Background? background,  MusicItemThumbnailOverlayRendererContent? content,  String? contentPosition,  String? displayStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer() when $default != null:
return $default(_that.background,_that.content,_that.contentPosition,_that.displayStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Background? background,  MusicItemThumbnailOverlayRendererContent? content,  String? contentPosition,  String? displayStyle)  $default,) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer():
return $default(_that.background,_that.content,_that.contentPosition,_that.displayStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Background? background,  MusicItemThumbnailOverlayRendererContent? content,  String? contentPosition,  String? displayStyle)?  $default,) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRenderer() when $default != null:
return $default(_that.background,_that.content,_that.contentPosition,_that.displayStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicItemThumbnailOverlayRenderer implements MusicItemThumbnailOverlayRenderer {
  const _MusicItemThumbnailOverlayRenderer({this.background, this.content, this.contentPosition, this.displayStyle});
  factory _MusicItemThumbnailOverlayRenderer.fromJson(Map<String, dynamic> json) => _$MusicItemThumbnailOverlayRendererFromJson(json);

@override final  Background? background;
@override final  MusicItemThumbnailOverlayRendererContent? content;
@override final  String? contentPosition;
@override final  String? displayStyle;

/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicItemThumbnailOverlayRendererCopyWith<_MusicItemThumbnailOverlayRenderer> get copyWith => __$MusicItemThumbnailOverlayRendererCopyWithImpl<_MusicItemThumbnailOverlayRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicItemThumbnailOverlayRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicItemThumbnailOverlayRenderer&&(identical(other.background, background) || other.background == background)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentPosition, contentPosition) || other.contentPosition == contentPosition)&&(identical(other.displayStyle, displayStyle) || other.displayStyle == displayStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,background,content,contentPosition,displayStyle);

@override
String toString() {
  return 'MusicItemThumbnailOverlayRenderer(background: $background, content: $content, contentPosition: $contentPosition, displayStyle: $displayStyle)';
}


}

/// @nodoc
abstract mixin class _$MusicItemThumbnailOverlayRendererCopyWith<$Res> implements $MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  factory _$MusicItemThumbnailOverlayRendererCopyWith(_MusicItemThumbnailOverlayRenderer value, $Res Function(_MusicItemThumbnailOverlayRenderer) _then) = __$MusicItemThumbnailOverlayRendererCopyWithImpl;
@override @useResult
$Res call({
 Background? background, MusicItemThumbnailOverlayRendererContent? content, String? contentPosition, String? displayStyle
});


@override $BackgroundCopyWith<$Res>? get background;@override $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content;

}
/// @nodoc
class __$MusicItemThumbnailOverlayRendererCopyWithImpl<$Res>
    implements _$MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  __$MusicItemThumbnailOverlayRendererCopyWithImpl(this._self, this._then);

  final _MusicItemThumbnailOverlayRenderer _self;
  final $Res Function(_MusicItemThumbnailOverlayRenderer) _then;

/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? background = freezed,Object? content = freezed,Object? contentPosition = freezed,Object? displayStyle = freezed,}) {
  return _then(_MusicItemThumbnailOverlayRenderer(
background: freezed == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Background?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as MusicItemThumbnailOverlayRendererContent?,contentPosition: freezed == contentPosition ? _self.contentPosition : contentPosition // ignore: cast_nullable_to_non_nullable
as String?,displayStyle: freezed == displayStyle ? _self.displayStyle : displayStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundCopyWith<$Res>? get background {
    if (_self.background == null) {
    return null;
  }

  return $BackgroundCopyWith<$Res>(_self.background!, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of MusicItemThumbnailOverlayRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
mixin _$Background {

 VerticalGradient? get verticalGradient;
/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundCopyWith<Background> get copyWith => _$BackgroundCopyWithImpl<Background>(this as Background, _$identity);

  /// Serializes this Background to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Background&&(identical(other.verticalGradient, verticalGradient) || other.verticalGradient == verticalGradient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verticalGradient);

@override
String toString() {
  return 'Background(verticalGradient: $verticalGradient)';
}


}

/// @nodoc
abstract mixin class $BackgroundCopyWith<$Res>  {
  factory $BackgroundCopyWith(Background value, $Res Function(Background) _then) = _$BackgroundCopyWithImpl;
@useResult
$Res call({
 VerticalGradient? verticalGradient
});


$VerticalGradientCopyWith<$Res>? get verticalGradient;

}
/// @nodoc
class _$BackgroundCopyWithImpl<$Res>
    implements $BackgroundCopyWith<$Res> {
  _$BackgroundCopyWithImpl(this._self, this._then);

  final Background _self;
  final $Res Function(Background) _then;

/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verticalGradient = freezed,}) {
  return _then(_self.copyWith(
verticalGradient: freezed == verticalGradient ? _self.verticalGradient : verticalGradient // ignore: cast_nullable_to_non_nullable
as VerticalGradient?,
  ));
}
/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerticalGradientCopyWith<$Res>? get verticalGradient {
    if (_self.verticalGradient == null) {
    return null;
  }

  return $VerticalGradientCopyWith<$Res>(_self.verticalGradient!, (value) {
    return _then(_self.copyWith(verticalGradient: value));
  });
}
}


/// Adds pattern-matching-related methods to [Background].
extension BackgroundPatterns on Background {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Background value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Background() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Background value)  $default,){
final _that = this;
switch (_that) {
case _Background():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Background value)?  $default,){
final _that = this;
switch (_that) {
case _Background() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VerticalGradient? verticalGradient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Background() when $default != null:
return $default(_that.verticalGradient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VerticalGradient? verticalGradient)  $default,) {final _that = this;
switch (_that) {
case _Background():
return $default(_that.verticalGradient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VerticalGradient? verticalGradient)?  $default,) {final _that = this;
switch (_that) {
case _Background() when $default != null:
return $default(_that.verticalGradient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Background implements Background {
  const _Background({this.verticalGradient});
  factory _Background.fromJson(Map<String, dynamic> json) => _$BackgroundFromJson(json);

@override final  VerticalGradient? verticalGradient;

/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundCopyWith<_Background> get copyWith => __$BackgroundCopyWithImpl<_Background>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackgroundToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Background&&(identical(other.verticalGradient, verticalGradient) || other.verticalGradient == verticalGradient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verticalGradient);

@override
String toString() {
  return 'Background(verticalGradient: $verticalGradient)';
}


}

/// @nodoc
abstract mixin class _$BackgroundCopyWith<$Res> implements $BackgroundCopyWith<$Res> {
  factory _$BackgroundCopyWith(_Background value, $Res Function(_Background) _then) = __$BackgroundCopyWithImpl;
@override @useResult
$Res call({
 VerticalGradient? verticalGradient
});


@override $VerticalGradientCopyWith<$Res>? get verticalGradient;

}
/// @nodoc
class __$BackgroundCopyWithImpl<$Res>
    implements _$BackgroundCopyWith<$Res> {
  __$BackgroundCopyWithImpl(this._self, this._then);

  final _Background _self;
  final $Res Function(_Background) _then;

/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verticalGradient = freezed,}) {
  return _then(_Background(
verticalGradient: freezed == verticalGradient ? _self.verticalGradient : verticalGradient // ignore: cast_nullable_to_non_nullable
as VerticalGradient?,
  ));
}

/// Create a copy of Background
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerticalGradientCopyWith<$Res>? get verticalGradient {
    if (_self.verticalGradient == null) {
    return null;
  }

  return $VerticalGradientCopyWith<$Res>(_self.verticalGradient!, (value) {
    return _then(_self.copyWith(verticalGradient: value));
  });
}
}


/// @nodoc
mixin _$VerticalGradient {

 List<String>? get gradientLayerColors;
/// Create a copy of VerticalGradient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerticalGradientCopyWith<VerticalGradient> get copyWith => _$VerticalGradientCopyWithImpl<VerticalGradient>(this as VerticalGradient, _$identity);

  /// Serializes this VerticalGradient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerticalGradient&&const DeepCollectionEquality().equals(other.gradientLayerColors, gradientLayerColors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(gradientLayerColors));

@override
String toString() {
  return 'VerticalGradient(gradientLayerColors: $gradientLayerColors)';
}


}

/// @nodoc
abstract mixin class $VerticalGradientCopyWith<$Res>  {
  factory $VerticalGradientCopyWith(VerticalGradient value, $Res Function(VerticalGradient) _then) = _$VerticalGradientCopyWithImpl;
@useResult
$Res call({
 List<String>? gradientLayerColors
});




}
/// @nodoc
class _$VerticalGradientCopyWithImpl<$Res>
    implements $VerticalGradientCopyWith<$Res> {
  _$VerticalGradientCopyWithImpl(this._self, this._then);

  final VerticalGradient _self;
  final $Res Function(VerticalGradient) _then;

/// Create a copy of VerticalGradient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gradientLayerColors = freezed,}) {
  return _then(_self.copyWith(
gradientLayerColors: freezed == gradientLayerColors ? _self.gradientLayerColors : gradientLayerColors // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerticalGradient].
extension VerticalGradientPatterns on VerticalGradient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerticalGradient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerticalGradient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerticalGradient value)  $default,){
final _that = this;
switch (_that) {
case _VerticalGradient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerticalGradient value)?  $default,){
final _that = this;
switch (_that) {
case _VerticalGradient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? gradientLayerColors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerticalGradient() when $default != null:
return $default(_that.gradientLayerColors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? gradientLayerColors)  $default,) {final _that = this;
switch (_that) {
case _VerticalGradient():
return $default(_that.gradientLayerColors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? gradientLayerColors)?  $default,) {final _that = this;
switch (_that) {
case _VerticalGradient() when $default != null:
return $default(_that.gradientLayerColors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerticalGradient implements VerticalGradient {
  const _VerticalGradient({final  List<String>? gradientLayerColors}): _gradientLayerColors = gradientLayerColors;
  factory _VerticalGradient.fromJson(Map<String, dynamic> json) => _$VerticalGradientFromJson(json);

 final  List<String>? _gradientLayerColors;
@override List<String>? get gradientLayerColors {
  final value = _gradientLayerColors;
  if (value == null) return null;
  if (_gradientLayerColors is EqualUnmodifiableListView) return _gradientLayerColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VerticalGradient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerticalGradientCopyWith<_VerticalGradient> get copyWith => __$VerticalGradientCopyWithImpl<_VerticalGradient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerticalGradientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerticalGradient&&const DeepCollectionEquality().equals(other._gradientLayerColors, _gradientLayerColors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_gradientLayerColors));

@override
String toString() {
  return 'VerticalGradient(gradientLayerColors: $gradientLayerColors)';
}


}

/// @nodoc
abstract mixin class _$VerticalGradientCopyWith<$Res> implements $VerticalGradientCopyWith<$Res> {
  factory _$VerticalGradientCopyWith(_VerticalGradient value, $Res Function(_VerticalGradient) _then) = __$VerticalGradientCopyWithImpl;
@override @useResult
$Res call({
 List<String>? gradientLayerColors
});




}
/// @nodoc
class __$VerticalGradientCopyWithImpl<$Res>
    implements _$VerticalGradientCopyWith<$Res> {
  __$VerticalGradientCopyWithImpl(this._self, this._then);

  final _VerticalGradient _self;
  final $Res Function(_VerticalGradient) _then;

/// Create a copy of VerticalGradient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gradientLayerColors = freezed,}) {
  return _then(_VerticalGradient(
gradientLayerColors: freezed == gradientLayerColors ? _self._gradientLayerColors : gradientLayerColors // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$MusicItemThumbnailOverlayRendererContent {

 MusicPlayButtonRenderer? get musicPlayButtonRenderer;
/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicItemThumbnailOverlayRendererContentCopyWith<MusicItemThumbnailOverlayRendererContent> get copyWith => _$MusicItemThumbnailOverlayRendererContentCopyWithImpl<MusicItemThumbnailOverlayRendererContent>(this as MusicItemThumbnailOverlayRendererContent, _$identity);

  /// Serializes this MusicItemThumbnailOverlayRendererContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicItemThumbnailOverlayRendererContent&&(identical(other.musicPlayButtonRenderer, musicPlayButtonRenderer) || other.musicPlayButtonRenderer == musicPlayButtonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicPlayButtonRenderer);

@override
String toString() {
  return 'MusicItemThumbnailOverlayRendererContent(musicPlayButtonRenderer: $musicPlayButtonRenderer)';
}


}

/// @nodoc
abstract mixin class $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>  {
  factory $MusicItemThumbnailOverlayRendererContentCopyWith(MusicItemThumbnailOverlayRendererContent value, $Res Function(MusicItemThumbnailOverlayRendererContent) _then) = _$MusicItemThumbnailOverlayRendererContentCopyWithImpl;
@useResult
$Res call({
 MusicPlayButtonRenderer? musicPlayButtonRenderer
});


$MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer;

}
/// @nodoc
class _$MusicItemThumbnailOverlayRendererContentCopyWithImpl<$Res>
    implements $MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  _$MusicItemThumbnailOverlayRendererContentCopyWithImpl(this._self, this._then);

  final MusicItemThumbnailOverlayRendererContent _self;
  final $Res Function(MusicItemThumbnailOverlayRendererContent) _then;

/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicPlayButtonRenderer = freezed,}) {
  return _then(_self.copyWith(
musicPlayButtonRenderer: freezed == musicPlayButtonRenderer ? _self.musicPlayButtonRenderer : musicPlayButtonRenderer // ignore: cast_nullable_to_non_nullable
as MusicPlayButtonRenderer?,
  ));
}
/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer {
    if (_self.musicPlayButtonRenderer == null) {
    return null;
  }

  return $MusicPlayButtonRendererCopyWith<$Res>(_self.musicPlayButtonRenderer!, (value) {
    return _then(_self.copyWith(musicPlayButtonRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicItemThumbnailOverlayRendererContent].
extension MusicItemThumbnailOverlayRendererContentPatterns on MusicItemThumbnailOverlayRendererContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicItemThumbnailOverlayRendererContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicItemThumbnailOverlayRendererContent value)  $default,){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicItemThumbnailOverlayRendererContent value)?  $default,){
final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicPlayButtonRenderer? musicPlayButtonRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent() when $default != null:
return $default(_that.musicPlayButtonRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicPlayButtonRenderer? musicPlayButtonRenderer)  $default,) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent():
return $default(_that.musicPlayButtonRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicPlayButtonRenderer? musicPlayButtonRenderer)?  $default,) {final _that = this;
switch (_that) {
case _MusicItemThumbnailOverlayRendererContent() when $default != null:
return $default(_that.musicPlayButtonRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicItemThumbnailOverlayRendererContent implements MusicItemThumbnailOverlayRendererContent {
  const _MusicItemThumbnailOverlayRendererContent({this.musicPlayButtonRenderer});
  factory _MusicItemThumbnailOverlayRendererContent.fromJson(Map<String, dynamic> json) => _$MusicItemThumbnailOverlayRendererContentFromJson(json);

@override final  MusicPlayButtonRenderer? musicPlayButtonRenderer;

/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicItemThumbnailOverlayRendererContentCopyWith<_MusicItemThumbnailOverlayRendererContent> get copyWith => __$MusicItemThumbnailOverlayRendererContentCopyWithImpl<_MusicItemThumbnailOverlayRendererContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicItemThumbnailOverlayRendererContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicItemThumbnailOverlayRendererContent&&(identical(other.musicPlayButtonRenderer, musicPlayButtonRenderer) || other.musicPlayButtonRenderer == musicPlayButtonRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicPlayButtonRenderer);

@override
String toString() {
  return 'MusicItemThumbnailOverlayRendererContent(musicPlayButtonRenderer: $musicPlayButtonRenderer)';
}


}

/// @nodoc
abstract mixin class _$MusicItemThumbnailOverlayRendererContentCopyWith<$Res> implements $MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  factory _$MusicItemThumbnailOverlayRendererContentCopyWith(_MusicItemThumbnailOverlayRendererContent value, $Res Function(_MusicItemThumbnailOverlayRendererContent) _then) = __$MusicItemThumbnailOverlayRendererContentCopyWithImpl;
@override @useResult
$Res call({
 MusicPlayButtonRenderer? musicPlayButtonRenderer
});


@override $MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer;

}
/// @nodoc
class __$MusicItemThumbnailOverlayRendererContentCopyWithImpl<$Res>
    implements _$MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  __$MusicItemThumbnailOverlayRendererContentCopyWithImpl(this._self, this._then);

  final _MusicItemThumbnailOverlayRendererContent _self;
  final $Res Function(_MusicItemThumbnailOverlayRendererContent) _then;

/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicPlayButtonRenderer = freezed,}) {
  return _then(_MusicItemThumbnailOverlayRendererContent(
musicPlayButtonRenderer: freezed == musicPlayButtonRenderer ? _self.musicPlayButtonRenderer : musicPlayButtonRenderer // ignore: cast_nullable_to_non_nullable
as MusicPlayButtonRenderer?,
  ));
}

/// Create a copy of MusicItemThumbnailOverlayRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer {
    if (_self.musicPlayButtonRenderer == null) {
    return null;
  }

  return $MusicPlayButtonRendererCopyWith<$Res>(_self.musicPlayButtonRenderer!, (value) {
    return _then(_self.copyWith(musicPlayButtonRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicPlayButtonRenderer {

 PlayNavigationEndpoint? get playNavigationEndpoint; String? get trackingParams; Icon? get playIcon; Icon? get pauseIcon; int? get iconColor; int? get backgroundColor; int? get activeBackgroundColor; int? get loadingIndicatorColor; Icon? get playingIcon; int? get iconLoadingColor; int? get activeScaleFactor; String? get buttonSize; String? get rippleTarget; Accessibility? get accessibilityPlayData; Accessibility? get accessibilityPauseData;
/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicPlayButtonRendererCopyWith<MusicPlayButtonRenderer> get copyWith => _$MusicPlayButtonRendererCopyWithImpl<MusicPlayButtonRenderer>(this as MusicPlayButtonRenderer, _$identity);

  /// Serializes this MusicPlayButtonRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicPlayButtonRenderer&&(identical(other.playNavigationEndpoint, playNavigationEndpoint) || other.playNavigationEndpoint == playNavigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.playIcon, playIcon) || other.playIcon == playIcon)&&(identical(other.pauseIcon, pauseIcon) || other.pauseIcon == pauseIcon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.activeBackgroundColor, activeBackgroundColor) || other.activeBackgroundColor == activeBackgroundColor)&&(identical(other.loadingIndicatorColor, loadingIndicatorColor) || other.loadingIndicatorColor == loadingIndicatorColor)&&(identical(other.playingIcon, playingIcon) || other.playingIcon == playingIcon)&&(identical(other.iconLoadingColor, iconLoadingColor) || other.iconLoadingColor == iconLoadingColor)&&(identical(other.activeScaleFactor, activeScaleFactor) || other.activeScaleFactor == activeScaleFactor)&&(identical(other.buttonSize, buttonSize) || other.buttonSize == buttonSize)&&(identical(other.rippleTarget, rippleTarget) || other.rippleTarget == rippleTarget)&&(identical(other.accessibilityPlayData, accessibilityPlayData) || other.accessibilityPlayData == accessibilityPlayData)&&(identical(other.accessibilityPauseData, accessibilityPauseData) || other.accessibilityPauseData == accessibilityPauseData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playNavigationEndpoint,trackingParams,playIcon,pauseIcon,iconColor,backgroundColor,activeBackgroundColor,loadingIndicatorColor,playingIcon,iconLoadingColor,activeScaleFactor,buttonSize,rippleTarget,accessibilityPlayData,accessibilityPauseData);

@override
String toString() {
  return 'MusicPlayButtonRenderer(playNavigationEndpoint: $playNavigationEndpoint, trackingParams: $trackingParams, playIcon: $playIcon, pauseIcon: $pauseIcon, iconColor: $iconColor, backgroundColor: $backgroundColor, activeBackgroundColor: $activeBackgroundColor, loadingIndicatorColor: $loadingIndicatorColor, playingIcon: $playingIcon, iconLoadingColor: $iconLoadingColor, activeScaleFactor: $activeScaleFactor, buttonSize: $buttonSize, rippleTarget: $rippleTarget, accessibilityPlayData: $accessibilityPlayData, accessibilityPauseData: $accessibilityPauseData)';
}


}

/// @nodoc
abstract mixin class $MusicPlayButtonRendererCopyWith<$Res>  {
  factory $MusicPlayButtonRendererCopyWith(MusicPlayButtonRenderer value, $Res Function(MusicPlayButtonRenderer) _then) = _$MusicPlayButtonRendererCopyWithImpl;
@useResult
$Res call({
 PlayNavigationEndpoint? playNavigationEndpoint, String? trackingParams, Icon? playIcon, Icon? pauseIcon, int? iconColor, int? backgroundColor, int? activeBackgroundColor, int? loadingIndicatorColor, Icon? playingIcon, int? iconLoadingColor, int? activeScaleFactor, String? buttonSize, String? rippleTarget, Accessibility? accessibilityPlayData, Accessibility? accessibilityPauseData
});


$PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint;$IconCopyWith<$Res>? get playIcon;$IconCopyWith<$Res>? get pauseIcon;$IconCopyWith<$Res>? get playingIcon;$AccessibilityCopyWith<$Res>? get accessibilityPlayData;$AccessibilityCopyWith<$Res>? get accessibilityPauseData;

}
/// @nodoc
class _$MusicPlayButtonRendererCopyWithImpl<$Res>
    implements $MusicPlayButtonRendererCopyWith<$Res> {
  _$MusicPlayButtonRendererCopyWithImpl(this._self, this._then);

  final MusicPlayButtonRenderer _self;
  final $Res Function(MusicPlayButtonRenderer) _then;

/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playNavigationEndpoint = freezed,Object? trackingParams = freezed,Object? playIcon = freezed,Object? pauseIcon = freezed,Object? iconColor = freezed,Object? backgroundColor = freezed,Object? activeBackgroundColor = freezed,Object? loadingIndicatorColor = freezed,Object? playingIcon = freezed,Object? iconLoadingColor = freezed,Object? activeScaleFactor = freezed,Object? buttonSize = freezed,Object? rippleTarget = freezed,Object? accessibilityPlayData = freezed,Object? accessibilityPauseData = freezed,}) {
  return _then(_self.copyWith(
playNavigationEndpoint: freezed == playNavigationEndpoint ? _self.playNavigationEndpoint : playNavigationEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,playIcon: freezed == playIcon ? _self.playIcon : playIcon // ignore: cast_nullable_to_non_nullable
as Icon?,pauseIcon: freezed == pauseIcon ? _self.pauseIcon : pauseIcon // ignore: cast_nullable_to_non_nullable
as Icon?,iconColor: freezed == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as int?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as int?,activeBackgroundColor: freezed == activeBackgroundColor ? _self.activeBackgroundColor : activeBackgroundColor // ignore: cast_nullable_to_non_nullable
as int?,loadingIndicatorColor: freezed == loadingIndicatorColor ? _self.loadingIndicatorColor : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
as int?,playingIcon: freezed == playingIcon ? _self.playingIcon : playingIcon // ignore: cast_nullable_to_non_nullable
as Icon?,iconLoadingColor: freezed == iconLoadingColor ? _self.iconLoadingColor : iconLoadingColor // ignore: cast_nullable_to_non_nullable
as int?,activeScaleFactor: freezed == activeScaleFactor ? _self.activeScaleFactor : activeScaleFactor // ignore: cast_nullable_to_non_nullable
as int?,buttonSize: freezed == buttonSize ? _self.buttonSize : buttonSize // ignore: cast_nullable_to_non_nullable
as String?,rippleTarget: freezed == rippleTarget ? _self.rippleTarget : rippleTarget // ignore: cast_nullable_to_non_nullable
as String?,accessibilityPlayData: freezed == accessibilityPlayData ? _self.accessibilityPlayData : accessibilityPlayData // ignore: cast_nullable_to_non_nullable
as Accessibility?,accessibilityPauseData: freezed == accessibilityPauseData ? _self.accessibilityPauseData : accessibilityPauseData // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}
/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint {
    if (_self.playNavigationEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointCopyWith<$Res>(_self.playNavigationEndpoint!, (value) {
    return _then(_self.copyWith(playNavigationEndpoint: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get playIcon {
    if (_self.playIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.playIcon!, (value) {
    return _then(_self.copyWith(playIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get pauseIcon {
    if (_self.pauseIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.pauseIcon!, (value) {
    return _then(_self.copyWith(pauseIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get playingIcon {
    if (_self.playingIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.playingIcon!, (value) {
    return _then(_self.copyWith(playingIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityPlayData {
    if (_self.accessibilityPlayData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityPlayData!, (value) {
    return _then(_self.copyWith(accessibilityPlayData: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityPauseData {
    if (_self.accessibilityPauseData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityPauseData!, (value) {
    return _then(_self.copyWith(accessibilityPauseData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicPlayButtonRenderer].
extension MusicPlayButtonRendererPatterns on MusicPlayButtonRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicPlayButtonRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicPlayButtonRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicPlayButtonRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayNavigationEndpoint? playNavigationEndpoint,  String? trackingParams,  Icon? playIcon,  Icon? pauseIcon,  int? iconColor,  int? backgroundColor,  int? activeBackgroundColor,  int? loadingIndicatorColor,  Icon? playingIcon,  int? iconLoadingColor,  int? activeScaleFactor,  String? buttonSize,  String? rippleTarget,  Accessibility? accessibilityPlayData,  Accessibility? accessibilityPauseData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer() when $default != null:
return $default(_that.playNavigationEndpoint,_that.trackingParams,_that.playIcon,_that.pauseIcon,_that.iconColor,_that.backgroundColor,_that.activeBackgroundColor,_that.loadingIndicatorColor,_that.playingIcon,_that.iconLoadingColor,_that.activeScaleFactor,_that.buttonSize,_that.rippleTarget,_that.accessibilityPlayData,_that.accessibilityPauseData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayNavigationEndpoint? playNavigationEndpoint,  String? trackingParams,  Icon? playIcon,  Icon? pauseIcon,  int? iconColor,  int? backgroundColor,  int? activeBackgroundColor,  int? loadingIndicatorColor,  Icon? playingIcon,  int? iconLoadingColor,  int? activeScaleFactor,  String? buttonSize,  String? rippleTarget,  Accessibility? accessibilityPlayData,  Accessibility? accessibilityPauseData)  $default,) {final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer():
return $default(_that.playNavigationEndpoint,_that.trackingParams,_that.playIcon,_that.pauseIcon,_that.iconColor,_that.backgroundColor,_that.activeBackgroundColor,_that.loadingIndicatorColor,_that.playingIcon,_that.iconLoadingColor,_that.activeScaleFactor,_that.buttonSize,_that.rippleTarget,_that.accessibilityPlayData,_that.accessibilityPauseData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayNavigationEndpoint? playNavigationEndpoint,  String? trackingParams,  Icon? playIcon,  Icon? pauseIcon,  int? iconColor,  int? backgroundColor,  int? activeBackgroundColor,  int? loadingIndicatorColor,  Icon? playingIcon,  int? iconLoadingColor,  int? activeScaleFactor,  String? buttonSize,  String? rippleTarget,  Accessibility? accessibilityPlayData,  Accessibility? accessibilityPauseData)?  $default,) {final _that = this;
switch (_that) {
case _MusicPlayButtonRenderer() when $default != null:
return $default(_that.playNavigationEndpoint,_that.trackingParams,_that.playIcon,_that.pauseIcon,_that.iconColor,_that.backgroundColor,_that.activeBackgroundColor,_that.loadingIndicatorColor,_that.playingIcon,_that.iconLoadingColor,_that.activeScaleFactor,_that.buttonSize,_that.rippleTarget,_that.accessibilityPlayData,_that.accessibilityPauseData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicPlayButtonRenderer implements MusicPlayButtonRenderer {
  const _MusicPlayButtonRenderer({this.playNavigationEndpoint, this.trackingParams, this.playIcon, this.pauseIcon, this.iconColor, this.backgroundColor, this.activeBackgroundColor, this.loadingIndicatorColor, this.playingIcon, this.iconLoadingColor, this.activeScaleFactor, this.buttonSize, this.rippleTarget, this.accessibilityPlayData, this.accessibilityPauseData});
  factory _MusicPlayButtonRenderer.fromJson(Map<String, dynamic> json) => _$MusicPlayButtonRendererFromJson(json);

@override final  PlayNavigationEndpoint? playNavigationEndpoint;
@override final  String? trackingParams;
@override final  Icon? playIcon;
@override final  Icon? pauseIcon;
@override final  int? iconColor;
@override final  int? backgroundColor;
@override final  int? activeBackgroundColor;
@override final  int? loadingIndicatorColor;
@override final  Icon? playingIcon;
@override final  int? iconLoadingColor;
@override final  int? activeScaleFactor;
@override final  String? buttonSize;
@override final  String? rippleTarget;
@override final  Accessibility? accessibilityPlayData;
@override final  Accessibility? accessibilityPauseData;

/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicPlayButtonRendererCopyWith<_MusicPlayButtonRenderer> get copyWith => __$MusicPlayButtonRendererCopyWithImpl<_MusicPlayButtonRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicPlayButtonRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicPlayButtonRenderer&&(identical(other.playNavigationEndpoint, playNavigationEndpoint) || other.playNavigationEndpoint == playNavigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.playIcon, playIcon) || other.playIcon == playIcon)&&(identical(other.pauseIcon, pauseIcon) || other.pauseIcon == pauseIcon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.activeBackgroundColor, activeBackgroundColor) || other.activeBackgroundColor == activeBackgroundColor)&&(identical(other.loadingIndicatorColor, loadingIndicatorColor) || other.loadingIndicatorColor == loadingIndicatorColor)&&(identical(other.playingIcon, playingIcon) || other.playingIcon == playingIcon)&&(identical(other.iconLoadingColor, iconLoadingColor) || other.iconLoadingColor == iconLoadingColor)&&(identical(other.activeScaleFactor, activeScaleFactor) || other.activeScaleFactor == activeScaleFactor)&&(identical(other.buttonSize, buttonSize) || other.buttonSize == buttonSize)&&(identical(other.rippleTarget, rippleTarget) || other.rippleTarget == rippleTarget)&&(identical(other.accessibilityPlayData, accessibilityPlayData) || other.accessibilityPlayData == accessibilityPlayData)&&(identical(other.accessibilityPauseData, accessibilityPauseData) || other.accessibilityPauseData == accessibilityPauseData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playNavigationEndpoint,trackingParams,playIcon,pauseIcon,iconColor,backgroundColor,activeBackgroundColor,loadingIndicatorColor,playingIcon,iconLoadingColor,activeScaleFactor,buttonSize,rippleTarget,accessibilityPlayData,accessibilityPauseData);

@override
String toString() {
  return 'MusicPlayButtonRenderer(playNavigationEndpoint: $playNavigationEndpoint, trackingParams: $trackingParams, playIcon: $playIcon, pauseIcon: $pauseIcon, iconColor: $iconColor, backgroundColor: $backgroundColor, activeBackgroundColor: $activeBackgroundColor, loadingIndicatorColor: $loadingIndicatorColor, playingIcon: $playingIcon, iconLoadingColor: $iconLoadingColor, activeScaleFactor: $activeScaleFactor, buttonSize: $buttonSize, rippleTarget: $rippleTarget, accessibilityPlayData: $accessibilityPlayData, accessibilityPauseData: $accessibilityPauseData)';
}


}

/// @nodoc
abstract mixin class _$MusicPlayButtonRendererCopyWith<$Res> implements $MusicPlayButtonRendererCopyWith<$Res> {
  factory _$MusicPlayButtonRendererCopyWith(_MusicPlayButtonRenderer value, $Res Function(_MusicPlayButtonRenderer) _then) = __$MusicPlayButtonRendererCopyWithImpl;
@override @useResult
$Res call({
 PlayNavigationEndpoint? playNavigationEndpoint, String? trackingParams, Icon? playIcon, Icon? pauseIcon, int? iconColor, int? backgroundColor, int? activeBackgroundColor, int? loadingIndicatorColor, Icon? playingIcon, int? iconLoadingColor, int? activeScaleFactor, String? buttonSize, String? rippleTarget, Accessibility? accessibilityPlayData, Accessibility? accessibilityPauseData
});


@override $PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint;@override $IconCopyWith<$Res>? get playIcon;@override $IconCopyWith<$Res>? get pauseIcon;@override $IconCopyWith<$Res>? get playingIcon;@override $AccessibilityCopyWith<$Res>? get accessibilityPlayData;@override $AccessibilityCopyWith<$Res>? get accessibilityPauseData;

}
/// @nodoc
class __$MusicPlayButtonRendererCopyWithImpl<$Res>
    implements _$MusicPlayButtonRendererCopyWith<$Res> {
  __$MusicPlayButtonRendererCopyWithImpl(this._self, this._then);

  final _MusicPlayButtonRenderer _self;
  final $Res Function(_MusicPlayButtonRenderer) _then;

/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playNavigationEndpoint = freezed,Object? trackingParams = freezed,Object? playIcon = freezed,Object? pauseIcon = freezed,Object? iconColor = freezed,Object? backgroundColor = freezed,Object? activeBackgroundColor = freezed,Object? loadingIndicatorColor = freezed,Object? playingIcon = freezed,Object? iconLoadingColor = freezed,Object? activeScaleFactor = freezed,Object? buttonSize = freezed,Object? rippleTarget = freezed,Object? accessibilityPlayData = freezed,Object? accessibilityPauseData = freezed,}) {
  return _then(_MusicPlayButtonRenderer(
playNavigationEndpoint: freezed == playNavigationEndpoint ? _self.playNavigationEndpoint : playNavigationEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,playIcon: freezed == playIcon ? _self.playIcon : playIcon // ignore: cast_nullable_to_non_nullable
as Icon?,pauseIcon: freezed == pauseIcon ? _self.pauseIcon : pauseIcon // ignore: cast_nullable_to_non_nullable
as Icon?,iconColor: freezed == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as int?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as int?,activeBackgroundColor: freezed == activeBackgroundColor ? _self.activeBackgroundColor : activeBackgroundColor // ignore: cast_nullable_to_non_nullable
as int?,loadingIndicatorColor: freezed == loadingIndicatorColor ? _self.loadingIndicatorColor : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
as int?,playingIcon: freezed == playingIcon ? _self.playingIcon : playingIcon // ignore: cast_nullable_to_non_nullable
as Icon?,iconLoadingColor: freezed == iconLoadingColor ? _self.iconLoadingColor : iconLoadingColor // ignore: cast_nullable_to_non_nullable
as int?,activeScaleFactor: freezed == activeScaleFactor ? _self.activeScaleFactor : activeScaleFactor // ignore: cast_nullable_to_non_nullable
as int?,buttonSize: freezed == buttonSize ? _self.buttonSize : buttonSize // ignore: cast_nullable_to_non_nullable
as String?,rippleTarget: freezed == rippleTarget ? _self.rippleTarget : rippleTarget // ignore: cast_nullable_to_non_nullable
as String?,accessibilityPlayData: freezed == accessibilityPlayData ? _self.accessibilityPlayData : accessibilityPlayData // ignore: cast_nullable_to_non_nullable
as Accessibility?,accessibilityPauseData: freezed == accessibilityPauseData ? _self.accessibilityPauseData : accessibilityPauseData // ignore: cast_nullable_to_non_nullable
as Accessibility?,
  ));
}

/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint {
    if (_self.playNavigationEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointCopyWith<$Res>(_self.playNavigationEndpoint!, (value) {
    return _then(_self.copyWith(playNavigationEndpoint: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get playIcon {
    if (_self.playIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.playIcon!, (value) {
    return _then(_self.copyWith(playIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get pauseIcon {
    if (_self.pauseIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.pauseIcon!, (value) {
    return _then(_self.copyWith(pauseIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get playingIcon {
    if (_self.playingIcon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.playingIcon!, (value) {
    return _then(_self.copyWith(playingIcon: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityPlayData {
    if (_self.accessibilityPlayData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityPlayData!, (value) {
    return _then(_self.copyWith(accessibilityPlayData: value));
  });
}/// Create a copy of MusicPlayButtonRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityPauseData {
    if (_self.accessibilityPauseData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityPauseData!, (value) {
    return _then(_self.copyWith(accessibilityPauseData: value));
  });
}
}


/// @nodoc
mixin _$PlayNavigationEndpoint {

 String? get clickTrackingParams; PlayNavigationEndpointWatchEndpoint? get watchEndpoint;
/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayNavigationEndpointCopyWith<PlayNavigationEndpoint> get copyWith => _$PlayNavigationEndpointCopyWithImpl<PlayNavigationEndpoint>(this as PlayNavigationEndpoint, _$identity);

  /// Serializes this PlayNavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint);

@override
String toString() {
  return 'PlayNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
}


}

/// @nodoc
abstract mixin class $PlayNavigationEndpointCopyWith<$Res>  {
  factory $PlayNavigationEndpointCopyWith(PlayNavigationEndpoint value, $Res Function(PlayNavigationEndpoint) _then) = _$PlayNavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, PlayNavigationEndpointWatchEndpoint? watchEndpoint
});


$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;

}
/// @nodoc
class _$PlayNavigationEndpointCopyWithImpl<$Res>
    implements $PlayNavigationEndpointCopyWith<$Res> {
  _$PlayNavigationEndpointCopyWithImpl(this._self, this._then);

  final PlayNavigationEndpoint _self;
  final $Res Function(PlayNavigationEndpoint) _then;

/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpointWatchEndpoint?,
  ));
}
/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayNavigationEndpoint].
extension PlayNavigationEndpointPatterns on PlayNavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayNavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayNavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _PlayNavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayNavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _PlayNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint)  $default,) {final _that = this;
switch (_that) {
case _PlayNavigationEndpoint():
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  PlayNavigationEndpointWatchEndpoint? watchEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _PlayNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.watchEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayNavigationEndpoint implements PlayNavigationEndpoint {
  const _PlayNavigationEndpoint({this.clickTrackingParams, this.watchEndpoint});
  factory _PlayNavigationEndpoint.fromJson(Map<String, dynamic> json) => _$PlayNavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  PlayNavigationEndpointWatchEndpoint? watchEndpoint;

/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayNavigationEndpointCopyWith<_PlayNavigationEndpoint> get copyWith => __$PlayNavigationEndpointCopyWithImpl<_PlayNavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayNavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.watchEndpoint, watchEndpoint) || other.watchEndpoint == watchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,watchEndpoint);

@override
String toString() {
  return 'PlayNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
}


}

/// @nodoc
abstract mixin class _$PlayNavigationEndpointCopyWith<$Res> implements $PlayNavigationEndpointCopyWith<$Res> {
  factory _$PlayNavigationEndpointCopyWith(_PlayNavigationEndpoint value, $Res Function(_PlayNavigationEndpoint) _then) = __$PlayNavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, PlayNavigationEndpointWatchEndpoint? watchEndpoint
});


@override $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;

}
/// @nodoc
class __$PlayNavigationEndpointCopyWithImpl<$Res>
    implements _$PlayNavigationEndpointCopyWith<$Res> {
  __$PlayNavigationEndpointCopyWithImpl(this._self, this._then);

  final _PlayNavigationEndpoint _self;
  final $Res Function(_PlayNavigationEndpoint) _then;

/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? watchEndpoint = freezed,}) {
  return _then(_PlayNavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,watchEndpoint: freezed == watchEndpoint ? _self.watchEndpoint : watchEndpoint // ignore: cast_nullable_to_non_nullable
as PlayNavigationEndpointWatchEndpoint?,
  ));
}

/// Create a copy of PlayNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_self.watchEndpoint == null) {
    return null;
  }

  return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(_self.watchEndpoint!, (value) {
    return _then(_self.copyWith(watchEndpoint: value));
  });
}
}


/// @nodoc
mixin _$MusicResponsiveListItemRendererThumbnail {

 MusicThumbnailRenderer? get musicThumbnailRenderer;
/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicResponsiveListItemRendererThumbnailCopyWith<MusicResponsiveListItemRendererThumbnail> get copyWith => _$MusicResponsiveListItemRendererThumbnailCopyWithImpl<MusicResponsiveListItemRendererThumbnail>(this as MusicResponsiveListItemRendererThumbnail, _$identity);

  /// Serializes this MusicResponsiveListItemRendererThumbnail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicResponsiveListItemRendererThumbnail&&(identical(other.musicThumbnailRenderer, musicThumbnailRenderer) || other.musicThumbnailRenderer == musicThumbnailRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicThumbnailRenderer);

@override
String toString() {
  return 'MusicResponsiveListItemRendererThumbnail(musicThumbnailRenderer: $musicThumbnailRenderer)';
}


}

/// @nodoc
abstract mixin class $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>  {
  factory $MusicResponsiveListItemRendererThumbnailCopyWith(MusicResponsiveListItemRendererThumbnail value, $Res Function(MusicResponsiveListItemRendererThumbnail) _then) = _$MusicResponsiveListItemRendererThumbnailCopyWithImpl;
@useResult
$Res call({
 MusicThumbnailRenderer? musicThumbnailRenderer
});


$MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer;

}
/// @nodoc
class _$MusicResponsiveListItemRendererThumbnailCopyWithImpl<$Res>
    implements $MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  _$MusicResponsiveListItemRendererThumbnailCopyWithImpl(this._self, this._then);

  final MusicResponsiveListItemRendererThumbnail _self;
  final $Res Function(MusicResponsiveListItemRendererThumbnail) _then;

/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicThumbnailRenderer = freezed,}) {
  return _then(_self.copyWith(
musicThumbnailRenderer: freezed == musicThumbnailRenderer ? _self.musicThumbnailRenderer : musicThumbnailRenderer // ignore: cast_nullable_to_non_nullable
as MusicThumbnailRenderer?,
  ));
}
/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer {
    if (_self.musicThumbnailRenderer == null) {
    return null;
  }

  return $MusicThumbnailRendererCopyWith<$Res>(_self.musicThumbnailRenderer!, (value) {
    return _then(_self.copyWith(musicThumbnailRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicResponsiveListItemRendererThumbnail].
extension MusicResponsiveListItemRendererThumbnailPatterns on MusicResponsiveListItemRendererThumbnail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicResponsiveListItemRendererThumbnail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicResponsiveListItemRendererThumbnail value)  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicResponsiveListItemRendererThumbnail value)?  $default,){
final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicThumbnailRenderer? musicThumbnailRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail() when $default != null:
return $default(_that.musicThumbnailRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicThumbnailRenderer? musicThumbnailRenderer)  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail():
return $default(_that.musicThumbnailRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicThumbnailRenderer? musicThumbnailRenderer)?  $default,) {final _that = this;
switch (_that) {
case _MusicResponsiveListItemRendererThumbnail() when $default != null:
return $default(_that.musicThumbnailRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicResponsiveListItemRendererThumbnail implements MusicResponsiveListItemRendererThumbnail {
  const _MusicResponsiveListItemRendererThumbnail({this.musicThumbnailRenderer});
  factory _MusicResponsiveListItemRendererThumbnail.fromJson(Map<String, dynamic> json) => _$MusicResponsiveListItemRendererThumbnailFromJson(json);

@override final  MusicThumbnailRenderer? musicThumbnailRenderer;

/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicResponsiveListItemRendererThumbnailCopyWith<_MusicResponsiveListItemRendererThumbnail> get copyWith => __$MusicResponsiveListItemRendererThumbnailCopyWithImpl<_MusicResponsiveListItemRendererThumbnail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicResponsiveListItemRendererThumbnailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicResponsiveListItemRendererThumbnail&&(identical(other.musicThumbnailRenderer, musicThumbnailRenderer) || other.musicThumbnailRenderer == musicThumbnailRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicThumbnailRenderer);

@override
String toString() {
  return 'MusicResponsiveListItemRendererThumbnail(musicThumbnailRenderer: $musicThumbnailRenderer)';
}


}

/// @nodoc
abstract mixin class _$MusicResponsiveListItemRendererThumbnailCopyWith<$Res> implements $MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  factory _$MusicResponsiveListItemRendererThumbnailCopyWith(_MusicResponsiveListItemRendererThumbnail value, $Res Function(_MusicResponsiveListItemRendererThumbnail) _then) = __$MusicResponsiveListItemRendererThumbnailCopyWithImpl;
@override @useResult
$Res call({
 MusicThumbnailRenderer? musicThumbnailRenderer
});


@override $MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer;

}
/// @nodoc
class __$MusicResponsiveListItemRendererThumbnailCopyWithImpl<$Res>
    implements _$MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  __$MusicResponsiveListItemRendererThumbnailCopyWithImpl(this._self, this._then);

  final _MusicResponsiveListItemRendererThumbnail _self;
  final $Res Function(_MusicResponsiveListItemRendererThumbnail) _then;

/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicThumbnailRenderer = freezed,}) {
  return _then(_MusicResponsiveListItemRendererThumbnail(
musicThumbnailRenderer: freezed == musicThumbnailRenderer ? _self.musicThumbnailRenderer : musicThumbnailRenderer // ignore: cast_nullable_to_non_nullable
as MusicThumbnailRenderer?,
  ));
}

/// Create a copy of MusicResponsiveListItemRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer {
    if (_self.musicThumbnailRenderer == null) {
    return null;
  }

  return $MusicThumbnailRendererCopyWith<$Res>(_self.musicThumbnailRenderer!, (value) {
    return _then(_self.copyWith(musicThumbnailRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicThumbnailRenderer {

 MusicThumbnailRendererThumbnail? get thumbnail; String? get thumbnailCrop; String? get thumbnailScale; String? get trackingParams;
/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicThumbnailRendererCopyWith<MusicThumbnailRenderer> get copyWith => _$MusicThumbnailRendererCopyWithImpl<MusicThumbnailRenderer>(this as MusicThumbnailRenderer, _$identity);

  /// Serializes this MusicThumbnailRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicThumbnailRenderer&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.thumbnailCrop, thumbnailCrop) || other.thumbnailCrop == thumbnailCrop)&&(identical(other.thumbnailScale, thumbnailScale) || other.thumbnailScale == thumbnailScale)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumbnail,thumbnailCrop,thumbnailScale,trackingParams);

@override
String toString() {
  return 'MusicThumbnailRenderer(thumbnail: $thumbnail, thumbnailCrop: $thumbnailCrop, thumbnailScale: $thumbnailScale, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $MusicThumbnailRendererCopyWith<$Res>  {
  factory $MusicThumbnailRendererCopyWith(MusicThumbnailRenderer value, $Res Function(MusicThumbnailRenderer) _then) = _$MusicThumbnailRendererCopyWithImpl;
@useResult
$Res call({
 MusicThumbnailRendererThumbnail? thumbnail, String? thumbnailCrop, String? thumbnailScale, String? trackingParams
});


$MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail;

}
/// @nodoc
class _$MusicThumbnailRendererCopyWithImpl<$Res>
    implements $MusicThumbnailRendererCopyWith<$Res> {
  _$MusicThumbnailRendererCopyWithImpl(this._self, this._then);

  final MusicThumbnailRenderer _self;
  final $Res Function(MusicThumbnailRenderer) _then;

/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumbnail = freezed,Object? thumbnailCrop = freezed,Object? thumbnailScale = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MusicThumbnailRendererThumbnail?,thumbnailCrop: freezed == thumbnailCrop ? _self.thumbnailCrop : thumbnailCrop // ignore: cast_nullable_to_non_nullable
as String?,thumbnailScale: freezed == thumbnailScale ? _self.thumbnailScale : thumbnailScale // ignore: cast_nullable_to_non_nullable
as String?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MusicThumbnailRendererThumbnailCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicThumbnailRenderer].
extension MusicThumbnailRendererPatterns on MusicThumbnailRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicThumbnailRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicThumbnailRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicThumbnailRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicThumbnailRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicThumbnailRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicThumbnailRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicThumbnailRendererThumbnail? thumbnail,  String? thumbnailCrop,  String? thumbnailScale,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicThumbnailRenderer() when $default != null:
return $default(_that.thumbnail,_that.thumbnailCrop,_that.thumbnailScale,_that.trackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicThumbnailRendererThumbnail? thumbnail,  String? thumbnailCrop,  String? thumbnailScale,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _MusicThumbnailRenderer():
return $default(_that.thumbnail,_that.thumbnailCrop,_that.thumbnailScale,_that.trackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicThumbnailRendererThumbnail? thumbnail,  String? thumbnailCrop,  String? thumbnailScale,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _MusicThumbnailRenderer() when $default != null:
return $default(_that.thumbnail,_that.thumbnailCrop,_that.thumbnailScale,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicThumbnailRenderer implements MusicThumbnailRenderer {
  const _MusicThumbnailRenderer({this.thumbnail, this.thumbnailCrop, this.thumbnailScale, this.trackingParams});
  factory _MusicThumbnailRenderer.fromJson(Map<String, dynamic> json) => _$MusicThumbnailRendererFromJson(json);

@override final  MusicThumbnailRendererThumbnail? thumbnail;
@override final  String? thumbnailCrop;
@override final  String? thumbnailScale;
@override final  String? trackingParams;

/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicThumbnailRendererCopyWith<_MusicThumbnailRenderer> get copyWith => __$MusicThumbnailRendererCopyWithImpl<_MusicThumbnailRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicThumbnailRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicThumbnailRenderer&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.thumbnailCrop, thumbnailCrop) || other.thumbnailCrop == thumbnailCrop)&&(identical(other.thumbnailScale, thumbnailScale) || other.thumbnailScale == thumbnailScale)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumbnail,thumbnailCrop,thumbnailScale,trackingParams);

@override
String toString() {
  return 'MusicThumbnailRenderer(thumbnail: $thumbnail, thumbnailCrop: $thumbnailCrop, thumbnailScale: $thumbnailScale, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$MusicThumbnailRendererCopyWith<$Res> implements $MusicThumbnailRendererCopyWith<$Res> {
  factory _$MusicThumbnailRendererCopyWith(_MusicThumbnailRenderer value, $Res Function(_MusicThumbnailRenderer) _then) = __$MusicThumbnailRendererCopyWithImpl;
@override @useResult
$Res call({
 MusicThumbnailRendererThumbnail? thumbnail, String? thumbnailCrop, String? thumbnailScale, String? trackingParams
});


@override $MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail;

}
/// @nodoc
class __$MusicThumbnailRendererCopyWithImpl<$Res>
    implements _$MusicThumbnailRendererCopyWith<$Res> {
  __$MusicThumbnailRendererCopyWithImpl(this._self, this._then);

  final _MusicThumbnailRenderer _self;
  final $Res Function(_MusicThumbnailRenderer) _then;

/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumbnail = freezed,Object? thumbnailCrop = freezed,Object? thumbnailScale = freezed,Object? trackingParams = freezed,}) {
  return _then(_MusicThumbnailRenderer(
thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MusicThumbnailRendererThumbnail?,thumbnailCrop: freezed == thumbnailCrop ? _self.thumbnailCrop : thumbnailCrop // ignore: cast_nullable_to_non_nullable
as String?,thumbnailScale: freezed == thumbnailScale ? _self.thumbnailScale : thumbnailScale // ignore: cast_nullable_to_non_nullable
as String?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MusicThumbnailRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MusicThumbnailRendererThumbnailCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}


/// @nodoc
mixin _$MusicThumbnailRendererThumbnail {

 List<ThumbnailElement>? get thumbnails;
/// Create a copy of MusicThumbnailRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicThumbnailRendererThumbnailCopyWith<MusicThumbnailRendererThumbnail> get copyWith => _$MusicThumbnailRendererThumbnailCopyWithImpl<MusicThumbnailRendererThumbnail>(this as MusicThumbnailRendererThumbnail, _$identity);

  /// Serializes this MusicThumbnailRendererThumbnail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicThumbnailRendererThumbnail&&const DeepCollectionEquality().equals(other.thumbnails, thumbnails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(thumbnails));

@override
String toString() {
  return 'MusicThumbnailRendererThumbnail(thumbnails: $thumbnails)';
}


}

/// @nodoc
abstract mixin class $MusicThumbnailRendererThumbnailCopyWith<$Res>  {
  factory $MusicThumbnailRendererThumbnailCopyWith(MusicThumbnailRendererThumbnail value, $Res Function(MusicThumbnailRendererThumbnail) _then) = _$MusicThumbnailRendererThumbnailCopyWithImpl;
@useResult
$Res call({
 List<ThumbnailElement>? thumbnails
});




}
/// @nodoc
class _$MusicThumbnailRendererThumbnailCopyWithImpl<$Res>
    implements $MusicThumbnailRendererThumbnailCopyWith<$Res> {
  _$MusicThumbnailRendererThumbnailCopyWithImpl(this._self, this._then);

  final MusicThumbnailRendererThumbnail _self;
  final $Res Function(MusicThumbnailRendererThumbnail) _then;

/// Create a copy of MusicThumbnailRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumbnails = freezed,}) {
  return _then(_self.copyWith(
thumbnails: freezed == thumbnails ? _self.thumbnails : thumbnails // ignore: cast_nullable_to_non_nullable
as List<ThumbnailElement>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicThumbnailRendererThumbnail].
extension MusicThumbnailRendererThumbnailPatterns on MusicThumbnailRendererThumbnail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicThumbnailRendererThumbnail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicThumbnailRendererThumbnail value)  $default,){
final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicThumbnailRendererThumbnail value)?  $default,){
final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ThumbnailElement>? thumbnails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail() when $default != null:
return $default(_that.thumbnails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ThumbnailElement>? thumbnails)  $default,) {final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail():
return $default(_that.thumbnails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ThumbnailElement>? thumbnails)?  $default,) {final _that = this;
switch (_that) {
case _MusicThumbnailRendererThumbnail() when $default != null:
return $default(_that.thumbnails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicThumbnailRendererThumbnail implements MusicThumbnailRendererThumbnail {
  const _MusicThumbnailRendererThumbnail({final  List<ThumbnailElement>? thumbnails}): _thumbnails = thumbnails;
  factory _MusicThumbnailRendererThumbnail.fromJson(Map<String, dynamic> json) => _$MusicThumbnailRendererThumbnailFromJson(json);

 final  List<ThumbnailElement>? _thumbnails;
@override List<ThumbnailElement>? get thumbnails {
  final value = _thumbnails;
  if (value == null) return null;
  if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MusicThumbnailRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicThumbnailRendererThumbnailCopyWith<_MusicThumbnailRendererThumbnail> get copyWith => __$MusicThumbnailRendererThumbnailCopyWithImpl<_MusicThumbnailRendererThumbnail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicThumbnailRendererThumbnailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicThumbnailRendererThumbnail&&const DeepCollectionEquality().equals(other._thumbnails, _thumbnails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_thumbnails));

@override
String toString() {
  return 'MusicThumbnailRendererThumbnail(thumbnails: $thumbnails)';
}


}

/// @nodoc
abstract mixin class _$MusicThumbnailRendererThumbnailCopyWith<$Res> implements $MusicThumbnailRendererThumbnailCopyWith<$Res> {
  factory _$MusicThumbnailRendererThumbnailCopyWith(_MusicThumbnailRendererThumbnail value, $Res Function(_MusicThumbnailRendererThumbnail) _then) = __$MusicThumbnailRendererThumbnailCopyWithImpl;
@override @useResult
$Res call({
 List<ThumbnailElement>? thumbnails
});




}
/// @nodoc
class __$MusicThumbnailRendererThumbnailCopyWithImpl<$Res>
    implements _$MusicThumbnailRendererThumbnailCopyWith<$Res> {
  __$MusicThumbnailRendererThumbnailCopyWithImpl(this._self, this._then);

  final _MusicThumbnailRendererThumbnail _self;
  final $Res Function(_MusicThumbnailRendererThumbnail) _then;

/// Create a copy of MusicThumbnailRendererThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumbnails = freezed,}) {
  return _then(_MusicThumbnailRendererThumbnail(
thumbnails: freezed == thumbnails ? _self._thumbnails : thumbnails // ignore: cast_nullable_to_non_nullable
as List<ThumbnailElement>?,
  ));
}


}


/// @nodoc
mixin _$ThumbnailElement {

 String? get url; int? get width; int? get height;
/// Create a copy of ThumbnailElement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThumbnailElementCopyWith<ThumbnailElement> get copyWith => _$ThumbnailElementCopyWithImpl<ThumbnailElement>(this as ThumbnailElement, _$identity);

  /// Serializes this ThumbnailElement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThumbnailElement&&(identical(other.url, url) || other.url == url)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,width,height);

@override
String toString() {
  return 'ThumbnailElement(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $ThumbnailElementCopyWith<$Res>  {
  factory $ThumbnailElementCopyWith(ThumbnailElement value, $Res Function(ThumbnailElement) _then) = _$ThumbnailElementCopyWithImpl;
@useResult
$Res call({
 String? url, int? width, int? height
});




}
/// @nodoc
class _$ThumbnailElementCopyWithImpl<$Res>
    implements $ThumbnailElementCopyWith<$Res> {
  _$ThumbnailElementCopyWithImpl(this._self, this._then);

  final ThumbnailElement _self;
  final $Res Function(ThumbnailElement) _then;

/// Create a copy of ThumbnailElement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThumbnailElement].
extension ThumbnailElementPatterns on ThumbnailElement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThumbnailElement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThumbnailElement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThumbnailElement value)  $default,){
final _that = this;
switch (_that) {
case _ThumbnailElement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThumbnailElement value)?  $default,){
final _that = this;
switch (_that) {
case _ThumbnailElement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  int? width,  int? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThumbnailElement() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  int? width,  int? height)  $default,) {final _that = this;
switch (_that) {
case _ThumbnailElement():
return $default(_that.url,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  int? width,  int? height)?  $default,) {final _that = this;
switch (_that) {
case _ThumbnailElement() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThumbnailElement implements ThumbnailElement {
  const _ThumbnailElement({this.url, this.width, this.height});
  factory _ThumbnailElement.fromJson(Map<String, dynamic> json) => _$ThumbnailElementFromJson(json);

@override final  String? url;
@override final  int? width;
@override final  int? height;

/// Create a copy of ThumbnailElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThumbnailElementCopyWith<_ThumbnailElement> get copyWith => __$ThumbnailElementCopyWithImpl<_ThumbnailElement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThumbnailElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThumbnailElement&&(identical(other.url, url) || other.url == url)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,width,height);

@override
String toString() {
  return 'ThumbnailElement(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$ThumbnailElementCopyWith<$Res> implements $ThumbnailElementCopyWith<$Res> {
  factory _$ThumbnailElementCopyWith(_ThumbnailElement value, $Res Function(_ThumbnailElement) _then) = __$ThumbnailElementCopyWithImpl;
@override @useResult
$Res call({
 String? url, int? width, int? height
});




}
/// @nodoc
class __$ThumbnailElementCopyWithImpl<$Res>
    implements _$ThumbnailElementCopyWith<$Res> {
  __$ThumbnailElementCopyWithImpl(this._self, this._then);

  final _ThumbnailElement _self;
  final $Res Function(_ThumbnailElement) _then;

/// Create a copy of ThumbnailElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_ThumbnailElement(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Continuation {

 NextContinuationData? get nextContinuationData;
/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinuationCopyWith<Continuation> get copyWith => _$ContinuationCopyWithImpl<Continuation>(this as Continuation, _$identity);

  /// Serializes this Continuation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Continuation&&(identical(other.nextContinuationData, nextContinuationData) || other.nextContinuationData == nextContinuationData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextContinuationData);

@override
String toString() {
  return 'Continuation(nextContinuationData: $nextContinuationData)';
}


}

/// @nodoc
abstract mixin class $ContinuationCopyWith<$Res>  {
  factory $ContinuationCopyWith(Continuation value, $Res Function(Continuation) _then) = _$ContinuationCopyWithImpl;
@useResult
$Res call({
 NextContinuationData? nextContinuationData
});


$NextContinuationDataCopyWith<$Res>? get nextContinuationData;

}
/// @nodoc
class _$ContinuationCopyWithImpl<$Res>
    implements $ContinuationCopyWith<$Res> {
  _$ContinuationCopyWithImpl(this._self, this._then);

  final Continuation _self;
  final $Res Function(Continuation) _then;

/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextContinuationData = freezed,}) {
  return _then(_self.copyWith(
nextContinuationData: freezed == nextContinuationData ? _self.nextContinuationData : nextContinuationData // ignore: cast_nullable_to_non_nullable
as NextContinuationData?,
  ));
}
/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextContinuationDataCopyWith<$Res>? get nextContinuationData {
    if (_self.nextContinuationData == null) {
    return null;
  }

  return $NextContinuationDataCopyWith<$Res>(_self.nextContinuationData!, (value) {
    return _then(_self.copyWith(nextContinuationData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Continuation].
extension ContinuationPatterns on Continuation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Continuation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Continuation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Continuation value)  $default,){
final _that = this;
switch (_that) {
case _Continuation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Continuation value)?  $default,){
final _that = this;
switch (_that) {
case _Continuation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NextContinuationData? nextContinuationData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Continuation() when $default != null:
return $default(_that.nextContinuationData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NextContinuationData? nextContinuationData)  $default,) {final _that = this;
switch (_that) {
case _Continuation():
return $default(_that.nextContinuationData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NextContinuationData? nextContinuationData)?  $default,) {final _that = this;
switch (_that) {
case _Continuation() when $default != null:
return $default(_that.nextContinuationData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Continuation implements Continuation {
  const _Continuation({this.nextContinuationData});
  factory _Continuation.fromJson(Map<String, dynamic> json) => _$ContinuationFromJson(json);

@override final  NextContinuationData? nextContinuationData;

/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContinuationCopyWith<_Continuation> get copyWith => __$ContinuationCopyWithImpl<_Continuation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContinuationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Continuation&&(identical(other.nextContinuationData, nextContinuationData) || other.nextContinuationData == nextContinuationData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextContinuationData);

@override
String toString() {
  return 'Continuation(nextContinuationData: $nextContinuationData)';
}


}

/// @nodoc
abstract mixin class _$ContinuationCopyWith<$Res> implements $ContinuationCopyWith<$Res> {
  factory _$ContinuationCopyWith(_Continuation value, $Res Function(_Continuation) _then) = __$ContinuationCopyWithImpl;
@override @useResult
$Res call({
 NextContinuationData? nextContinuationData
});


@override $NextContinuationDataCopyWith<$Res>? get nextContinuationData;

}
/// @nodoc
class __$ContinuationCopyWithImpl<$Res>
    implements _$ContinuationCopyWith<$Res> {
  __$ContinuationCopyWithImpl(this._self, this._then);

  final _Continuation _self;
  final $Res Function(_Continuation) _then;

/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextContinuationData = freezed,}) {
  return _then(_Continuation(
nextContinuationData: freezed == nextContinuationData ? _self.nextContinuationData : nextContinuationData // ignore: cast_nullable_to_non_nullable
as NextContinuationData?,
  ));
}

/// Create a copy of Continuation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextContinuationDataCopyWith<$Res>? get nextContinuationData {
    if (_self.nextContinuationData == null) {
    return null;
  }

  return $NextContinuationDataCopyWith<$Res>(_self.nextContinuationData!, (value) {
    return _then(_self.copyWith(nextContinuationData: value));
  });
}
}


/// @nodoc
mixin _$NextContinuationData {

 String? get continuation; String? get clickTrackingParams;
/// Create a copy of NextContinuationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextContinuationDataCopyWith<NextContinuationData> get copyWith => _$NextContinuationDataCopyWithImpl<NextContinuationData>(this as NextContinuationData, _$identity);

  /// Serializes this NextContinuationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextContinuationData&&(identical(other.continuation, continuation) || other.continuation == continuation)&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,continuation,clickTrackingParams);

@override
String toString() {
  return 'NextContinuationData(continuation: $continuation, clickTrackingParams: $clickTrackingParams)';
}


}

/// @nodoc
abstract mixin class $NextContinuationDataCopyWith<$Res>  {
  factory $NextContinuationDataCopyWith(NextContinuationData value, $Res Function(NextContinuationData) _then) = _$NextContinuationDataCopyWithImpl;
@useResult
$Res call({
 String? continuation, String? clickTrackingParams
});




}
/// @nodoc
class _$NextContinuationDataCopyWithImpl<$Res>
    implements $NextContinuationDataCopyWith<$Res> {
  _$NextContinuationDataCopyWithImpl(this._self, this._then);

  final NextContinuationData _self;
  final $Res Function(NextContinuationData) _then;

/// Create a copy of NextContinuationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? continuation = freezed,Object? clickTrackingParams = freezed,}) {
  return _then(_self.copyWith(
continuation: freezed == continuation ? _self.continuation : continuation // ignore: cast_nullable_to_non_nullable
as String?,clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NextContinuationData].
extension NextContinuationDataPatterns on NextContinuationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NextContinuationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextContinuationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NextContinuationData value)  $default,){
final _that = this;
switch (_that) {
case _NextContinuationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NextContinuationData value)?  $default,){
final _that = this;
switch (_that) {
case _NextContinuationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? continuation,  String? clickTrackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextContinuationData() when $default != null:
return $default(_that.continuation,_that.clickTrackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? continuation,  String? clickTrackingParams)  $default,) {final _that = this;
switch (_that) {
case _NextContinuationData():
return $default(_that.continuation,_that.clickTrackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? continuation,  String? clickTrackingParams)?  $default,) {final _that = this;
switch (_that) {
case _NextContinuationData() when $default != null:
return $default(_that.continuation,_that.clickTrackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NextContinuationData implements NextContinuationData {
  const _NextContinuationData({this.continuation, this.clickTrackingParams});
  factory _NextContinuationData.fromJson(Map<String, dynamic> json) => _$NextContinuationDataFromJson(json);

@override final  String? continuation;
@override final  String? clickTrackingParams;

/// Create a copy of NextContinuationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextContinuationDataCopyWith<_NextContinuationData> get copyWith => __$NextContinuationDataCopyWithImpl<_NextContinuationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NextContinuationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextContinuationData&&(identical(other.continuation, continuation) || other.continuation == continuation)&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,continuation,clickTrackingParams);

@override
String toString() {
  return 'NextContinuationData(continuation: $continuation, clickTrackingParams: $clickTrackingParams)';
}


}

/// @nodoc
abstract mixin class _$NextContinuationDataCopyWith<$Res> implements $NextContinuationDataCopyWith<$Res> {
  factory _$NextContinuationDataCopyWith(_NextContinuationData value, $Res Function(_NextContinuationData) _then) = __$NextContinuationDataCopyWithImpl;
@override @useResult
$Res call({
 String? continuation, String? clickTrackingParams
});




}
/// @nodoc
class __$NextContinuationDataCopyWithImpl<$Res>
    implements _$NextContinuationDataCopyWith<$Res> {
  __$NextContinuationDataCopyWithImpl(this._self, this._then);

  final _NextContinuationData _self;
  final $Res Function(_NextContinuationData) _then;

/// Create a copy of NextContinuationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? continuation = freezed,Object? clickTrackingParams = freezed,}) {
  return _then(_NextContinuationData(
continuation: freezed == continuation ? _self.continuation : continuation // ignore: cast_nullable_to_non_nullable
as String?,clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShelfDivider {

 MusicShelfDividerRenderer? get musicShelfDividerRenderer;
/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfDividerCopyWith<ShelfDivider> get copyWith => _$ShelfDividerCopyWithImpl<ShelfDivider>(this as ShelfDivider, _$identity);

  /// Serializes this ShelfDivider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfDivider&&(identical(other.musicShelfDividerRenderer, musicShelfDividerRenderer) || other.musicShelfDividerRenderer == musicShelfDividerRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicShelfDividerRenderer);

@override
String toString() {
  return 'ShelfDivider(musicShelfDividerRenderer: $musicShelfDividerRenderer)';
}


}

/// @nodoc
abstract mixin class $ShelfDividerCopyWith<$Res>  {
  factory $ShelfDividerCopyWith(ShelfDivider value, $Res Function(ShelfDivider) _then) = _$ShelfDividerCopyWithImpl;
@useResult
$Res call({
 MusicShelfDividerRenderer? musicShelfDividerRenderer
});


$MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer;

}
/// @nodoc
class _$ShelfDividerCopyWithImpl<$Res>
    implements $ShelfDividerCopyWith<$Res> {
  _$ShelfDividerCopyWithImpl(this._self, this._then);

  final ShelfDivider _self;
  final $Res Function(ShelfDivider) _then;

/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicShelfDividerRenderer = freezed,}) {
  return _then(_self.copyWith(
musicShelfDividerRenderer: freezed == musicShelfDividerRenderer ? _self.musicShelfDividerRenderer : musicShelfDividerRenderer // ignore: cast_nullable_to_non_nullable
as MusicShelfDividerRenderer?,
  ));
}
/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer {
    if (_self.musicShelfDividerRenderer == null) {
    return null;
  }

  return $MusicShelfDividerRendererCopyWith<$Res>(_self.musicShelfDividerRenderer!, (value) {
    return _then(_self.copyWith(musicShelfDividerRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShelfDivider].
extension ShelfDividerPatterns on ShelfDivider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfDivider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfDivider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfDivider value)  $default,){
final _that = this;
switch (_that) {
case _ShelfDivider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfDivider value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfDivider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicShelfDividerRenderer? musicShelfDividerRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfDivider() when $default != null:
return $default(_that.musicShelfDividerRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicShelfDividerRenderer? musicShelfDividerRenderer)  $default,) {final _that = this;
switch (_that) {
case _ShelfDivider():
return $default(_that.musicShelfDividerRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicShelfDividerRenderer? musicShelfDividerRenderer)?  $default,) {final _that = this;
switch (_that) {
case _ShelfDivider() when $default != null:
return $default(_that.musicShelfDividerRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShelfDivider implements ShelfDivider {
  const _ShelfDivider({this.musicShelfDividerRenderer});
  factory _ShelfDivider.fromJson(Map<String, dynamic> json) => _$ShelfDividerFromJson(json);

@override final  MusicShelfDividerRenderer? musicShelfDividerRenderer;

/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfDividerCopyWith<_ShelfDivider> get copyWith => __$ShelfDividerCopyWithImpl<_ShelfDivider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShelfDividerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfDivider&&(identical(other.musicShelfDividerRenderer, musicShelfDividerRenderer) || other.musicShelfDividerRenderer == musicShelfDividerRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,musicShelfDividerRenderer);

@override
String toString() {
  return 'ShelfDivider(musicShelfDividerRenderer: $musicShelfDividerRenderer)';
}


}

/// @nodoc
abstract mixin class _$ShelfDividerCopyWith<$Res> implements $ShelfDividerCopyWith<$Res> {
  factory _$ShelfDividerCopyWith(_ShelfDivider value, $Res Function(_ShelfDivider) _then) = __$ShelfDividerCopyWithImpl;
@override @useResult
$Res call({
 MusicShelfDividerRenderer? musicShelfDividerRenderer
});


@override $MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer;

}
/// @nodoc
class __$ShelfDividerCopyWithImpl<$Res>
    implements _$ShelfDividerCopyWith<$Res> {
  __$ShelfDividerCopyWithImpl(this._self, this._then);

  final _ShelfDivider _self;
  final $Res Function(_ShelfDivider) _then;

/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicShelfDividerRenderer = freezed,}) {
  return _then(_ShelfDivider(
musicShelfDividerRenderer: freezed == musicShelfDividerRenderer ? _self.musicShelfDividerRenderer : musicShelfDividerRenderer // ignore: cast_nullable_to_non_nullable
as MusicShelfDividerRenderer?,
  ));
}

/// Create a copy of ShelfDivider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer {
    if (_self.musicShelfDividerRenderer == null) {
    return null;
  }

  return $MusicShelfDividerRendererCopyWith<$Res>(_self.musicShelfDividerRenderer!, (value) {
    return _then(_self.copyWith(musicShelfDividerRenderer: value));
  });
}
}


/// @nodoc
mixin _$MusicShelfDividerRenderer {

 bool? get hidden;
/// Create a copy of MusicShelfDividerRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicShelfDividerRendererCopyWith<MusicShelfDividerRenderer> get copyWith => _$MusicShelfDividerRendererCopyWithImpl<MusicShelfDividerRenderer>(this as MusicShelfDividerRenderer, _$identity);

  /// Serializes this MusicShelfDividerRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicShelfDividerRenderer&&(identical(other.hidden, hidden) || other.hidden == hidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hidden);

@override
String toString() {
  return 'MusicShelfDividerRenderer(hidden: $hidden)';
}


}

/// @nodoc
abstract mixin class $MusicShelfDividerRendererCopyWith<$Res>  {
  factory $MusicShelfDividerRendererCopyWith(MusicShelfDividerRenderer value, $Res Function(MusicShelfDividerRenderer) _then) = _$MusicShelfDividerRendererCopyWithImpl;
@useResult
$Res call({
 bool? hidden
});




}
/// @nodoc
class _$MusicShelfDividerRendererCopyWithImpl<$Res>
    implements $MusicShelfDividerRendererCopyWith<$Res> {
  _$MusicShelfDividerRendererCopyWithImpl(this._self, this._then);

  final MusicShelfDividerRenderer _self;
  final $Res Function(MusicShelfDividerRenderer) _then;

/// Create a copy of MusicShelfDividerRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hidden = freezed,}) {
  return _then(_self.copyWith(
hidden: freezed == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicShelfDividerRenderer].
extension MusicShelfDividerRendererPatterns on MusicShelfDividerRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicShelfDividerRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicShelfDividerRenderer value)  $default,){
final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicShelfDividerRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? hidden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer() when $default != null:
return $default(_that.hidden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? hidden)  $default,) {final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer():
return $default(_that.hidden);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? hidden)?  $default,) {final _that = this;
switch (_that) {
case _MusicShelfDividerRenderer() when $default != null:
return $default(_that.hidden);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicShelfDividerRenderer implements MusicShelfDividerRenderer {
  const _MusicShelfDividerRenderer({this.hidden});
  factory _MusicShelfDividerRenderer.fromJson(Map<String, dynamic> json) => _$MusicShelfDividerRendererFromJson(json);

@override final  bool? hidden;

/// Create a copy of MusicShelfDividerRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicShelfDividerRendererCopyWith<_MusicShelfDividerRenderer> get copyWith => __$MusicShelfDividerRendererCopyWithImpl<_MusicShelfDividerRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicShelfDividerRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicShelfDividerRenderer&&(identical(other.hidden, hidden) || other.hidden == hidden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hidden);

@override
String toString() {
  return 'MusicShelfDividerRenderer(hidden: $hidden)';
}


}

/// @nodoc
abstract mixin class _$MusicShelfDividerRendererCopyWith<$Res> implements $MusicShelfDividerRendererCopyWith<$Res> {
  factory _$MusicShelfDividerRendererCopyWith(_MusicShelfDividerRenderer value, $Res Function(_MusicShelfDividerRenderer) _then) = __$MusicShelfDividerRendererCopyWithImpl;
@override @useResult
$Res call({
 bool? hidden
});




}
/// @nodoc
class __$MusicShelfDividerRendererCopyWithImpl<$Res>
    implements _$MusicShelfDividerRendererCopyWith<$Res> {
  __$MusicShelfDividerRendererCopyWithImpl(this._self, this._then);

  final _MusicShelfDividerRenderer _self;
  final $Res Function(_MusicShelfDividerRenderer) _then;

/// Create a copy of MusicShelfDividerRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hidden = freezed,}) {
  return _then(_MusicShelfDividerRenderer(
hidden: freezed == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Header {

 ChipCloudRenderer? get chipCloudRenderer;
/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeaderCopyWith<Header> get copyWith => _$HeaderCopyWithImpl<Header>(this as Header, _$identity);

  /// Serializes this Header to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Header&&(identical(other.chipCloudRenderer, chipCloudRenderer) || other.chipCloudRenderer == chipCloudRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chipCloudRenderer);

@override
String toString() {
  return 'Header(chipCloudRenderer: $chipCloudRenderer)';
}


}

/// @nodoc
abstract mixin class $HeaderCopyWith<$Res>  {
  factory $HeaderCopyWith(Header value, $Res Function(Header) _then) = _$HeaderCopyWithImpl;
@useResult
$Res call({
 ChipCloudRenderer? chipCloudRenderer
});


$ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer;

}
/// @nodoc
class _$HeaderCopyWithImpl<$Res>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._self, this._then);

  final Header _self;
  final $Res Function(Header) _then;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chipCloudRenderer = freezed,}) {
  return _then(_self.copyWith(
chipCloudRenderer: freezed == chipCloudRenderer ? _self.chipCloudRenderer : chipCloudRenderer // ignore: cast_nullable_to_non_nullable
as ChipCloudRenderer?,
  ));
}
/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer {
    if (_self.chipCloudRenderer == null) {
    return null;
  }

  return $ChipCloudRendererCopyWith<$Res>(_self.chipCloudRenderer!, (value) {
    return _then(_self.copyWith(chipCloudRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Header].
extension HeaderPatterns on Header {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Header value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Header() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Header value)  $default,){
final _that = this;
switch (_that) {
case _Header():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Header value)?  $default,){
final _that = this;
switch (_that) {
case _Header() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChipCloudRenderer? chipCloudRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Header() when $default != null:
return $default(_that.chipCloudRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChipCloudRenderer? chipCloudRenderer)  $default,) {final _that = this;
switch (_that) {
case _Header():
return $default(_that.chipCloudRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChipCloudRenderer? chipCloudRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Header() when $default != null:
return $default(_that.chipCloudRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Header implements Header {
  const _Header({this.chipCloudRenderer});
  factory _Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

@override final  ChipCloudRenderer? chipCloudRenderer;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeaderCopyWith<_Header> get copyWith => __$HeaderCopyWithImpl<_Header>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeaderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Header&&(identical(other.chipCloudRenderer, chipCloudRenderer) || other.chipCloudRenderer == chipCloudRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chipCloudRenderer);

@override
String toString() {
  return 'Header(chipCloudRenderer: $chipCloudRenderer)';
}


}

/// @nodoc
abstract mixin class _$HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$HeaderCopyWith(_Header value, $Res Function(_Header) _then) = __$HeaderCopyWithImpl;
@override @useResult
$Res call({
 ChipCloudRenderer? chipCloudRenderer
});


@override $ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer;

}
/// @nodoc
class __$HeaderCopyWithImpl<$Res>
    implements _$HeaderCopyWith<$Res> {
  __$HeaderCopyWithImpl(this._self, this._then);

  final _Header _self;
  final $Res Function(_Header) _then;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chipCloudRenderer = freezed,}) {
  return _then(_Header(
chipCloudRenderer: freezed == chipCloudRenderer ? _self.chipCloudRenderer : chipCloudRenderer // ignore: cast_nullable_to_non_nullable
as ChipCloudRenderer?,
  ));
}

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer {
    if (_self.chipCloudRenderer == null) {
    return null;
  }

  return $ChipCloudRendererCopyWith<$Res>(_self.chipCloudRenderer!, (value) {
    return _then(_self.copyWith(chipCloudRenderer: value));
  });
}
}


/// @nodoc
mixin _$ChipCloudRenderer {

 List<Chip>? get chips; int? get collapsedRowCount; String? get trackingParams; bool? get horizontalScrollable;
/// Create a copy of ChipCloudRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChipCloudRendererCopyWith<ChipCloudRenderer> get copyWith => _$ChipCloudRendererCopyWithImpl<ChipCloudRenderer>(this as ChipCloudRenderer, _$identity);

  /// Serializes this ChipCloudRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChipCloudRenderer&&const DeepCollectionEquality().equals(other.chips, chips)&&(identical(other.collapsedRowCount, collapsedRowCount) || other.collapsedRowCount == collapsedRowCount)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.horizontalScrollable, horizontalScrollable) || other.horizontalScrollable == horizontalScrollable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chips),collapsedRowCount,trackingParams,horizontalScrollable);

@override
String toString() {
  return 'ChipCloudRenderer(chips: $chips, collapsedRowCount: $collapsedRowCount, trackingParams: $trackingParams, horizontalScrollable: $horizontalScrollable)';
}


}

/// @nodoc
abstract mixin class $ChipCloudRendererCopyWith<$Res>  {
  factory $ChipCloudRendererCopyWith(ChipCloudRenderer value, $Res Function(ChipCloudRenderer) _then) = _$ChipCloudRendererCopyWithImpl;
@useResult
$Res call({
 List<Chip>? chips, int? collapsedRowCount, String? trackingParams, bool? horizontalScrollable
});




}
/// @nodoc
class _$ChipCloudRendererCopyWithImpl<$Res>
    implements $ChipCloudRendererCopyWith<$Res> {
  _$ChipCloudRendererCopyWithImpl(this._self, this._then);

  final ChipCloudRenderer _self;
  final $Res Function(ChipCloudRenderer) _then;

/// Create a copy of ChipCloudRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chips = freezed,Object? collapsedRowCount = freezed,Object? trackingParams = freezed,Object? horizontalScrollable = freezed,}) {
  return _then(_self.copyWith(
chips: freezed == chips ? _self.chips : chips // ignore: cast_nullable_to_non_nullable
as List<Chip>?,collapsedRowCount: freezed == collapsedRowCount ? _self.collapsedRowCount : collapsedRowCount // ignore: cast_nullable_to_non_nullable
as int?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,horizontalScrollable: freezed == horizontalScrollable ? _self.horizontalScrollable : horizontalScrollable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChipCloudRenderer].
extension ChipCloudRendererPatterns on ChipCloudRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChipCloudRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChipCloudRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChipCloudRenderer value)  $default,){
final _that = this;
switch (_that) {
case _ChipCloudRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChipCloudRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _ChipCloudRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Chip>? chips,  int? collapsedRowCount,  String? trackingParams,  bool? horizontalScrollable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChipCloudRenderer() when $default != null:
return $default(_that.chips,_that.collapsedRowCount,_that.trackingParams,_that.horizontalScrollable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Chip>? chips,  int? collapsedRowCount,  String? trackingParams,  bool? horizontalScrollable)  $default,) {final _that = this;
switch (_that) {
case _ChipCloudRenderer():
return $default(_that.chips,_that.collapsedRowCount,_that.trackingParams,_that.horizontalScrollable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Chip>? chips,  int? collapsedRowCount,  String? trackingParams,  bool? horizontalScrollable)?  $default,) {final _that = this;
switch (_that) {
case _ChipCloudRenderer() when $default != null:
return $default(_that.chips,_that.collapsedRowCount,_that.trackingParams,_that.horizontalScrollable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChipCloudRenderer implements ChipCloudRenderer {
  const _ChipCloudRenderer({final  List<Chip>? chips, this.collapsedRowCount, this.trackingParams, this.horizontalScrollable}): _chips = chips;
  factory _ChipCloudRenderer.fromJson(Map<String, dynamic> json) => _$ChipCloudRendererFromJson(json);

 final  List<Chip>? _chips;
@override List<Chip>? get chips {
  final value = _chips;
  if (value == null) return null;
  if (_chips is EqualUnmodifiableListView) return _chips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? collapsedRowCount;
@override final  String? trackingParams;
@override final  bool? horizontalScrollable;

/// Create a copy of ChipCloudRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChipCloudRendererCopyWith<_ChipCloudRenderer> get copyWith => __$ChipCloudRendererCopyWithImpl<_ChipCloudRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChipCloudRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChipCloudRenderer&&const DeepCollectionEquality().equals(other._chips, _chips)&&(identical(other.collapsedRowCount, collapsedRowCount) || other.collapsedRowCount == collapsedRowCount)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.horizontalScrollable, horizontalScrollable) || other.horizontalScrollable == horizontalScrollable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chips),collapsedRowCount,trackingParams,horizontalScrollable);

@override
String toString() {
  return 'ChipCloudRenderer(chips: $chips, collapsedRowCount: $collapsedRowCount, trackingParams: $trackingParams, horizontalScrollable: $horizontalScrollable)';
}


}

/// @nodoc
abstract mixin class _$ChipCloudRendererCopyWith<$Res> implements $ChipCloudRendererCopyWith<$Res> {
  factory _$ChipCloudRendererCopyWith(_ChipCloudRenderer value, $Res Function(_ChipCloudRenderer) _then) = __$ChipCloudRendererCopyWithImpl;
@override @useResult
$Res call({
 List<Chip>? chips, int? collapsedRowCount, String? trackingParams, bool? horizontalScrollable
});




}
/// @nodoc
class __$ChipCloudRendererCopyWithImpl<$Res>
    implements _$ChipCloudRendererCopyWith<$Res> {
  __$ChipCloudRendererCopyWithImpl(this._self, this._then);

  final _ChipCloudRenderer _self;
  final $Res Function(_ChipCloudRenderer) _then;

/// Create a copy of ChipCloudRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chips = freezed,Object? collapsedRowCount = freezed,Object? trackingParams = freezed,Object? horizontalScrollable = freezed,}) {
  return _then(_ChipCloudRenderer(
chips: freezed == chips ? _self._chips : chips // ignore: cast_nullable_to_non_nullable
as List<Chip>?,collapsedRowCount: freezed == collapsedRowCount ? _self.collapsedRowCount : collapsedRowCount // ignore: cast_nullable_to_non_nullable
as int?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,horizontalScrollable: freezed == horizontalScrollable ? _self.horizontalScrollable : horizontalScrollable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Chip {

 ChipCloudChipRenderer? get chipCloudChipRenderer;
/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChipCopyWith<Chip> get copyWith => _$ChipCopyWithImpl<Chip>(this as Chip, _$identity);

  /// Serializes this Chip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chip&&(identical(other.chipCloudChipRenderer, chipCloudChipRenderer) || other.chipCloudChipRenderer == chipCloudChipRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chipCloudChipRenderer);

@override
String toString() {
  return 'Chip(chipCloudChipRenderer: $chipCloudChipRenderer)';
}


}

/// @nodoc
abstract mixin class $ChipCopyWith<$Res>  {
  factory $ChipCopyWith(Chip value, $Res Function(Chip) _then) = _$ChipCopyWithImpl;
@useResult
$Res call({
 ChipCloudChipRenderer? chipCloudChipRenderer
});


$ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer;

}
/// @nodoc
class _$ChipCopyWithImpl<$Res>
    implements $ChipCopyWith<$Res> {
  _$ChipCopyWithImpl(this._self, this._then);

  final Chip _self;
  final $Res Function(Chip) _then;

/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chipCloudChipRenderer = freezed,}) {
  return _then(_self.copyWith(
chipCloudChipRenderer: freezed == chipCloudChipRenderer ? _self.chipCloudChipRenderer : chipCloudChipRenderer // ignore: cast_nullable_to_non_nullable
as ChipCloudChipRenderer?,
  ));
}
/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer {
    if (_self.chipCloudChipRenderer == null) {
    return null;
  }

  return $ChipCloudChipRendererCopyWith<$Res>(_self.chipCloudChipRenderer!, (value) {
    return _then(_self.copyWith(chipCloudChipRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chip].
extension ChipPatterns on Chip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chip value)  $default,){
final _that = this;
switch (_that) {
case _Chip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chip value)?  $default,){
final _that = this;
switch (_that) {
case _Chip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChipCloudChipRenderer? chipCloudChipRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chip() when $default != null:
return $default(_that.chipCloudChipRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChipCloudChipRenderer? chipCloudChipRenderer)  $default,) {final _that = this;
switch (_that) {
case _Chip():
return $default(_that.chipCloudChipRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChipCloudChipRenderer? chipCloudChipRenderer)?  $default,) {final _that = this;
switch (_that) {
case _Chip() when $default != null:
return $default(_that.chipCloudChipRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chip implements Chip {
  const _Chip({this.chipCloudChipRenderer});
  factory _Chip.fromJson(Map<String, dynamic> json) => _$ChipFromJson(json);

@override final  ChipCloudChipRenderer? chipCloudChipRenderer;

/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChipCopyWith<_Chip> get copyWith => __$ChipCopyWithImpl<_Chip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chip&&(identical(other.chipCloudChipRenderer, chipCloudChipRenderer) || other.chipCloudChipRenderer == chipCloudChipRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chipCloudChipRenderer);

@override
String toString() {
  return 'Chip(chipCloudChipRenderer: $chipCloudChipRenderer)';
}


}

/// @nodoc
abstract mixin class _$ChipCopyWith<$Res> implements $ChipCopyWith<$Res> {
  factory _$ChipCopyWith(_Chip value, $Res Function(_Chip) _then) = __$ChipCopyWithImpl;
@override @useResult
$Res call({
 ChipCloudChipRenderer? chipCloudChipRenderer
});


@override $ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer;

}
/// @nodoc
class __$ChipCopyWithImpl<$Res>
    implements _$ChipCopyWith<$Res> {
  __$ChipCopyWithImpl(this._self, this._then);

  final _Chip _self;
  final $Res Function(_Chip) _then;

/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chipCloudChipRenderer = freezed,}) {
  return _then(_Chip(
chipCloudChipRenderer: freezed == chipCloudChipRenderer ? _self.chipCloudChipRenderer : chipCloudChipRenderer // ignore: cast_nullable_to_non_nullable
as ChipCloudChipRenderer?,
  ));
}

/// Create a copy of Chip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer {
    if (_self.chipCloudChipRenderer == null) {
    return null;
  }

  return $ChipCloudChipRendererCopyWith<$Res>(_self.chipCloudChipRenderer!, (value) {
    return _then(_self.copyWith(chipCloudChipRenderer: value));
  });
}
}


/// @nodoc
mixin _$ChipCloudChipRenderer {

 StyleClass? get style; ChipCloudChipRendererNavigationEndpoint? get navigationEndpoint; String? get trackingParams; Icon? get icon; Accessibility? get accessibilityData; bool? get isSelected; Title? get text; String? get uniqueId;
/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChipCloudChipRendererCopyWith<ChipCloudChipRenderer> get copyWith => _$ChipCloudChipRendererCopyWithImpl<ChipCloudChipRenderer>(this as ChipCloudChipRenderer, _$identity);

  /// Serializes this ChipCloudChipRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChipCloudChipRenderer&&(identical(other.style, style) || other.style == style)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.text, text) || other.text == text)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,navigationEndpoint,trackingParams,icon,accessibilityData,isSelected,text,uniqueId);

@override
String toString() {
  return 'ChipCloudChipRenderer(style: $style, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData, isSelected: $isSelected, text: $text, uniqueId: $uniqueId)';
}


}

/// @nodoc
abstract mixin class $ChipCloudChipRendererCopyWith<$Res>  {
  factory $ChipCloudChipRendererCopyWith(ChipCloudChipRenderer value, $Res Function(ChipCloudChipRenderer) _then) = _$ChipCloudChipRendererCopyWithImpl;
@useResult
$Res call({
 StyleClass? style, ChipCloudChipRendererNavigationEndpoint? navigationEndpoint, String? trackingParams, Icon? icon, Accessibility? accessibilityData, bool? isSelected, Title? text, String? uniqueId
});


$StyleClassCopyWith<$Res>? get style;$ChipCloudChipRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;$IconCopyWith<$Res>? get icon;$AccessibilityCopyWith<$Res>? get accessibilityData;$TitleCopyWith<$Res>? get text;

}
/// @nodoc
class _$ChipCloudChipRendererCopyWithImpl<$Res>
    implements $ChipCloudChipRendererCopyWith<$Res> {
  _$ChipCloudChipRendererCopyWithImpl(this._self, this._then);

  final ChipCloudChipRenderer _self;
  final $Res Function(ChipCloudChipRenderer) _then;

/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? style = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? icon = freezed,Object? accessibilityData = freezed,Object? isSelected = freezed,Object? text = freezed,Object? uniqueId = freezed,}) {
  return _then(_self.copyWith(
style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as StyleClass?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as ChipCloudChipRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as Accessibility?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleClassCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $StyleClassCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudChipRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChipCloudChipRenderer].
extension ChipCloudChipRendererPatterns on ChipCloudChipRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChipCloudChipRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChipCloudChipRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChipCloudChipRenderer value)  $default,){
final _that = this;
switch (_that) {
case _ChipCloudChipRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChipCloudChipRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _ChipCloudChipRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StyleClass? style,  ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  Icon? icon,  Accessibility? accessibilityData,  bool? isSelected,  Title? text,  String? uniqueId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChipCloudChipRenderer() when $default != null:
return $default(_that.style,_that.navigationEndpoint,_that.trackingParams,_that.icon,_that.accessibilityData,_that.isSelected,_that.text,_that.uniqueId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StyleClass? style,  ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  Icon? icon,  Accessibility? accessibilityData,  bool? isSelected,  Title? text,  String? uniqueId)  $default,) {final _that = this;
switch (_that) {
case _ChipCloudChipRenderer():
return $default(_that.style,_that.navigationEndpoint,_that.trackingParams,_that.icon,_that.accessibilityData,_that.isSelected,_that.text,_that.uniqueId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StyleClass? style,  ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,  String? trackingParams,  Icon? icon,  Accessibility? accessibilityData,  bool? isSelected,  Title? text,  String? uniqueId)?  $default,) {final _that = this;
switch (_that) {
case _ChipCloudChipRenderer() when $default != null:
return $default(_that.style,_that.navigationEndpoint,_that.trackingParams,_that.icon,_that.accessibilityData,_that.isSelected,_that.text,_that.uniqueId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChipCloudChipRenderer implements ChipCloudChipRenderer {
  const _ChipCloudChipRenderer({this.style, this.navigationEndpoint, this.trackingParams, this.icon, this.accessibilityData, this.isSelected, this.text, this.uniqueId});
  factory _ChipCloudChipRenderer.fromJson(Map<String, dynamic> json) => _$ChipCloudChipRendererFromJson(json);

@override final  StyleClass? style;
@override final  ChipCloudChipRendererNavigationEndpoint? navigationEndpoint;
@override final  String? trackingParams;
@override final  Icon? icon;
@override final  Accessibility? accessibilityData;
@override final  bool? isSelected;
@override final  Title? text;
@override final  String? uniqueId;

/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChipCloudChipRendererCopyWith<_ChipCloudChipRenderer> get copyWith => __$ChipCloudChipRendererCopyWithImpl<_ChipCloudChipRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChipCloudChipRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChipCloudChipRenderer&&(identical(other.style, style) || other.style == style)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.accessibilityData, accessibilityData) || other.accessibilityData == accessibilityData)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.text, text) || other.text == text)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,navigationEndpoint,trackingParams,icon,accessibilityData,isSelected,text,uniqueId);

@override
String toString() {
  return 'ChipCloudChipRenderer(style: $style, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData, isSelected: $isSelected, text: $text, uniqueId: $uniqueId)';
}


}

/// @nodoc
abstract mixin class _$ChipCloudChipRendererCopyWith<$Res> implements $ChipCloudChipRendererCopyWith<$Res> {
  factory _$ChipCloudChipRendererCopyWith(_ChipCloudChipRenderer value, $Res Function(_ChipCloudChipRenderer) _then) = __$ChipCloudChipRendererCopyWithImpl;
@override @useResult
$Res call({
 StyleClass? style, ChipCloudChipRendererNavigationEndpoint? navigationEndpoint, String? trackingParams, Icon? icon, Accessibility? accessibilityData, bool? isSelected, Title? text, String? uniqueId
});


@override $StyleClassCopyWith<$Res>? get style;@override $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;@override $IconCopyWith<$Res>? get icon;@override $AccessibilityCopyWith<$Res>? get accessibilityData;@override $TitleCopyWith<$Res>? get text;

}
/// @nodoc
class __$ChipCloudChipRendererCopyWithImpl<$Res>
    implements _$ChipCloudChipRendererCopyWith<$Res> {
  __$ChipCloudChipRendererCopyWithImpl(this._self, this._then);

  final _ChipCloudChipRenderer _self;
  final $Res Function(_ChipCloudChipRenderer) _then;

/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? style = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? icon = freezed,Object? accessibilityData = freezed,Object? isSelected = freezed,Object? text = freezed,Object? uniqueId = freezed,}) {
  return _then(_ChipCloudChipRenderer(
style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as StyleClass?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as ChipCloudChipRendererNavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,accessibilityData: freezed == accessibilityData ? _self.accessibilityData : accessibilityData // ignore: cast_nullable_to_non_nullable
as Accessibility?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Title?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleClassCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $StyleClassCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChipCloudChipRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_self.accessibilityData == null) {
    return null;
  }

  return $AccessibilityCopyWith<$Res>(_self.accessibilityData!, (value) {
    return _then(_self.copyWith(accessibilityData: value));
  });
}/// Create a copy of ChipCloudChipRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get text {
    if (_self.text == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.text!, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}


/// @nodoc
mixin _$ChipCloudChipRendererNavigationEndpoint {

 String? get clickTrackingParams; SearchEndpoint? get searchEndpoint;
/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChipCloudChipRendererNavigationEndpointCopyWith<ChipCloudChipRendererNavigationEndpoint> get copyWith => _$ChipCloudChipRendererNavigationEndpointCopyWithImpl<ChipCloudChipRendererNavigationEndpoint>(this as ChipCloudChipRendererNavigationEndpoint, _$identity);

  /// Serializes this ChipCloudChipRendererNavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChipCloudChipRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.searchEndpoint, searchEndpoint) || other.searchEndpoint == searchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,searchEndpoint);

@override
String toString() {
  return 'ChipCloudChipRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
}


}

/// @nodoc
abstract mixin class $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>  {
  factory $ChipCloudChipRendererNavigationEndpointCopyWith(ChipCloudChipRendererNavigationEndpoint value, $Res Function(ChipCloudChipRendererNavigationEndpoint) _then) = _$ChipCloudChipRendererNavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, SearchEndpoint? searchEndpoint
});


$SearchEndpointCopyWith<$Res>? get searchEndpoint;

}
/// @nodoc
class _$ChipCloudChipRendererNavigationEndpointCopyWithImpl<$Res>
    implements $ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  _$ChipCloudChipRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final ChipCloudChipRendererNavigationEndpoint _self;
  final $Res Function(ChipCloudChipRendererNavigationEndpoint) _then;

/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? searchEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,searchEndpoint: freezed == searchEndpoint ? _self.searchEndpoint : searchEndpoint // ignore: cast_nullable_to_non_nullable
as SearchEndpoint?,
  ));
}
/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchEndpointCopyWith<$Res>? get searchEndpoint {
    if (_self.searchEndpoint == null) {
    return null;
  }

  return $SearchEndpointCopyWith<$Res>(_self.searchEndpoint!, (value) {
    return _then(_self.copyWith(searchEndpoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChipCloudChipRendererNavigationEndpoint].
extension ChipCloudChipRendererNavigationEndpointPatterns on ChipCloudChipRendererNavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChipCloudChipRendererNavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChipCloudChipRendererNavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChipCloudChipRendererNavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clickTrackingParams,  SearchEndpoint? searchEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.searchEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clickTrackingParams,  SearchEndpoint? searchEndpoint)  $default,) {final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint():
return $default(_that.clickTrackingParams,_that.searchEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clickTrackingParams,  SearchEndpoint? searchEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _ChipCloudChipRendererNavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.searchEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChipCloudChipRendererNavigationEndpoint implements ChipCloudChipRendererNavigationEndpoint {
  const _ChipCloudChipRendererNavigationEndpoint({this.clickTrackingParams, this.searchEndpoint});
  factory _ChipCloudChipRendererNavigationEndpoint.fromJson(Map<String, dynamic> json) => _$ChipCloudChipRendererNavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  SearchEndpoint? searchEndpoint;

/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChipCloudChipRendererNavigationEndpointCopyWith<_ChipCloudChipRendererNavigationEndpoint> get copyWith => __$ChipCloudChipRendererNavigationEndpointCopyWithImpl<_ChipCloudChipRendererNavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChipCloudChipRendererNavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChipCloudChipRendererNavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.searchEndpoint, searchEndpoint) || other.searchEndpoint == searchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,searchEndpoint);

@override
String toString() {
  return 'ChipCloudChipRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
}


}

/// @nodoc
abstract mixin class _$ChipCloudChipRendererNavigationEndpointCopyWith<$Res> implements $ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  factory _$ChipCloudChipRendererNavigationEndpointCopyWith(_ChipCloudChipRendererNavigationEndpoint value, $Res Function(_ChipCloudChipRendererNavigationEndpoint) _then) = __$ChipCloudChipRendererNavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, SearchEndpoint? searchEndpoint
});


@override $SearchEndpointCopyWith<$Res>? get searchEndpoint;

}
/// @nodoc
class __$ChipCloudChipRendererNavigationEndpointCopyWithImpl<$Res>
    implements _$ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  __$ChipCloudChipRendererNavigationEndpointCopyWithImpl(this._self, this._then);

  final _ChipCloudChipRendererNavigationEndpoint _self;
  final $Res Function(_ChipCloudChipRendererNavigationEndpoint) _then;

/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? searchEndpoint = freezed,}) {
  return _then(_ChipCloudChipRendererNavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,searchEndpoint: freezed == searchEndpoint ? _self.searchEndpoint : searchEndpoint // ignore: cast_nullable_to_non_nullable
as SearchEndpoint?,
  ));
}

/// Create a copy of ChipCloudChipRendererNavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchEndpointCopyWith<$Res>? get searchEndpoint {
    if (_self.searchEndpoint == null) {
    return null;
  }

  return $SearchEndpointCopyWith<$Res>(_self.searchEndpoint!, (value) {
    return _then(_self.copyWith(searchEndpoint: value));
  });
}
}


/// @nodoc
mixin _$SearchEndpoint {

 String? get query; String? get params;
/// Create a copy of SearchEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEndpointCopyWith<SearchEndpoint> get copyWith => _$SearchEndpointCopyWithImpl<SearchEndpoint>(this as SearchEndpoint, _$identity);

  /// Serializes this SearchEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEndpoint&&(identical(other.query, query) || other.query == query)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,params);

@override
String toString() {
  return 'SearchEndpoint(query: $query, params: $params)';
}


}

/// @nodoc
abstract mixin class $SearchEndpointCopyWith<$Res>  {
  factory $SearchEndpointCopyWith(SearchEndpoint value, $Res Function(SearchEndpoint) _then) = _$SearchEndpointCopyWithImpl;
@useResult
$Res call({
 String? query, String? params
});




}
/// @nodoc
class _$SearchEndpointCopyWithImpl<$Res>
    implements $SearchEndpointCopyWith<$Res> {
  _$SearchEndpointCopyWithImpl(this._self, this._then);

  final SearchEndpoint _self;
  final $Res Function(SearchEndpoint) _then;

/// Create a copy of SearchEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? params = freezed,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchEndpoint].
extension SearchEndpointPatterns on SearchEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _SearchEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  String? params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
return $default(_that.query,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  String? params)  $default,) {final _that = this;
switch (_that) {
case _SearchEndpoint():
return $default(_that.query,_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  String? params)?  $default,) {final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
return $default(_that.query,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchEndpoint implements SearchEndpoint {
  const _SearchEndpoint({this.query, this.params});
  factory _SearchEndpoint.fromJson(Map<String, dynamic> json) => _$SearchEndpointFromJson(json);

@override final  String? query;
@override final  String? params;

/// Create a copy of SearchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchEndpointCopyWith<_SearchEndpoint> get copyWith => __$SearchEndpointCopyWithImpl<_SearchEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchEndpoint&&(identical(other.query, query) || other.query == query)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,params);

@override
String toString() {
  return 'SearchEndpoint(query: $query, params: $params)';
}


}

/// @nodoc
abstract mixin class _$SearchEndpointCopyWith<$Res> implements $SearchEndpointCopyWith<$Res> {
  factory _$SearchEndpointCopyWith(_SearchEndpoint value, $Res Function(_SearchEndpoint) _then) = __$SearchEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? query, String? params
});




}
/// @nodoc
class __$SearchEndpointCopyWithImpl<$Res>
    implements _$SearchEndpointCopyWith<$Res> {
  __$SearchEndpointCopyWithImpl(this._self, this._then);

  final _SearchEndpoint _self;
  final $Res Function(_SearchEndpoint) _then;

/// Create a copy of SearchEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? params = freezed,}) {
  return _then(_SearchEndpoint(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StyleClass {

 String? get styleType;
/// Create a copy of StyleClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StyleClassCopyWith<StyleClass> get copyWith => _$StyleClassCopyWithImpl<StyleClass>(this as StyleClass, _$identity);

  /// Serializes this StyleClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StyleClass&&(identical(other.styleType, styleType) || other.styleType == styleType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,styleType);

@override
String toString() {
  return 'StyleClass(styleType: $styleType)';
}


}

/// @nodoc
abstract mixin class $StyleClassCopyWith<$Res>  {
  factory $StyleClassCopyWith(StyleClass value, $Res Function(StyleClass) _then) = _$StyleClassCopyWithImpl;
@useResult
$Res call({
 String? styleType
});




}
/// @nodoc
class _$StyleClassCopyWithImpl<$Res>
    implements $StyleClassCopyWith<$Res> {
  _$StyleClassCopyWithImpl(this._self, this._then);

  final StyleClass _self;
  final $Res Function(StyleClass) _then;

/// Create a copy of StyleClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? styleType = freezed,}) {
  return _then(_self.copyWith(
styleType: freezed == styleType ? _self.styleType : styleType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StyleClass].
extension StyleClassPatterns on StyleClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StyleClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StyleClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StyleClass value)  $default,){
final _that = this;
switch (_that) {
case _StyleClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StyleClass value)?  $default,){
final _that = this;
switch (_that) {
case _StyleClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? styleType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StyleClass() when $default != null:
return $default(_that.styleType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? styleType)  $default,) {final _that = this;
switch (_that) {
case _StyleClass():
return $default(_that.styleType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? styleType)?  $default,) {final _that = this;
switch (_that) {
case _StyleClass() when $default != null:
return $default(_that.styleType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StyleClass implements StyleClass {
  const _StyleClass({this.styleType});
  factory _StyleClass.fromJson(Map<String, dynamic> json) => _$StyleClassFromJson(json);

@override final  String? styleType;

/// Create a copy of StyleClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StyleClassCopyWith<_StyleClass> get copyWith => __$StyleClassCopyWithImpl<_StyleClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StyleClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StyleClass&&(identical(other.styleType, styleType) || other.styleType == styleType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,styleType);

@override
String toString() {
  return 'StyleClass(styleType: $styleType)';
}


}

/// @nodoc
abstract mixin class _$StyleClassCopyWith<$Res> implements $StyleClassCopyWith<$Res> {
  factory _$StyleClassCopyWith(_StyleClass value, $Res Function(_StyleClass) _then) = __$StyleClassCopyWithImpl;
@override @useResult
$Res call({
 String? styleType
});




}
/// @nodoc
class __$StyleClassCopyWithImpl<$Res>
    implements _$StyleClassCopyWith<$Res> {
  __$StyleClassCopyWithImpl(this._self, this._then);

  final _StyleClass _self;
  final $Res Function(_StyleClass) _then;

/// Create a copy of StyleClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? styleType = freezed,}) {
  return _then(_StyleClass(
styleType: freezed == styleType ? _self.styleType : styleType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ResponseContext {

 String? get visitorData; List<ServiceTrackingParam>? get serviceTrackingParams; int? get maxAgeSeconds;
/// Create a copy of ResponseContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseContextCopyWith<ResponseContext> get copyWith => _$ResponseContextCopyWithImpl<ResponseContext>(this as ResponseContext, _$identity);

  /// Serializes this ResponseContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseContext&&(identical(other.visitorData, visitorData) || other.visitorData == visitorData)&&const DeepCollectionEquality().equals(other.serviceTrackingParams, serviceTrackingParams)&&(identical(other.maxAgeSeconds, maxAgeSeconds) || other.maxAgeSeconds == maxAgeSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitorData,const DeepCollectionEquality().hash(serviceTrackingParams),maxAgeSeconds);

@override
String toString() {
  return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams, maxAgeSeconds: $maxAgeSeconds)';
}


}

/// @nodoc
abstract mixin class $ResponseContextCopyWith<$Res>  {
  factory $ResponseContextCopyWith(ResponseContext value, $Res Function(ResponseContext) _then) = _$ResponseContextCopyWithImpl;
@useResult
$Res call({
 String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams, int? maxAgeSeconds
});




}
/// @nodoc
class _$ResponseContextCopyWithImpl<$Res>
    implements $ResponseContextCopyWith<$Res> {
  _$ResponseContextCopyWithImpl(this._self, this._then);

  final ResponseContext _self;
  final $Res Function(ResponseContext) _then;

/// Create a copy of ResponseContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visitorData = freezed,Object? serviceTrackingParams = freezed,Object? maxAgeSeconds = freezed,}) {
  return _then(_self.copyWith(
visitorData: freezed == visitorData ? _self.visitorData : visitorData // ignore: cast_nullable_to_non_nullable
as String?,serviceTrackingParams: freezed == serviceTrackingParams ? _self.serviceTrackingParams : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
as List<ServiceTrackingParam>?,maxAgeSeconds: freezed == maxAgeSeconds ? _self.maxAgeSeconds : maxAgeSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseContext].
extension ResponseContextPatterns on ResponseContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseContext value)  $default,){
final _that = this;
switch (_that) {
case _ResponseContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseContext value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams,  int? maxAgeSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
return $default(_that.visitorData,_that.serviceTrackingParams,_that.maxAgeSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams,  int? maxAgeSeconds)  $default,) {final _that = this;
switch (_that) {
case _ResponseContext():
return $default(_that.visitorData,_that.serviceTrackingParams,_that.maxAgeSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams,  int? maxAgeSeconds)?  $default,) {final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
return $default(_that.visitorData,_that.serviceTrackingParams,_that.maxAgeSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseContext implements ResponseContext {
  const _ResponseContext({this.visitorData, final  List<ServiceTrackingParam>? serviceTrackingParams, this.maxAgeSeconds}): _serviceTrackingParams = serviceTrackingParams;
  factory _ResponseContext.fromJson(Map<String, dynamic> json) => _$ResponseContextFromJson(json);

@override final  String? visitorData;
 final  List<ServiceTrackingParam>? _serviceTrackingParams;
@override List<ServiceTrackingParam>? get serviceTrackingParams {
  final value = _serviceTrackingParams;
  if (value == null) return null;
  if (_serviceTrackingParams is EqualUnmodifiableListView) return _serviceTrackingParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? maxAgeSeconds;

/// Create a copy of ResponseContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseContextCopyWith<_ResponseContext> get copyWith => __$ResponseContextCopyWithImpl<_ResponseContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseContext&&(identical(other.visitorData, visitorData) || other.visitorData == visitorData)&&const DeepCollectionEquality().equals(other._serviceTrackingParams, _serviceTrackingParams)&&(identical(other.maxAgeSeconds, maxAgeSeconds) || other.maxAgeSeconds == maxAgeSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitorData,const DeepCollectionEquality().hash(_serviceTrackingParams),maxAgeSeconds);

@override
String toString() {
  return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams, maxAgeSeconds: $maxAgeSeconds)';
}


}

/// @nodoc
abstract mixin class _$ResponseContextCopyWith<$Res> implements $ResponseContextCopyWith<$Res> {
  factory _$ResponseContextCopyWith(_ResponseContext value, $Res Function(_ResponseContext) _then) = __$ResponseContextCopyWithImpl;
@override @useResult
$Res call({
 String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams, int? maxAgeSeconds
});




}
/// @nodoc
class __$ResponseContextCopyWithImpl<$Res>
    implements _$ResponseContextCopyWith<$Res> {
  __$ResponseContextCopyWithImpl(this._self, this._then);

  final _ResponseContext _self;
  final $Res Function(_ResponseContext) _then;

/// Create a copy of ResponseContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visitorData = freezed,Object? serviceTrackingParams = freezed,Object? maxAgeSeconds = freezed,}) {
  return _then(_ResponseContext(
visitorData: freezed == visitorData ? _self.visitorData : visitorData // ignore: cast_nullable_to_non_nullable
as String?,serviceTrackingParams: freezed == serviceTrackingParams ? _self._serviceTrackingParams : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
as List<ServiceTrackingParam>?,maxAgeSeconds: freezed == maxAgeSeconds ? _self.maxAgeSeconds : maxAgeSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ServiceTrackingParam {

 String? get service; List<Param>? get params;
/// Create a copy of ServiceTrackingParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceTrackingParamCopyWith<ServiceTrackingParam> get copyWith => _$ServiceTrackingParamCopyWithImpl<ServiceTrackingParam>(this as ServiceTrackingParam, _$identity);

  /// Serializes this ServiceTrackingParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceTrackingParam&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other.params, params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,const DeepCollectionEquality().hash(params));

@override
String toString() {
  return 'ServiceTrackingParam(service: $service, params: $params)';
}


}

/// @nodoc
abstract mixin class $ServiceTrackingParamCopyWith<$Res>  {
  factory $ServiceTrackingParamCopyWith(ServiceTrackingParam value, $Res Function(ServiceTrackingParam) _then) = _$ServiceTrackingParamCopyWithImpl;
@useResult
$Res call({
 String? service, List<Param>? params
});




}
/// @nodoc
class _$ServiceTrackingParamCopyWithImpl<$Res>
    implements $ServiceTrackingParamCopyWith<$Res> {
  _$ServiceTrackingParamCopyWithImpl(this._self, this._then);

  final ServiceTrackingParam _self;
  final $Res Function(ServiceTrackingParam) _then;

/// Create a copy of ServiceTrackingParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = freezed,Object? params = freezed,}) {
  return _then(_self.copyWith(
service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as List<Param>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceTrackingParam].
extension ServiceTrackingParamPatterns on ServiceTrackingParam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceTrackingParam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceTrackingParam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceTrackingParam value)  $default,){
final _that = this;
switch (_that) {
case _ServiceTrackingParam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceTrackingParam value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceTrackingParam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? service,  List<Param>? params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceTrackingParam() when $default != null:
return $default(_that.service,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? service,  List<Param>? params)  $default,) {final _that = this;
switch (_that) {
case _ServiceTrackingParam():
return $default(_that.service,_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? service,  List<Param>? params)?  $default,) {final _that = this;
switch (_that) {
case _ServiceTrackingParam() when $default != null:
return $default(_that.service,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceTrackingParam implements ServiceTrackingParam {
  const _ServiceTrackingParam({this.service, final  List<Param>? params}): _params = params;
  factory _ServiceTrackingParam.fromJson(Map<String, dynamic> json) => _$ServiceTrackingParamFromJson(json);

@override final  String? service;
 final  List<Param>? _params;
@override List<Param>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableListView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ServiceTrackingParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceTrackingParamCopyWith<_ServiceTrackingParam> get copyWith => __$ServiceTrackingParamCopyWithImpl<_ServiceTrackingParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceTrackingParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceTrackingParam&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other._params, _params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'ServiceTrackingParam(service: $service, params: $params)';
}


}

/// @nodoc
abstract mixin class _$ServiceTrackingParamCopyWith<$Res> implements $ServiceTrackingParamCopyWith<$Res> {
  factory _$ServiceTrackingParamCopyWith(_ServiceTrackingParam value, $Res Function(_ServiceTrackingParam) _then) = __$ServiceTrackingParamCopyWithImpl;
@override @useResult
$Res call({
 String? service, List<Param>? params
});




}
/// @nodoc
class __$ServiceTrackingParamCopyWithImpl<$Res>
    implements _$ServiceTrackingParamCopyWith<$Res> {
  __$ServiceTrackingParamCopyWithImpl(this._self, this._then);

  final _ServiceTrackingParam _self;
  final $Res Function(_ServiceTrackingParam) _then;

/// Create a copy of ServiceTrackingParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = freezed,Object? params = freezed,}) {
  return _then(_ServiceTrackingParam(
service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as List<Param>?,
  ));
}


}


/// @nodoc
mixin _$Param {

 String? get key; String? get value;
/// Create a copy of Param
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParamCopyWith<Param> get copyWith => _$ParamCopyWithImpl<Param>(this as Param, _$identity);

  /// Serializes this Param to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Param&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'Param(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $ParamCopyWith<$Res>  {
  factory $ParamCopyWith(Param value, $Res Function(Param) _then) = _$ParamCopyWithImpl;
@useResult
$Res call({
 String? key, String? value
});




}
/// @nodoc
class _$ParamCopyWithImpl<$Res>
    implements $ParamCopyWith<$Res> {
  _$ParamCopyWithImpl(this._self, this._then);

  final Param _self;
  final $Res Function(Param) _then;

/// Create a copy of Param
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Param].
extension ParamPatterns on Param {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Param value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Param() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Param value)  $default,){
final _that = this;
switch (_that) {
case _Param():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Param value)?  $default,){
final _that = this;
switch (_that) {
case _Param() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? key,  String? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Param() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? key,  String? value)  $default,) {final _that = this;
switch (_that) {
case _Param():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? key,  String? value)?  $default,) {final _that = this;
switch (_that) {
case _Param() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Param implements Param {
  const _Param({this.key, this.value});
  factory _Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);

@override final  String? key;
@override final  String? value;

/// Create a copy of Param
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParamCopyWith<_Param> get copyWith => __$ParamCopyWithImpl<_Param>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Param&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'Param(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ParamCopyWith<$Res> implements $ParamCopyWith<$Res> {
  factory _$ParamCopyWith(_Param value, $Res Function(_Param) _then) = __$ParamCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? value
});




}
/// @nodoc
class __$ParamCopyWithImpl<$Res>
    implements _$ParamCopyWith<$Res> {
  __$ParamCopyWithImpl(this._self, this._then);

  final _Param _self;
  final $Res Function(_Param) _then;

/// Create a copy of Param
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? value = freezed,}) {
  return _then(_Param(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
