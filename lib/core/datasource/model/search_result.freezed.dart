// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResult {

 ResponseContext? get responseContext; List<SearchResultContent>? get contents; String? get trackingParams;
/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultCopyWith<SearchResult> get copyWith => _$SearchResultCopyWithImpl<SearchResult>(this as SearchResult, _$identity);

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResult&&(identical(other.responseContext, responseContext) || other.responseContext == responseContext)&&const DeepCollectionEquality().equals(other.contents, contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseContext,const DeepCollectionEquality().hash(contents),trackingParams);

@override
String toString() {
  return 'SearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class $SearchResultCopyWith<$Res>  {
  factory $SearchResultCopyWith(SearchResult value, $Res Function(SearchResult) _then) = _$SearchResultCopyWithImpl;
@useResult
$Res call({
 ResponseContext? responseContext, List<SearchResultContent>? contents, String? trackingParams
});


$ResponseContextCopyWith<$Res>? get responseContext;

}
/// @nodoc
class _$SearchResultCopyWithImpl<$Res>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._self, this._then);

  final SearchResult _self;
  final $Res Function(SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseContext = freezed,Object? contents = freezed,Object? trackingParams = freezed,}) {
  return _then(_self.copyWith(
responseContext: freezed == responseContext ? _self.responseContext : responseContext // ignore: cast_nullable_to_non_nullable
as ResponseContext?,contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<SearchResultContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SearchResult
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
}
}


/// Adds pattern-matching-related methods to [SearchResult].
extension SearchResultPatterns on SearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResult value)  $default,){
final _that = this;
switch (_that) {
case _SearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResponseContext? responseContext,  List<SearchResultContent>? contents,  String? trackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResponseContext? responseContext,  List<SearchResultContent>? contents,  String? trackingParams)  $default,) {final _that = this;
switch (_that) {
case _SearchResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResponseContext? responseContext,  List<SearchResultContent>? contents,  String? trackingParams)?  $default,) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.responseContext,_that.contents,_that.trackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResult implements SearchResult {
   _SearchResult({this.responseContext, final  List<SearchResultContent>? contents, this.trackingParams}): _contents = contents;
  factory _SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

@override final  ResponseContext? responseContext;
 final  List<SearchResultContent>? _contents;
@override List<SearchResultContent>? get contents {
  final value = _contents;
  if (value == null) return null;
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? trackingParams;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultCopyWith<_SearchResult> get copyWith => __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResult&&(identical(other.responseContext, responseContext) || other.responseContext == responseContext)&&const DeepCollectionEquality().equals(other._contents, _contents)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responseContext,const DeepCollectionEquality().hash(_contents),trackingParams);

@override
String toString() {
  return 'SearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
}


}

/// @nodoc
abstract mixin class _$SearchResultCopyWith<$Res> implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(_SearchResult value, $Res Function(_SearchResult) _then) = __$SearchResultCopyWithImpl;
@override @useResult
$Res call({
 ResponseContext? responseContext, List<SearchResultContent>? contents, String? trackingParams
});


@override $ResponseContextCopyWith<$Res>? get responseContext;

}
/// @nodoc
class __$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(this._self, this._then);

  final _SearchResult _self;
  final $Res Function(_SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseContext = freezed,Object? contents = freezed,Object? trackingParams = freezed,}) {
  return _then(_SearchResult(
responseContext: freezed == responseContext ? _self.responseContext : responseContext // ignore: cast_nullable_to_non_nullable
as ResponseContext?,contents: freezed == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<SearchResultContent>?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SearchResult
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
}
}


/// @nodoc
mixin _$SearchResultContent {

 SearchSuggestionsSectionRenderer? get searchSuggestionsSectionRenderer;
/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultContentCopyWith<SearchResultContent> get copyWith => _$SearchResultContentCopyWithImpl<SearchResultContent>(this as SearchResultContent, _$identity);

  /// Serializes this SearchResultContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultContent&&(identical(other.searchSuggestionsSectionRenderer, searchSuggestionsSectionRenderer) || other.searchSuggestionsSectionRenderer == searchSuggestionsSectionRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchSuggestionsSectionRenderer);

@override
String toString() {
  return 'SearchResultContent(searchSuggestionsSectionRenderer: $searchSuggestionsSectionRenderer)';
}


}

/// @nodoc
abstract mixin class $SearchResultContentCopyWith<$Res>  {
  factory $SearchResultContentCopyWith(SearchResultContent value, $Res Function(SearchResultContent) _then) = _$SearchResultContentCopyWithImpl;
@useResult
$Res call({
 SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer
});


$SearchSuggestionsSectionRendererCopyWith<$Res>? get searchSuggestionsSectionRenderer;

}
/// @nodoc
class _$SearchResultContentCopyWithImpl<$Res>
    implements $SearchResultContentCopyWith<$Res> {
  _$SearchResultContentCopyWithImpl(this._self, this._then);

  final SearchResultContent _self;
  final $Res Function(SearchResultContent) _then;

/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchSuggestionsSectionRenderer = freezed,}) {
  return _then(_self.copyWith(
searchSuggestionsSectionRenderer: freezed == searchSuggestionsSectionRenderer ? _self.searchSuggestionsSectionRenderer : searchSuggestionsSectionRenderer // ignore: cast_nullable_to_non_nullable
as SearchSuggestionsSectionRenderer?,
  ));
}
/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchSuggestionsSectionRendererCopyWith<$Res>? get searchSuggestionsSectionRenderer {
    if (_self.searchSuggestionsSectionRenderer == null) {
    return null;
  }

  return $SearchSuggestionsSectionRendererCopyWith<$Res>(_self.searchSuggestionsSectionRenderer!, (value) {
    return _then(_self.copyWith(searchSuggestionsSectionRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchResultContent].
extension SearchResultContentPatterns on SearchResultContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultContent value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultContent value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultContent() when $default != null:
return $default(_that.searchSuggestionsSectionRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer)  $default,) {final _that = this;
switch (_that) {
case _SearchResultContent():
return $default(_that.searchSuggestionsSectionRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultContent() when $default != null:
return $default(_that.searchSuggestionsSectionRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultContent implements SearchResultContent {
   _SearchResultContent({this.searchSuggestionsSectionRenderer});
  factory _SearchResultContent.fromJson(Map<String, dynamic> json) => _$SearchResultContentFromJson(json);

@override final  SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer;

/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultContentCopyWith<_SearchResultContent> get copyWith => __$SearchResultContentCopyWithImpl<_SearchResultContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultContent&&(identical(other.searchSuggestionsSectionRenderer, searchSuggestionsSectionRenderer) || other.searchSuggestionsSectionRenderer == searchSuggestionsSectionRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchSuggestionsSectionRenderer);

@override
String toString() {
  return 'SearchResultContent(searchSuggestionsSectionRenderer: $searchSuggestionsSectionRenderer)';
}


}

/// @nodoc
abstract mixin class _$SearchResultContentCopyWith<$Res> implements $SearchResultContentCopyWith<$Res> {
  factory _$SearchResultContentCopyWith(_SearchResultContent value, $Res Function(_SearchResultContent) _then) = __$SearchResultContentCopyWithImpl;
@override @useResult
$Res call({
 SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer
});


@override $SearchSuggestionsSectionRendererCopyWith<$Res>? get searchSuggestionsSectionRenderer;

}
/// @nodoc
class __$SearchResultContentCopyWithImpl<$Res>
    implements _$SearchResultContentCopyWith<$Res> {
  __$SearchResultContentCopyWithImpl(this._self, this._then);

  final _SearchResultContent _self;
  final $Res Function(_SearchResultContent) _then;

/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchSuggestionsSectionRenderer = freezed,}) {
  return _then(_SearchResultContent(
searchSuggestionsSectionRenderer: freezed == searchSuggestionsSectionRenderer ? _self.searchSuggestionsSectionRenderer : searchSuggestionsSectionRenderer // ignore: cast_nullable_to_non_nullable
as SearchSuggestionsSectionRenderer?,
  ));
}

/// Create a copy of SearchResultContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchSuggestionsSectionRendererCopyWith<$Res>? get searchSuggestionsSectionRenderer {
    if (_self.searchSuggestionsSectionRenderer == null) {
    return null;
  }

  return $SearchSuggestionsSectionRendererCopyWith<$Res>(_self.searchSuggestionsSectionRenderer!, (value) {
    return _then(_self.copyWith(searchSuggestionsSectionRenderer: value));
  });
}
}


/// @nodoc
mixin _$SearchSuggestionsSectionRenderer {

 List<SearchSuggestionsSectionRendererContent>? get contents;
/// Create a copy of SearchSuggestionsSectionRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuggestionsSectionRendererCopyWith<SearchSuggestionsSectionRenderer> get copyWith => _$SearchSuggestionsSectionRendererCopyWithImpl<SearchSuggestionsSectionRenderer>(this as SearchSuggestionsSectionRenderer, _$identity);

  /// Serializes this SearchSuggestionsSectionRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuggestionsSectionRenderer&&const DeepCollectionEquality().equals(other.contents, contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contents));

@override
String toString() {
  return 'SearchSuggestionsSectionRenderer(contents: $contents)';
}


}

/// @nodoc
abstract mixin class $SearchSuggestionsSectionRendererCopyWith<$Res>  {
  factory $SearchSuggestionsSectionRendererCopyWith(SearchSuggestionsSectionRenderer value, $Res Function(SearchSuggestionsSectionRenderer) _then) = _$SearchSuggestionsSectionRendererCopyWithImpl;
@useResult
$Res call({
 List<SearchSuggestionsSectionRendererContent>? contents
});




}
/// @nodoc
class _$SearchSuggestionsSectionRendererCopyWithImpl<$Res>
    implements $SearchSuggestionsSectionRendererCopyWith<$Res> {
  _$SearchSuggestionsSectionRendererCopyWithImpl(this._self, this._then);

  final SearchSuggestionsSectionRenderer _self;
  final $Res Function(SearchSuggestionsSectionRenderer) _then;

/// Create a copy of SearchSuggestionsSectionRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = freezed,}) {
  return _then(_self.copyWith(
contents: freezed == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<SearchSuggestionsSectionRendererContent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSuggestionsSectionRenderer].
extension SearchSuggestionsSectionRendererPatterns on SearchSuggestionsSectionRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSuggestionsSectionRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSuggestionsSectionRenderer value)  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSuggestionsSectionRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchSuggestionsSectionRendererContent>? contents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer() when $default != null:
return $default(_that.contents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchSuggestionsSectionRendererContent>? contents)  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer():
return $default(_that.contents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchSuggestionsSectionRendererContent>? contents)?  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRenderer() when $default != null:
return $default(_that.contents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSuggestionsSectionRenderer implements SearchSuggestionsSectionRenderer {
   _SearchSuggestionsSectionRenderer({final  List<SearchSuggestionsSectionRendererContent>? contents}): _contents = contents;
  factory _SearchSuggestionsSectionRenderer.fromJson(Map<String, dynamic> json) => _$SearchSuggestionsSectionRendererFromJson(json);

 final  List<SearchSuggestionsSectionRendererContent>? _contents;
@override List<SearchSuggestionsSectionRendererContent>? get contents {
  final value = _contents;
  if (value == null) return null;
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SearchSuggestionsSectionRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSuggestionsSectionRendererCopyWith<_SearchSuggestionsSectionRenderer> get copyWith => __$SearchSuggestionsSectionRendererCopyWithImpl<_SearchSuggestionsSectionRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSuggestionsSectionRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSuggestionsSectionRenderer&&const DeepCollectionEquality().equals(other._contents, _contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents));

@override
String toString() {
  return 'SearchSuggestionsSectionRenderer(contents: $contents)';
}


}

/// @nodoc
abstract mixin class _$SearchSuggestionsSectionRendererCopyWith<$Res> implements $SearchSuggestionsSectionRendererCopyWith<$Res> {
  factory _$SearchSuggestionsSectionRendererCopyWith(_SearchSuggestionsSectionRenderer value, $Res Function(_SearchSuggestionsSectionRenderer) _then) = __$SearchSuggestionsSectionRendererCopyWithImpl;
@override @useResult
$Res call({
 List<SearchSuggestionsSectionRendererContent>? contents
});




}
/// @nodoc
class __$SearchSuggestionsSectionRendererCopyWithImpl<$Res>
    implements _$SearchSuggestionsSectionRendererCopyWith<$Res> {
  __$SearchSuggestionsSectionRendererCopyWithImpl(this._self, this._then);

  final _SearchSuggestionsSectionRenderer _self;
  final $Res Function(_SearchSuggestionsSectionRenderer) _then;

/// Create a copy of SearchSuggestionsSectionRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = freezed,}) {
  return _then(_SearchSuggestionsSectionRenderer(
contents: freezed == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<SearchSuggestionsSectionRendererContent>?,
  ));
}


}


/// @nodoc
mixin _$SearchSuggestionsSectionRendererContent {

 SearchSuggestionRenderer? get searchSuggestionRenderer;
/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuggestionsSectionRendererContentCopyWith<SearchSuggestionsSectionRendererContent> get copyWith => _$SearchSuggestionsSectionRendererContentCopyWithImpl<SearchSuggestionsSectionRendererContent>(this as SearchSuggestionsSectionRendererContent, _$identity);

  /// Serializes this SearchSuggestionsSectionRendererContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuggestionsSectionRendererContent&&(identical(other.searchSuggestionRenderer, searchSuggestionRenderer) || other.searchSuggestionRenderer == searchSuggestionRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchSuggestionRenderer);

@override
String toString() {
  return 'SearchSuggestionsSectionRendererContent(searchSuggestionRenderer: $searchSuggestionRenderer)';
}


}

/// @nodoc
abstract mixin class $SearchSuggestionsSectionRendererContentCopyWith<$Res>  {
  factory $SearchSuggestionsSectionRendererContentCopyWith(SearchSuggestionsSectionRendererContent value, $Res Function(SearchSuggestionsSectionRendererContent) _then) = _$SearchSuggestionsSectionRendererContentCopyWithImpl;
@useResult
$Res call({
 SearchSuggestionRenderer? searchSuggestionRenderer
});


$SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer;

}
/// @nodoc
class _$SearchSuggestionsSectionRendererContentCopyWithImpl<$Res>
    implements $SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  _$SearchSuggestionsSectionRendererContentCopyWithImpl(this._self, this._then);

  final SearchSuggestionsSectionRendererContent _self;
  final $Res Function(SearchSuggestionsSectionRendererContent) _then;

/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchSuggestionRenderer = freezed,}) {
  return _then(_self.copyWith(
searchSuggestionRenderer: freezed == searchSuggestionRenderer ? _self.searchSuggestionRenderer : searchSuggestionRenderer // ignore: cast_nullable_to_non_nullable
as SearchSuggestionRenderer?,
  ));
}
/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer {
    if (_self.searchSuggestionRenderer == null) {
    return null;
  }

  return $SearchSuggestionRendererCopyWith<$Res>(_self.searchSuggestionRenderer!, (value) {
    return _then(_self.copyWith(searchSuggestionRenderer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchSuggestionsSectionRendererContent].
extension SearchSuggestionsSectionRendererContentPatterns on SearchSuggestionsSectionRendererContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSuggestionsSectionRendererContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSuggestionsSectionRendererContent value)  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSuggestionsSectionRendererContent value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchSuggestionRenderer? searchSuggestionRenderer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent() when $default != null:
return $default(_that.searchSuggestionRenderer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchSuggestionRenderer? searchSuggestionRenderer)  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent():
return $default(_that.searchSuggestionRenderer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchSuggestionRenderer? searchSuggestionRenderer)?  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionsSectionRendererContent() when $default != null:
return $default(_that.searchSuggestionRenderer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSuggestionsSectionRendererContent implements SearchSuggestionsSectionRendererContent {
   _SearchSuggestionsSectionRendererContent({this.searchSuggestionRenderer});
  factory _SearchSuggestionsSectionRendererContent.fromJson(Map<String, dynamic> json) => _$SearchSuggestionsSectionRendererContentFromJson(json);

@override final  SearchSuggestionRenderer? searchSuggestionRenderer;

/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSuggestionsSectionRendererContentCopyWith<_SearchSuggestionsSectionRendererContent> get copyWith => __$SearchSuggestionsSectionRendererContentCopyWithImpl<_SearchSuggestionsSectionRendererContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSuggestionsSectionRendererContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSuggestionsSectionRendererContent&&(identical(other.searchSuggestionRenderer, searchSuggestionRenderer) || other.searchSuggestionRenderer == searchSuggestionRenderer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchSuggestionRenderer);

@override
String toString() {
  return 'SearchSuggestionsSectionRendererContent(searchSuggestionRenderer: $searchSuggestionRenderer)';
}


}

/// @nodoc
abstract mixin class _$SearchSuggestionsSectionRendererContentCopyWith<$Res> implements $SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  factory _$SearchSuggestionsSectionRendererContentCopyWith(_SearchSuggestionsSectionRendererContent value, $Res Function(_SearchSuggestionsSectionRendererContent) _then) = __$SearchSuggestionsSectionRendererContentCopyWithImpl;
@override @useResult
$Res call({
 SearchSuggestionRenderer? searchSuggestionRenderer
});


@override $SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer;

}
/// @nodoc
class __$SearchSuggestionsSectionRendererContentCopyWithImpl<$Res>
    implements _$SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  __$SearchSuggestionsSectionRendererContentCopyWithImpl(this._self, this._then);

  final _SearchSuggestionsSectionRendererContent _self;
  final $Res Function(_SearchSuggestionsSectionRendererContent) _then;

/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchSuggestionRenderer = freezed,}) {
  return _then(_SearchSuggestionsSectionRendererContent(
searchSuggestionRenderer: freezed == searchSuggestionRenderer ? _self.searchSuggestionRenderer : searchSuggestionRenderer // ignore: cast_nullable_to_non_nullable
as SearchSuggestionRenderer?,
  ));
}

/// Create a copy of SearchSuggestionsSectionRendererContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer {
    if (_self.searchSuggestionRenderer == null) {
    return null;
  }

  return $SearchSuggestionRendererCopyWith<$Res>(_self.searchSuggestionRenderer!, (value) {
    return _then(_self.copyWith(searchSuggestionRenderer: value));
  });
}
}


/// @nodoc
mixin _$SearchSuggestionRenderer {

 Suggestion? get suggestion; NavigationEndpoint? get navigationEndpoint; String? get trackingParams; Iconn? get icon;
/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuggestionRendererCopyWith<SearchSuggestionRenderer> get copyWith => _$SearchSuggestionRendererCopyWithImpl<SearchSuggestionRenderer>(this as SearchSuggestionRenderer, _$identity);

  /// Serializes this SearchSuggestionRenderer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuggestionRenderer&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestion,navigationEndpoint,trackingParams,icon);

@override
String toString() {
  return 'SearchSuggestionRenderer(suggestion: $suggestion, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SearchSuggestionRendererCopyWith<$Res>  {
  factory $SearchSuggestionRendererCopyWith(SearchSuggestionRenderer value, $Res Function(SearchSuggestionRenderer) _then) = _$SearchSuggestionRendererCopyWithImpl;
@useResult
$Res call({
 Suggestion? suggestion, NavigationEndpoint? navigationEndpoint, String? trackingParams, Iconn? icon
});


$SuggestionCopyWith<$Res>? get suggestion;$NavigationEndpointCopyWith<$Res>? get navigationEndpoint;$IconnCopyWith<$Res>? get icon;

}
/// @nodoc
class _$SearchSuggestionRendererCopyWithImpl<$Res>
    implements $SearchSuggestionRendererCopyWith<$Res> {
  _$SearchSuggestionRendererCopyWithImpl(this._self, this._then);

  final SearchSuggestionRenderer _self;
  final $Res Function(SearchSuggestionRenderer) _then;

/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestion = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as Suggestion?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as NavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Iconn?,
  ));
}
/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SuggestionCopyWith<$Res>? get suggestion {
    if (_self.suggestion == null) {
    return null;
  }

  return $SuggestionCopyWith<$Res>(_self.suggestion!, (value) {
    return _then(_self.copyWith(suggestion: value));
  });
}/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $NavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconnCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconnCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchSuggestionRenderer].
extension SearchSuggestionRendererPatterns on SearchSuggestionRenderer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSuggestionRenderer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSuggestionRenderer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSuggestionRenderer value)  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionRenderer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSuggestionRenderer value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSuggestionRenderer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Suggestion? suggestion,  NavigationEndpoint? navigationEndpoint,  String? trackingParams,  Iconn? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSuggestionRenderer() when $default != null:
return $default(_that.suggestion,_that.navigationEndpoint,_that.trackingParams,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Suggestion? suggestion,  NavigationEndpoint? navigationEndpoint,  String? trackingParams,  Iconn? icon)  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionRenderer():
return $default(_that.suggestion,_that.navigationEndpoint,_that.trackingParams,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Suggestion? suggestion,  NavigationEndpoint? navigationEndpoint,  String? trackingParams,  Iconn? icon)?  $default,) {final _that = this;
switch (_that) {
case _SearchSuggestionRenderer() when $default != null:
return $default(_that.suggestion,_that.navigationEndpoint,_that.trackingParams,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSuggestionRenderer implements SearchSuggestionRenderer {
   _SearchSuggestionRenderer({this.suggestion, this.navigationEndpoint, this.trackingParams, this.icon});
  factory _SearchSuggestionRenderer.fromJson(Map<String, dynamic> json) => _$SearchSuggestionRendererFromJson(json);

@override final  Suggestion? suggestion;
@override final  NavigationEndpoint? navigationEndpoint;
@override final  String? trackingParams;
@override final  Iconn? icon;

/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSuggestionRendererCopyWith<_SearchSuggestionRenderer> get copyWith => __$SearchSuggestionRendererCopyWithImpl<_SearchSuggestionRenderer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSuggestionRendererToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSuggestionRenderer&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&(identical(other.navigationEndpoint, navigationEndpoint) || other.navigationEndpoint == navigationEndpoint)&&(identical(other.trackingParams, trackingParams) || other.trackingParams == trackingParams)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestion,navigationEndpoint,trackingParams,icon);

@override
String toString() {
  return 'SearchSuggestionRenderer(suggestion: $suggestion, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SearchSuggestionRendererCopyWith<$Res> implements $SearchSuggestionRendererCopyWith<$Res> {
  factory _$SearchSuggestionRendererCopyWith(_SearchSuggestionRenderer value, $Res Function(_SearchSuggestionRenderer) _then) = __$SearchSuggestionRendererCopyWithImpl;
@override @useResult
$Res call({
 Suggestion? suggestion, NavigationEndpoint? navigationEndpoint, String? trackingParams, Iconn? icon
});


@override $SuggestionCopyWith<$Res>? get suggestion;@override $NavigationEndpointCopyWith<$Res>? get navigationEndpoint;@override $IconnCopyWith<$Res>? get icon;

}
/// @nodoc
class __$SearchSuggestionRendererCopyWithImpl<$Res>
    implements _$SearchSuggestionRendererCopyWith<$Res> {
  __$SearchSuggestionRendererCopyWithImpl(this._self, this._then);

  final _SearchSuggestionRenderer _self;
  final $Res Function(_SearchSuggestionRenderer) _then;

/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestion = freezed,Object? navigationEndpoint = freezed,Object? trackingParams = freezed,Object? icon = freezed,}) {
  return _then(_SearchSuggestionRenderer(
suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as Suggestion?,navigationEndpoint: freezed == navigationEndpoint ? _self.navigationEndpoint : navigationEndpoint // ignore: cast_nullable_to_non_nullable
as NavigationEndpoint?,trackingParams: freezed == trackingParams ? _self.trackingParams : trackingParams // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Iconn?,
  ));
}

/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SuggestionCopyWith<$Res>? get suggestion {
    if (_self.suggestion == null) {
    return null;
  }

  return $SuggestionCopyWith<$Res>(_self.suggestion!, (value) {
    return _then(_self.copyWith(suggestion: value));
  });
}/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_self.navigationEndpoint == null) {
    return null;
  }

  return $NavigationEndpointCopyWith<$Res>(_self.navigationEndpoint!, (value) {
    return _then(_self.copyWith(navigationEndpoint: value));
  });
}/// Create a copy of SearchSuggestionRenderer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconnCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $IconnCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}


/// @nodoc
mixin _$Suggestion {

 List<Run>? get runs;
/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionCopyWith<Suggestion> get copyWith => _$SuggestionCopyWithImpl<Suggestion>(this as Suggestion, _$identity);

  /// Serializes this Suggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Suggestion&&const DeepCollectionEquality().equals(other.runs, runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(runs));

@override
String toString() {
  return 'Suggestion(runs: $runs)';
}


}

/// @nodoc
abstract mixin class $SuggestionCopyWith<$Res>  {
  factory $SuggestionCopyWith(Suggestion value, $Res Function(Suggestion) _then) = _$SuggestionCopyWithImpl;
@useResult
$Res call({
 List<Run>? runs
});




}
/// @nodoc
class _$SuggestionCopyWithImpl<$Res>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._self, this._then);

  final Suggestion _self;
  final $Res Function(Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? runs = freezed,}) {
  return _then(_self.copyWith(
runs: freezed == runs ? _self.runs : runs // ignore: cast_nullable_to_non_nullable
as List<Run>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Suggestion].
extension SuggestionPatterns on Suggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Suggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Suggestion value)  $default,){
final _that = this;
switch (_that) {
case _Suggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Suggestion value)?  $default,){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Run>? runs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Run>? runs)  $default,) {final _that = this;
switch (_that) {
case _Suggestion():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Run>? runs)?  $default,) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.runs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Suggestion implements Suggestion {
   _Suggestion({final  List<Run>? runs}): _runs = runs;
  factory _Suggestion.fromJson(Map<String, dynamic> json) => _$SuggestionFromJson(json);

 final  List<Run>? _runs;
@override List<Run>? get runs {
  final value = _runs;
  if (value == null) return null;
  if (_runs is EqualUnmodifiableListView) return _runs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionCopyWith<_Suggestion> get copyWith => __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suggestion&&const DeepCollectionEquality().equals(other._runs, _runs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_runs));

@override
String toString() {
  return 'Suggestion(runs: $runs)';
}


}

/// @nodoc
abstract mixin class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(_Suggestion value, $Res Function(_Suggestion) _then) = __$SuggestionCopyWithImpl;
@override @useResult
$Res call({
 List<Run>? runs
});




}
/// @nodoc
class __$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(this._self, this._then);

  final _Suggestion _self;
  final $Res Function(_Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? runs = freezed,}) {
  return _then(_Suggestion(
runs: freezed == runs ? _self._runs : runs // ignore: cast_nullable_to_non_nullable
as List<Run>?,
  ));
}


}


/// @nodoc
mixin _$Run {

 String? get text; bool? get bold;
/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunCopyWith<Run> get copyWith => _$RunCopyWithImpl<Run>(this as Run, _$identity);

  /// Serializes this Run to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Run&&(identical(other.text, text) || other.text == text)&&(identical(other.bold, bold) || other.bold == bold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,bold);

@override
String toString() {
  return 'Run(text: $text, bold: $bold)';
}


}

/// @nodoc
abstract mixin class $RunCopyWith<$Res>  {
  factory $RunCopyWith(Run value, $Res Function(Run) _then) = _$RunCopyWithImpl;
@useResult
$Res call({
 String? text, bool? bold
});




}
/// @nodoc
class _$RunCopyWithImpl<$Res>
    implements $RunCopyWith<$Res> {
  _$RunCopyWithImpl(this._self, this._then);

  final Run _self;
  final $Res Function(Run) _then;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? bold = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,bold: freezed == bold ? _self.bold : bold // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Run].
extension RunPatterns on Run {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Run value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Run() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Run value)  $default,){
final _that = this;
switch (_that) {
case _Run():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Run value)?  $default,){
final _that = this;
switch (_that) {
case _Run() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  bool? bold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Run() when $default != null:
return $default(_that.text,_that.bold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  bool? bold)  $default,) {final _that = this;
switch (_that) {
case _Run():
return $default(_that.text,_that.bold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  bool? bold)?  $default,) {final _that = this;
switch (_that) {
case _Run() when $default != null:
return $default(_that.text,_that.bold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Run implements Run {
   _Run({this.text, this.bold});
  factory _Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);

@override final  String? text;
@override final  bool? bold;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunCopyWith<_Run> get copyWith => __$RunCopyWithImpl<_Run>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Run&&(identical(other.text, text) || other.text == text)&&(identical(other.bold, bold) || other.bold == bold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,bold);

@override
String toString() {
  return 'Run(text: $text, bold: $bold)';
}


}

/// @nodoc
abstract mixin class _$RunCopyWith<$Res> implements $RunCopyWith<$Res> {
  factory _$RunCopyWith(_Run value, $Res Function(_Run) _then) = __$RunCopyWithImpl;
@override @useResult
$Res call({
 String? text, bool? bold
});




}
/// @nodoc
class __$RunCopyWithImpl<$Res>
    implements _$RunCopyWith<$Res> {
  __$RunCopyWithImpl(this._self, this._then);

  final _Run _self;
  final $Res Function(_Run) _then;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? bold = freezed,}) {
  return _then(_Run(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,bold: freezed == bold ? _self.bold : bold // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$NavigationEndpoint {

 String? get clickTrackingParams; SearchEndpoint? get searchEndpoint;
/// Create a copy of NavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationEndpointCopyWith<NavigationEndpoint> get copyWith => _$NavigationEndpointCopyWithImpl<NavigationEndpoint>(this as NavigationEndpoint, _$identity);

  /// Serializes this NavigationEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.searchEndpoint, searchEndpoint) || other.searchEndpoint == searchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,searchEndpoint);

@override
String toString() {
  return 'NavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
}


}

/// @nodoc
abstract mixin class $NavigationEndpointCopyWith<$Res>  {
  factory $NavigationEndpointCopyWith(NavigationEndpoint value, $Res Function(NavigationEndpoint) _then) = _$NavigationEndpointCopyWithImpl;
@useResult
$Res call({
 String? clickTrackingParams, SearchEndpoint? searchEndpoint
});


$SearchEndpointCopyWith<$Res>? get searchEndpoint;

}
/// @nodoc
class _$NavigationEndpointCopyWithImpl<$Res>
    implements $NavigationEndpointCopyWith<$Res> {
  _$NavigationEndpointCopyWithImpl(this._self, this._then);

  final NavigationEndpoint _self;
  final $Res Function(NavigationEndpoint) _then;

/// Create a copy of NavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clickTrackingParams = freezed,Object? searchEndpoint = freezed,}) {
  return _then(_self.copyWith(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,searchEndpoint: freezed == searchEndpoint ? _self.searchEndpoint : searchEndpoint // ignore: cast_nullable_to_non_nullable
as SearchEndpoint?,
  ));
}
/// Create a copy of NavigationEndpoint
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


/// Adds pattern-matching-related methods to [NavigationEndpoint].
extension NavigationEndpointPatterns on NavigationEndpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationEndpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationEndpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationEndpoint value)  $default,){
final _that = this;
switch (_that) {
case _NavigationEndpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationEndpoint value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationEndpoint() when $default != null:
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
case _NavigationEndpoint() when $default != null:
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
case _NavigationEndpoint():
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
case _NavigationEndpoint() when $default != null:
return $default(_that.clickTrackingParams,_that.searchEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationEndpoint implements NavigationEndpoint {
   _NavigationEndpoint({this.clickTrackingParams, this.searchEndpoint});
  factory _NavigationEndpoint.fromJson(Map<String, dynamic> json) => _$NavigationEndpointFromJson(json);

@override final  String? clickTrackingParams;
@override final  SearchEndpoint? searchEndpoint;

/// Create a copy of NavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationEndpointCopyWith<_NavigationEndpoint> get copyWith => __$NavigationEndpointCopyWithImpl<_NavigationEndpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationEndpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationEndpoint&&(identical(other.clickTrackingParams, clickTrackingParams) || other.clickTrackingParams == clickTrackingParams)&&(identical(other.searchEndpoint, searchEndpoint) || other.searchEndpoint == searchEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clickTrackingParams,searchEndpoint);

@override
String toString() {
  return 'NavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
}


}

/// @nodoc
abstract mixin class _$NavigationEndpointCopyWith<$Res> implements $NavigationEndpointCopyWith<$Res> {
  factory _$NavigationEndpointCopyWith(_NavigationEndpoint value, $Res Function(_NavigationEndpoint) _then) = __$NavigationEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? clickTrackingParams, SearchEndpoint? searchEndpoint
});


@override $SearchEndpointCopyWith<$Res>? get searchEndpoint;

}
/// @nodoc
class __$NavigationEndpointCopyWithImpl<$Res>
    implements _$NavigationEndpointCopyWith<$Res> {
  __$NavigationEndpointCopyWithImpl(this._self, this._then);

  final _NavigationEndpoint _self;
  final $Res Function(_NavigationEndpoint) _then;

/// Create a copy of NavigationEndpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clickTrackingParams = freezed,Object? searchEndpoint = freezed,}) {
  return _then(_NavigationEndpoint(
clickTrackingParams: freezed == clickTrackingParams ? _self.clickTrackingParams : clickTrackingParams // ignore: cast_nullable_to_non_nullable
as String?,searchEndpoint: freezed == searchEndpoint ? _self.searchEndpoint : searchEndpoint // ignore: cast_nullable_to_non_nullable
as SearchEndpoint?,
  ));
}

/// Create a copy of NavigationEndpoint
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

 String? get query;
/// Create a copy of SearchEndpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEndpointCopyWith<SearchEndpoint> get copyWith => _$SearchEndpointCopyWithImpl<SearchEndpoint>(this as SearchEndpoint, _$identity);

  /// Serializes this SearchEndpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEndpoint&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEndpoint(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchEndpointCopyWith<$Res>  {
  factory $SearchEndpointCopyWith(SearchEndpoint value, $Res Function(SearchEndpoint) _then) = _$SearchEndpointCopyWithImpl;
@useResult
$Res call({
 String? query
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
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
return $default(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query)  $default,) {final _that = this;
switch (_that) {
case _SearchEndpoint():
return $default(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query)?  $default,) {final _that = this;
switch (_that) {
case _SearchEndpoint() when $default != null:
return $default(_that.query);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchEndpoint implements SearchEndpoint {
   _SearchEndpoint({this.query});
  factory _SearchEndpoint.fromJson(Map<String, dynamic> json) => _$SearchEndpointFromJson(json);

@override final  String? query;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchEndpoint&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEndpoint(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchEndpointCopyWith<$Res> implements $SearchEndpointCopyWith<$Res> {
  factory _$SearchEndpointCopyWith(_SearchEndpoint value, $Res Function(_SearchEndpoint) _then) = __$SearchEndpointCopyWithImpl;
@override @useResult
$Res call({
 String? query
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
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,}) {
  return _then(_SearchEndpoint(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Iconn {

 String? get iconType;
/// Create a copy of Iconn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconnCopyWith<Iconn> get copyWith => _$IconnCopyWithImpl<Iconn>(this as Iconn, _$identity);

  /// Serializes this Iconn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Iconn&&(identical(other.iconType, iconType) || other.iconType == iconType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iconType);

@override
String toString() {
  return 'Iconn(iconType: $iconType)';
}


}

/// @nodoc
abstract mixin class $IconnCopyWith<$Res>  {
  factory $IconnCopyWith(Iconn value, $Res Function(Iconn) _then) = _$IconnCopyWithImpl;
@useResult
$Res call({
 String? iconType
});




}
/// @nodoc
class _$IconnCopyWithImpl<$Res>
    implements $IconnCopyWith<$Res> {
  _$IconnCopyWithImpl(this._self, this._then);

  final Iconn _self;
  final $Res Function(Iconn) _then;

/// Create a copy of Iconn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iconType = freezed,}) {
  return _then(_self.copyWith(
iconType: freezed == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Iconn].
extension IconnPatterns on Iconn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Iconn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Iconn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Iconn value)  $default,){
final _that = this;
switch (_that) {
case _Iconn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Iconn value)?  $default,){
final _that = this;
switch (_that) {
case _Iconn() when $default != null:
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
case _Iconn() when $default != null:
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
case _Iconn():
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
case _Iconn() when $default != null:
return $default(_that.iconType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Iconn implements Iconn {
   _Iconn({this.iconType});
  factory _Iconn.fromJson(Map<String, dynamic> json) => _$IconnFromJson(json);

@override final  String? iconType;

/// Create a copy of Iconn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconnCopyWith<_Iconn> get copyWith => __$IconnCopyWithImpl<_Iconn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IconnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Iconn&&(identical(other.iconType, iconType) || other.iconType == iconType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iconType);

@override
String toString() {
  return 'Iconn(iconType: $iconType)';
}


}

/// @nodoc
abstract mixin class _$IconnCopyWith<$Res> implements $IconnCopyWith<$Res> {
  factory _$IconnCopyWith(_Iconn value, $Res Function(_Iconn) _then) = __$IconnCopyWithImpl;
@override @useResult
$Res call({
 String? iconType
});




}
/// @nodoc
class __$IconnCopyWithImpl<$Res>
    implements _$IconnCopyWith<$Res> {
  __$IconnCopyWithImpl(this._self, this._then);

  final _Iconn _self;
  final $Res Function(_Iconn) _then;

/// Create a copy of Iconn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iconType = freezed,}) {
  return _then(_Iconn(
iconType: freezed == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ResponseContext {

 String? get visitorData; List<ServiceTrackingParam>? get serviceTrackingParams;
/// Create a copy of ResponseContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseContextCopyWith<ResponseContext> get copyWith => _$ResponseContextCopyWithImpl<ResponseContext>(this as ResponseContext, _$identity);

  /// Serializes this ResponseContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseContext&&(identical(other.visitorData, visitorData) || other.visitorData == visitorData)&&const DeepCollectionEquality().equals(other.serviceTrackingParams, serviceTrackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitorData,const DeepCollectionEquality().hash(serviceTrackingParams));

@override
String toString() {
  return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams)';
}


}

/// @nodoc
abstract mixin class $ResponseContextCopyWith<$Res>  {
  factory $ResponseContextCopyWith(ResponseContext value, $Res Function(ResponseContext) _then) = _$ResponseContextCopyWithImpl;
@useResult
$Res call({
 String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams
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
@pragma('vm:prefer-inline') @override $Res call({Object? visitorData = freezed,Object? serviceTrackingParams = freezed,}) {
  return _then(_self.copyWith(
visitorData: freezed == visitorData ? _self.visitorData : visitorData // ignore: cast_nullable_to_non_nullable
as String?,serviceTrackingParams: freezed == serviceTrackingParams ? _self.serviceTrackingParams : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
as List<ServiceTrackingParam>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
return $default(_that.visitorData,_that.serviceTrackingParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams)  $default,) {final _that = this;
switch (_that) {
case _ResponseContext():
return $default(_that.visitorData,_that.serviceTrackingParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? visitorData,  List<ServiceTrackingParam>? serviceTrackingParams)?  $default,) {final _that = this;
switch (_that) {
case _ResponseContext() when $default != null:
return $default(_that.visitorData,_that.serviceTrackingParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseContext implements ResponseContext {
   _ResponseContext({this.visitorData, final  List<ServiceTrackingParam>? serviceTrackingParams}): _serviceTrackingParams = serviceTrackingParams;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseContext&&(identical(other.visitorData, visitorData) || other.visitorData == visitorData)&&const DeepCollectionEquality().equals(other._serviceTrackingParams, _serviceTrackingParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitorData,const DeepCollectionEquality().hash(_serviceTrackingParams));

@override
String toString() {
  return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams)';
}


}

/// @nodoc
abstract mixin class _$ResponseContextCopyWith<$Res> implements $ResponseContextCopyWith<$Res> {
  factory _$ResponseContextCopyWith(_ResponseContext value, $Res Function(_ResponseContext) _then) = __$ResponseContextCopyWithImpl;
@override @useResult
$Res call({
 String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams
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
@override @pragma('vm:prefer-inline') $Res call({Object? visitorData = freezed,Object? serviceTrackingParams = freezed,}) {
  return _then(_ResponseContext(
visitorData: freezed == visitorData ? _self.visitorData : visitorData // ignore: cast_nullable_to_non_nullable
as String?,serviceTrackingParams: freezed == serviceTrackingParams ? _self._serviceTrackingParams : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
as List<ServiceTrackingParam>?,
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
   _ServiceTrackingParam({this.service, final  List<Param>? params}): _params = params;
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
   _Param({this.key, this.value});
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
