// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  ResponseContext? get responseContext => throw _privateConstructorUsedError;
  List<SearchResultContent>? get contents => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {ResponseContext? responseContext,
      List<SearchResultContent>? contents,
      String? trackingParams});

  $ResponseContextCopyWith<$Res>? get responseContext;
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseContext = freezed,
    Object? contents = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      responseContext: freezed == responseContext
          ? _value.responseContext
          : responseContext // ignore: cast_nullable_to_non_nullable
              as ResponseContext?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SearchResultContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseContextCopyWith<$Res>? get responseContext {
    if (_value.responseContext == null) {
      return null;
    }

    return $ResponseContextCopyWith<$Res>(_value.responseContext!, (value) {
      return _then(_value.copyWith(responseContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseContext? responseContext,
      List<SearchResultContent>? contents,
      String? trackingParams});

  @override
  $ResponseContextCopyWith<$Res>? get responseContext;
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseContext = freezed,
    Object? contents = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$SearchResultImpl(
      responseContext: freezed == responseContext
          ? _value.responseContext
          : responseContext // ignore: cast_nullable_to_non_nullable
              as ResponseContext?,
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SearchResultContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  _$SearchResultImpl(
      {this.responseContext,
      final List<SearchResultContent>? contents,
      this.trackingParams})
      : _contents = contents;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  @override
  final ResponseContext? responseContext;
  final List<SearchResultContent>? _contents;
  @override
  List<SearchResultContent>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'SearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.responseContext, responseContext) ||
                other.responseContext == responseContext) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseContext,
      const DeepCollectionEquality().hash(_contents), trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(
      this,
    );
  }
}

abstract class _SearchResult implements SearchResult {
  factory _SearchResult(
      {final ResponseContext? responseContext,
      final List<SearchResultContent>? contents,
      final String? trackingParams}) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  ResponseContext? get responseContext;
  @override
  List<SearchResultContent>? get contents;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResultContent _$SearchResultContentFromJson(Map<String, dynamic> json) {
  return _SearchResultContent.fromJson(json);
}

/// @nodoc
mixin _$SearchResultContent {
  SearchSuggestionsSectionRenderer? get searchSuggestionsSectionRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultContentCopyWith<SearchResultContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultContentCopyWith<$Res> {
  factory $SearchResultContentCopyWith(
          SearchResultContent value, $Res Function(SearchResultContent) then) =
      _$SearchResultContentCopyWithImpl<$Res, SearchResultContent>;
  @useResult
  $Res call(
      {SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer});

  $SearchSuggestionsSectionRendererCopyWith<$Res>?
      get searchSuggestionsSectionRenderer;
}

/// @nodoc
class _$SearchResultContentCopyWithImpl<$Res, $Val extends SearchResultContent>
    implements $SearchResultContentCopyWith<$Res> {
  _$SearchResultContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSuggestionsSectionRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      searchSuggestionsSectionRenderer: freezed ==
              searchSuggestionsSectionRenderer
          ? _value.searchSuggestionsSectionRenderer
          : searchSuggestionsSectionRenderer // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionsSectionRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchSuggestionsSectionRendererCopyWith<$Res>?
      get searchSuggestionsSectionRenderer {
    if (_value.searchSuggestionsSectionRenderer == null) {
      return null;
    }

    return $SearchSuggestionsSectionRendererCopyWith<$Res>(
        _value.searchSuggestionsSectionRenderer!, (value) {
      return _then(
          _value.copyWith(searchSuggestionsSectionRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultContentImplCopyWith<$Res>
    implements $SearchResultContentCopyWith<$Res> {
  factory _$$SearchResultContentImplCopyWith(_$SearchResultContentImpl value,
          $Res Function(_$SearchResultContentImpl) then) =
      __$$SearchResultContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer});

  @override
  $SearchSuggestionsSectionRendererCopyWith<$Res>?
      get searchSuggestionsSectionRenderer;
}

/// @nodoc
class __$$SearchResultContentImplCopyWithImpl<$Res>
    extends _$SearchResultContentCopyWithImpl<$Res, _$SearchResultContentImpl>
    implements _$$SearchResultContentImplCopyWith<$Res> {
  __$$SearchResultContentImplCopyWithImpl(_$SearchResultContentImpl _value,
      $Res Function(_$SearchResultContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSuggestionsSectionRenderer = freezed,
  }) {
    return _then(_$SearchResultContentImpl(
      searchSuggestionsSectionRenderer: freezed ==
              searchSuggestionsSectionRenderer
          ? _value.searchSuggestionsSectionRenderer
          : searchSuggestionsSectionRenderer // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionsSectionRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultContentImpl implements _SearchResultContent {
  _$SearchResultContentImpl({this.searchSuggestionsSectionRenderer});

  factory _$SearchResultContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultContentImplFromJson(json);

  @override
  final SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer;

  @override
  String toString() {
    return 'SearchResultContent(searchSuggestionsSectionRenderer: $searchSuggestionsSectionRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultContentImpl &&
            (identical(other.searchSuggestionsSectionRenderer,
                    searchSuggestionsSectionRenderer) ||
                other.searchSuggestionsSectionRenderer ==
                    searchSuggestionsSectionRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, searchSuggestionsSectionRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultContentImplCopyWith<_$SearchResultContentImpl> get copyWith =>
      __$$SearchResultContentImplCopyWithImpl<_$SearchResultContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultContentImplToJson(
      this,
    );
  }
}

abstract class _SearchResultContent implements SearchResultContent {
  factory _SearchResultContent(
      {final SearchSuggestionsSectionRenderer?
          searchSuggestionsSectionRenderer}) = _$SearchResultContentImpl;

  factory _SearchResultContent.fromJson(Map<String, dynamic> json) =
      _$SearchResultContentImpl.fromJson;

  @override
  SearchSuggestionsSectionRenderer? get searchSuggestionsSectionRenderer;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultContentImplCopyWith<_$SearchResultContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSuggestionsSectionRenderer _$SearchSuggestionsSectionRendererFromJson(
    Map<String, dynamic> json) {
  return _SearchSuggestionsSectionRenderer.fromJson(json);
}

/// @nodoc
mixin _$SearchSuggestionsSectionRenderer {
  List<SearchSuggestionsSectionRendererContent>? get contents =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSuggestionsSectionRendererCopyWith<SearchSuggestionsSectionRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestionsSectionRendererCopyWith<$Res> {
  factory $SearchSuggestionsSectionRendererCopyWith(
          SearchSuggestionsSectionRenderer value,
          $Res Function(SearchSuggestionsSectionRenderer) then) =
      _$SearchSuggestionsSectionRendererCopyWithImpl<$Res,
          SearchSuggestionsSectionRenderer>;
  @useResult
  $Res call({List<SearchSuggestionsSectionRendererContent>? contents});
}

/// @nodoc
class _$SearchSuggestionsSectionRendererCopyWithImpl<$Res,
        $Val extends SearchSuggestionsSectionRenderer>
    implements $SearchSuggestionsSectionRendererCopyWith<$Res> {
  _$SearchSuggestionsSectionRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SearchSuggestionsSectionRendererContent>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSuggestionsSectionRendererImplCopyWith<$Res>
    implements $SearchSuggestionsSectionRendererCopyWith<$Res> {
  factory _$$SearchSuggestionsSectionRendererImplCopyWith(
          _$SearchSuggestionsSectionRendererImpl value,
          $Res Function(_$SearchSuggestionsSectionRendererImpl) then) =
      __$$SearchSuggestionsSectionRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchSuggestionsSectionRendererContent>? contents});
}

/// @nodoc
class __$$SearchSuggestionsSectionRendererImplCopyWithImpl<$Res>
    extends _$SearchSuggestionsSectionRendererCopyWithImpl<$Res,
        _$SearchSuggestionsSectionRendererImpl>
    implements _$$SearchSuggestionsSectionRendererImplCopyWith<$Res> {
  __$$SearchSuggestionsSectionRendererImplCopyWithImpl(
      _$SearchSuggestionsSectionRendererImpl _value,
      $Res Function(_$SearchSuggestionsSectionRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_$SearchSuggestionsSectionRendererImpl(
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SearchSuggestionsSectionRendererContent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSuggestionsSectionRendererImpl
    implements _SearchSuggestionsSectionRenderer {
  _$SearchSuggestionsSectionRendererImpl(
      {final List<SearchSuggestionsSectionRendererContent>? contents})
      : _contents = contents;

  factory _$SearchSuggestionsSectionRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchSuggestionsSectionRendererImplFromJson(json);

  final List<SearchSuggestionsSectionRendererContent>? _contents;
  @override
  List<SearchSuggestionsSectionRendererContent>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchSuggestionsSectionRenderer(contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestionsSectionRendererImpl &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestionsSectionRendererImplCopyWith<
          _$SearchSuggestionsSectionRendererImpl>
      get copyWith => __$$SearchSuggestionsSectionRendererImplCopyWithImpl<
          _$SearchSuggestionsSectionRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSuggestionsSectionRendererImplToJson(
      this,
    );
  }
}

abstract class _SearchSuggestionsSectionRenderer
    implements SearchSuggestionsSectionRenderer {
  factory _SearchSuggestionsSectionRenderer(
          {final List<SearchSuggestionsSectionRendererContent>? contents}) =
      _$SearchSuggestionsSectionRendererImpl;

  factory _SearchSuggestionsSectionRenderer.fromJson(
          Map<String, dynamic> json) =
      _$SearchSuggestionsSectionRendererImpl.fromJson;

  @override
  List<SearchSuggestionsSectionRendererContent>? get contents;
  @override
  @JsonKey(ignore: true)
  _$$SearchSuggestionsSectionRendererImplCopyWith<
          _$SearchSuggestionsSectionRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchSuggestionsSectionRendererContent
    _$SearchSuggestionsSectionRendererContentFromJson(
        Map<String, dynamic> json) {
  return _SearchSuggestionsSectionRendererContent.fromJson(json);
}

/// @nodoc
mixin _$SearchSuggestionsSectionRendererContent {
  SearchSuggestionRenderer? get searchSuggestionRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSuggestionsSectionRendererContentCopyWith<
          SearchSuggestionsSectionRendererContent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  factory $SearchSuggestionsSectionRendererContentCopyWith(
          SearchSuggestionsSectionRendererContent value,
          $Res Function(SearchSuggestionsSectionRendererContent) then) =
      _$SearchSuggestionsSectionRendererContentCopyWithImpl<$Res,
          SearchSuggestionsSectionRendererContent>;
  @useResult
  $Res call({SearchSuggestionRenderer? searchSuggestionRenderer});

  $SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer;
}

/// @nodoc
class _$SearchSuggestionsSectionRendererContentCopyWithImpl<$Res,
        $Val extends SearchSuggestionsSectionRendererContent>
    implements $SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  _$SearchSuggestionsSectionRendererContentCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSuggestionRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      searchSuggestionRenderer: freezed == searchSuggestionRenderer
          ? _value.searchSuggestionRenderer
          : searchSuggestionRenderer // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer {
    if (_value.searchSuggestionRenderer == null) {
      return null;
    }

    return $SearchSuggestionRendererCopyWith<$Res>(
        _value.searchSuggestionRenderer!, (value) {
      return _then(_value.copyWith(searchSuggestionRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchSuggestionsSectionRendererContentImplCopyWith<$Res>
    implements $SearchSuggestionsSectionRendererContentCopyWith<$Res> {
  factory _$$SearchSuggestionsSectionRendererContentImplCopyWith(
          _$SearchSuggestionsSectionRendererContentImpl value,
          $Res Function(_$SearchSuggestionsSectionRendererContentImpl) then) =
      __$$SearchSuggestionsSectionRendererContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchSuggestionRenderer? searchSuggestionRenderer});

  @override
  $SearchSuggestionRendererCopyWith<$Res>? get searchSuggestionRenderer;
}

/// @nodoc
class __$$SearchSuggestionsSectionRendererContentImplCopyWithImpl<$Res>
    extends _$SearchSuggestionsSectionRendererContentCopyWithImpl<$Res,
        _$SearchSuggestionsSectionRendererContentImpl>
    implements _$$SearchSuggestionsSectionRendererContentImplCopyWith<$Res> {
  __$$SearchSuggestionsSectionRendererContentImplCopyWithImpl(
      _$SearchSuggestionsSectionRendererContentImpl _value,
      $Res Function(_$SearchSuggestionsSectionRendererContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSuggestionRenderer = freezed,
  }) {
    return _then(_$SearchSuggestionsSectionRendererContentImpl(
      searchSuggestionRenderer: freezed == searchSuggestionRenderer
          ? _value.searchSuggestionRenderer
          : searchSuggestionRenderer // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSuggestionsSectionRendererContentImpl
    implements _SearchSuggestionsSectionRendererContent {
  _$SearchSuggestionsSectionRendererContentImpl(
      {this.searchSuggestionRenderer});

  factory _$SearchSuggestionsSectionRendererContentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchSuggestionsSectionRendererContentImplFromJson(json);

  @override
  final SearchSuggestionRenderer? searchSuggestionRenderer;

  @override
  String toString() {
    return 'SearchSuggestionsSectionRendererContent(searchSuggestionRenderer: $searchSuggestionRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestionsSectionRendererContentImpl &&
            (identical(
                    other.searchSuggestionRenderer, searchSuggestionRenderer) ||
                other.searchSuggestionRenderer == searchSuggestionRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, searchSuggestionRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestionsSectionRendererContentImplCopyWith<
          _$SearchSuggestionsSectionRendererContentImpl>
      get copyWith =>
          __$$SearchSuggestionsSectionRendererContentImplCopyWithImpl<
              _$SearchSuggestionsSectionRendererContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSuggestionsSectionRendererContentImplToJson(
      this,
    );
  }
}

abstract class _SearchSuggestionsSectionRendererContent
    implements SearchSuggestionsSectionRendererContent {
  factory _SearchSuggestionsSectionRendererContent(
          {final SearchSuggestionRenderer? searchSuggestionRenderer}) =
      _$SearchSuggestionsSectionRendererContentImpl;

  factory _SearchSuggestionsSectionRendererContent.fromJson(
          Map<String, dynamic> json) =
      _$SearchSuggestionsSectionRendererContentImpl.fromJson;

  @override
  SearchSuggestionRenderer? get searchSuggestionRenderer;
  @override
  @JsonKey(ignore: true)
  _$$SearchSuggestionsSectionRendererContentImplCopyWith<
          _$SearchSuggestionsSectionRendererContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchSuggestionRenderer _$SearchSuggestionRendererFromJson(
    Map<String, dynamic> json) {
  return _SearchSuggestionRenderer.fromJson(json);
}

/// @nodoc
mixin _$SearchSuggestionRenderer {
  Suggestion? get suggestion => throw _privateConstructorUsedError;
  NavigationEndpoint? get navigationEndpoint =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  Iconn? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSuggestionRendererCopyWith<SearchSuggestionRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestionRendererCopyWith<$Res> {
  factory $SearchSuggestionRendererCopyWith(SearchSuggestionRenderer value,
          $Res Function(SearchSuggestionRenderer) then) =
      _$SearchSuggestionRendererCopyWithImpl<$Res, SearchSuggestionRenderer>;
  @useResult
  $Res call(
      {Suggestion? suggestion,
      NavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      Iconn? icon});

  $SuggestionCopyWith<$Res>? get suggestion;
  $NavigationEndpointCopyWith<$Res>? get navigationEndpoint;
  $IconnCopyWith<$Res>? get icon;
}

/// @nodoc
class _$SearchSuggestionRendererCopyWithImpl<$Res,
        $Val extends SearchSuggestionRenderer>
    implements $SearchSuggestionRendererCopyWith<$Res> {
  _$SearchSuggestionRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestion = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as Suggestion?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as NavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Iconn?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuggestionCopyWith<$Res>? get suggestion {
    if (_value.suggestion == null) {
      return null;
    }

    return $SuggestionCopyWith<$Res>(_value.suggestion!, (value) {
      return _then(_value.copyWith(suggestion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_value.navigationEndpoint == null) {
      return null;
    }

    return $NavigationEndpointCopyWith<$Res>(_value.navigationEndpoint!,
        (value) {
      return _then(_value.copyWith(navigationEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconnCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $IconnCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchSuggestionRendererImplCopyWith<$Res>
    implements $SearchSuggestionRendererCopyWith<$Res> {
  factory _$$SearchSuggestionRendererImplCopyWith(
          _$SearchSuggestionRendererImpl value,
          $Res Function(_$SearchSuggestionRendererImpl) then) =
      __$$SearchSuggestionRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Suggestion? suggestion,
      NavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      Iconn? icon});

  @override
  $SuggestionCopyWith<$Res>? get suggestion;
  @override
  $NavigationEndpointCopyWith<$Res>? get navigationEndpoint;
  @override
  $IconnCopyWith<$Res>? get icon;
}

/// @nodoc
class __$$SearchSuggestionRendererImplCopyWithImpl<$Res>
    extends _$SearchSuggestionRendererCopyWithImpl<$Res,
        _$SearchSuggestionRendererImpl>
    implements _$$SearchSuggestionRendererImplCopyWith<$Res> {
  __$$SearchSuggestionRendererImplCopyWithImpl(
      _$SearchSuggestionRendererImpl _value,
      $Res Function(_$SearchSuggestionRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestion = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$SearchSuggestionRendererImpl(
      suggestion: freezed == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as Suggestion?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as NavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Iconn?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSuggestionRendererImpl implements _SearchSuggestionRenderer {
  _$SearchSuggestionRendererImpl(
      {this.suggestion,
      this.navigationEndpoint,
      this.trackingParams,
      this.icon});

  factory _$SearchSuggestionRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSuggestionRendererImplFromJson(json);

  @override
  final Suggestion? suggestion;
  @override
  final NavigationEndpoint? navigationEndpoint;
  @override
  final String? trackingParams;
  @override
  final Iconn? icon;

  @override
  String toString() {
    return 'SearchSuggestionRenderer(suggestion: $suggestion, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestionRendererImpl &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, suggestion, navigationEndpoint, trackingParams, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestionRendererImplCopyWith<_$SearchSuggestionRendererImpl>
      get copyWith => __$$SearchSuggestionRendererImplCopyWithImpl<
          _$SearchSuggestionRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSuggestionRendererImplToJson(
      this,
    );
  }
}

abstract class _SearchSuggestionRenderer implements SearchSuggestionRenderer {
  factory _SearchSuggestionRenderer(
      {final Suggestion? suggestion,
      final NavigationEndpoint? navigationEndpoint,
      final String? trackingParams,
      final Iconn? icon}) = _$SearchSuggestionRendererImpl;

  factory _SearchSuggestionRenderer.fromJson(Map<String, dynamic> json) =
      _$SearchSuggestionRendererImpl.fromJson;

  @override
  Suggestion? get suggestion;
  @override
  NavigationEndpoint? get navigationEndpoint;
  @override
  String? get trackingParams;
  @override
  Iconn? get icon;
  @override
  @JsonKey(ignore: true)
  _$$SearchSuggestionRendererImplCopyWith<_$SearchSuggestionRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return _Suggestion.fromJson(json);
}

/// @nodoc
mixin _$Suggestion {
  List<Run>? get runs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionCopyWith<Suggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
          Suggestion value, $Res Function(Suggestion) then) =
      _$SuggestionCopyWithImpl<$Res, Suggestion>;
  @useResult
  $Res call({List<Run>? runs});
}

/// @nodoc
class _$SuggestionCopyWithImpl<$Res, $Val extends Suggestion>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runs = freezed,
  }) {
    return _then(_value.copyWith(
      runs: freezed == runs
          ? _value.runs
          : runs // ignore: cast_nullable_to_non_nullable
              as List<Run>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionImplCopyWith<$Res>
    implements $SuggestionCopyWith<$Res> {
  factory _$$SuggestionImplCopyWith(
          _$SuggestionImpl value, $Res Function(_$SuggestionImpl) then) =
      __$$SuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Run>? runs});
}

/// @nodoc
class __$$SuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionCopyWithImpl<$Res, _$SuggestionImpl>
    implements _$$SuggestionImplCopyWith<$Res> {
  __$$SuggestionImplCopyWithImpl(
      _$SuggestionImpl _value, $Res Function(_$SuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runs = freezed,
  }) {
    return _then(_$SuggestionImpl(
      runs: freezed == runs
          ? _value._runs
          : runs // ignore: cast_nullable_to_non_nullable
              as List<Run>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionImpl implements _Suggestion {
  _$SuggestionImpl({final List<Run>? runs}) : _runs = runs;

  factory _$SuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionImplFromJson(json);

  final List<Run>? _runs;
  @override
  List<Run>? get runs {
    final value = _runs;
    if (value == null) return null;
    if (_runs is EqualUnmodifiableListView) return _runs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Suggestion(runs: $runs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionImpl &&
            const DeepCollectionEquality().equals(other._runs, _runs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_runs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      __$$SuggestionImplCopyWithImpl<_$SuggestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionImplToJson(
      this,
    );
  }
}

abstract class _Suggestion implements Suggestion {
  factory _Suggestion({final List<Run>? runs}) = _$SuggestionImpl;

  factory _Suggestion.fromJson(Map<String, dynamic> json) =
      _$SuggestionImpl.fromJson;

  @override
  List<Run>? get runs;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Run _$RunFromJson(Map<String, dynamic> json) {
  return _Run.fromJson(json);
}

/// @nodoc
mixin _$Run {
  String? get text => throw _privateConstructorUsedError;
  bool? get bold => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunCopyWith<Run> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunCopyWith<$Res> {
  factory $RunCopyWith(Run value, $Res Function(Run) then) =
      _$RunCopyWithImpl<$Res, Run>;
  @useResult
  $Res call({String? text, bool? bold});
}

/// @nodoc
class _$RunCopyWithImpl<$Res, $Val extends Run> implements $RunCopyWith<$Res> {
  _$RunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? bold = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      bold: freezed == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunImplCopyWith<$Res> implements $RunCopyWith<$Res> {
  factory _$$RunImplCopyWith(_$RunImpl value, $Res Function(_$RunImpl) then) =
      __$$RunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, bool? bold});
}

/// @nodoc
class __$$RunImplCopyWithImpl<$Res> extends _$RunCopyWithImpl<$Res, _$RunImpl>
    implements _$$RunImplCopyWith<$Res> {
  __$$RunImplCopyWithImpl(_$RunImpl _value, $Res Function(_$RunImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? bold = freezed,
  }) {
    return _then(_$RunImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      bold: freezed == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunImpl implements _Run {
  _$RunImpl({this.text, this.bold});

  factory _$RunImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunImplFromJson(json);

  @override
  final String? text;
  @override
  final bool? bold;

  @override
  String toString() {
    return 'Run(text: $text, bold: $bold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.bold, bold) || other.bold == bold));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, bold);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunImplCopyWith<_$RunImpl> get copyWith =>
      __$$RunImplCopyWithImpl<_$RunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunImplToJson(
      this,
    );
  }
}

abstract class _Run implements Run {
  factory _Run({final String? text, final bool? bold}) = _$RunImpl;

  factory _Run.fromJson(Map<String, dynamic> json) = _$RunImpl.fromJson;

  @override
  String? get text;
  @override
  bool? get bold;
  @override
  @JsonKey(ignore: true)
  _$$RunImplCopyWith<_$RunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NavigationEndpoint _$NavigationEndpointFromJson(Map<String, dynamic> json) {
  return _NavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$NavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  SearchEndpoint? get searchEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationEndpointCopyWith<NavigationEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEndpointCopyWith<$Res> {
  factory $NavigationEndpointCopyWith(
          NavigationEndpoint value, $Res Function(NavigationEndpoint) then) =
      _$NavigationEndpointCopyWithImpl<$Res, NavigationEndpoint>;
  @useResult
  $Res call({String? clickTrackingParams, SearchEndpoint? searchEndpoint});

  $SearchEndpointCopyWith<$Res>? get searchEndpoint;
}

/// @nodoc
class _$NavigationEndpointCopyWithImpl<$Res, $Val extends NavigationEndpoint>
    implements $NavigationEndpointCopyWith<$Res> {
  _$NavigationEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? searchEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      searchEndpoint: freezed == searchEndpoint
          ? _value.searchEndpoint
          : searchEndpoint // ignore: cast_nullable_to_non_nullable
              as SearchEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchEndpointCopyWith<$Res>? get searchEndpoint {
    if (_value.searchEndpoint == null) {
      return null;
    }

    return $SearchEndpointCopyWith<$Res>(_value.searchEndpoint!, (value) {
      return _then(_value.copyWith(searchEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationEndpointImplCopyWith<$Res>
    implements $NavigationEndpointCopyWith<$Res> {
  factory _$$NavigationEndpointImplCopyWith(_$NavigationEndpointImpl value,
          $Res Function(_$NavigationEndpointImpl) then) =
      __$$NavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, SearchEndpoint? searchEndpoint});

  @override
  $SearchEndpointCopyWith<$Res>? get searchEndpoint;
}

/// @nodoc
class __$$NavigationEndpointImplCopyWithImpl<$Res>
    extends _$NavigationEndpointCopyWithImpl<$Res, _$NavigationEndpointImpl>
    implements _$$NavigationEndpointImplCopyWith<$Res> {
  __$$NavigationEndpointImplCopyWithImpl(_$NavigationEndpointImpl _value,
      $Res Function(_$NavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? searchEndpoint = freezed,
  }) {
    return _then(_$NavigationEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      searchEndpoint: freezed == searchEndpoint
          ? _value.searchEndpoint
          : searchEndpoint // ignore: cast_nullable_to_non_nullable
              as SearchEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationEndpointImpl implements _NavigationEndpoint {
  _$NavigationEndpointImpl({this.clickTrackingParams, this.searchEndpoint});

  factory _$NavigationEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final SearchEndpoint? searchEndpoint;

  @override
  String toString() {
    return 'NavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.searchEndpoint, searchEndpoint) ||
                other.searchEndpoint == searchEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, searchEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationEndpointImplCopyWith<_$NavigationEndpointImpl> get copyWith =>
      __$$NavigationEndpointImplCopyWithImpl<_$NavigationEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _NavigationEndpoint implements NavigationEndpoint {
  factory _NavigationEndpoint(
      {final String? clickTrackingParams,
      final SearchEndpoint? searchEndpoint}) = _$NavigationEndpointImpl;

  factory _NavigationEndpoint.fromJson(Map<String, dynamic> json) =
      _$NavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  SearchEndpoint? get searchEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$NavigationEndpointImplCopyWith<_$NavigationEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchEndpoint _$SearchEndpointFromJson(Map<String, dynamic> json) {
  return _SearchEndpoint.fromJson(json);
}

/// @nodoc
mixin _$SearchEndpoint {
  String? get query => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchEndpointCopyWith<SearchEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEndpointCopyWith<$Res> {
  factory $SearchEndpointCopyWith(
          SearchEndpoint value, $Res Function(SearchEndpoint) then) =
      _$SearchEndpointCopyWithImpl<$Res, SearchEndpoint>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$SearchEndpointCopyWithImpl<$Res, $Val extends SearchEndpoint>
    implements $SearchEndpointCopyWith<$Res> {
  _$SearchEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchEndpointImplCopyWith<$Res>
    implements $SearchEndpointCopyWith<$Res> {
  factory _$$SearchEndpointImplCopyWith(_$SearchEndpointImpl value,
          $Res Function(_$SearchEndpointImpl) then) =
      __$$SearchEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$SearchEndpointImplCopyWithImpl<$Res>
    extends _$SearchEndpointCopyWithImpl<$Res, _$SearchEndpointImpl>
    implements _$$SearchEndpointImplCopyWith<$Res> {
  __$$SearchEndpointImplCopyWithImpl(
      _$SearchEndpointImpl _value, $Res Function(_$SearchEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$SearchEndpointImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchEndpointImpl implements _SearchEndpoint {
  _$SearchEndpointImpl({this.query});

  factory _$SearchEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchEndpointImplFromJson(json);

  @override
  final String? query;

  @override
  String toString() {
    return 'SearchEndpoint(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEndpointImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEndpointImplCopyWith<_$SearchEndpointImpl> get copyWith =>
      __$$SearchEndpointImplCopyWithImpl<_$SearchEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchEndpointImplToJson(
      this,
    );
  }
}

abstract class _SearchEndpoint implements SearchEndpoint {
  factory _SearchEndpoint({final String? query}) = _$SearchEndpointImpl;

  factory _SearchEndpoint.fromJson(Map<String, dynamic> json) =
      _$SearchEndpointImpl.fromJson;

  @override
  String? get query;
  @override
  @JsonKey(ignore: true)
  _$$SearchEndpointImplCopyWith<_$SearchEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Iconn _$IconnFromJson(Map<String, dynamic> json) {
  return _Iconn.fromJson(json);
}

/// @nodoc
mixin _$Iconn {
  String? get iconType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IconnCopyWith<Iconn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconnCopyWith<$Res> {
  factory $IconnCopyWith(Iconn value, $Res Function(Iconn) then) =
      _$IconnCopyWithImpl<$Res, Iconn>;
  @useResult
  $Res call({String? iconType});
}

/// @nodoc
class _$IconnCopyWithImpl<$Res, $Val extends Iconn>
    implements $IconnCopyWith<$Res> {
  _$IconnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconType = freezed,
  }) {
    return _then(_value.copyWith(
      iconType: freezed == iconType
          ? _value.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IconnImplCopyWith<$Res> implements $IconnCopyWith<$Res> {
  factory _$$IconnImplCopyWith(
          _$IconnImpl value, $Res Function(_$IconnImpl) then) =
      __$$IconnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? iconType});
}

/// @nodoc
class __$$IconnImplCopyWithImpl<$Res>
    extends _$IconnCopyWithImpl<$Res, _$IconnImpl>
    implements _$$IconnImplCopyWith<$Res> {
  __$$IconnImplCopyWithImpl(
      _$IconnImpl _value, $Res Function(_$IconnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconType = freezed,
  }) {
    return _then(_$IconnImpl(
      iconType: freezed == iconType
          ? _value.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IconnImpl implements _Iconn {
  _$IconnImpl({this.iconType});

  factory _$IconnImpl.fromJson(Map<String, dynamic> json) =>
      _$$IconnImplFromJson(json);

  @override
  final String? iconType;

  @override
  String toString() {
    return 'Iconn(iconType: $iconType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconnImpl &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iconType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconnImplCopyWith<_$IconnImpl> get copyWith =>
      __$$IconnImplCopyWithImpl<_$IconnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IconnImplToJson(
      this,
    );
  }
}

abstract class _Iconn implements Iconn {
  factory _Iconn({final String? iconType}) = _$IconnImpl;

  factory _Iconn.fromJson(Map<String, dynamic> json) = _$IconnImpl.fromJson;

  @override
  String? get iconType;
  @override
  @JsonKey(ignore: true)
  _$$IconnImplCopyWith<_$IconnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseContext _$ResponseContextFromJson(Map<String, dynamic> json) {
  return _ResponseContext.fromJson(json);
}

/// @nodoc
mixin _$ResponseContext {
  String? get visitorData => throw _privateConstructorUsedError;
  List<ServiceTrackingParam>? get serviceTrackingParams =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseContextCopyWith<ResponseContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseContextCopyWith<$Res> {
  factory $ResponseContextCopyWith(
          ResponseContext value, $Res Function(ResponseContext) then) =
      _$ResponseContextCopyWithImpl<$Res, ResponseContext>;
  @useResult
  $Res call(
      {String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams});
}

/// @nodoc
class _$ResponseContextCopyWithImpl<$Res, $Val extends ResponseContext>
    implements $ResponseContextCopyWith<$Res> {
  _$ResponseContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorData = freezed,
    Object? serviceTrackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      visitorData: freezed == visitorData
          ? _value.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceTrackingParams: freezed == serviceTrackingParams
          ? _value.serviceTrackingParams
          : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
              as List<ServiceTrackingParam>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseContextImplCopyWith<$Res>
    implements $ResponseContextCopyWith<$Res> {
  factory _$$ResponseContextImplCopyWith(_$ResponseContextImpl value,
          $Res Function(_$ResponseContextImpl) then) =
      __$$ResponseContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? visitorData, List<ServiceTrackingParam>? serviceTrackingParams});
}

/// @nodoc
class __$$ResponseContextImplCopyWithImpl<$Res>
    extends _$ResponseContextCopyWithImpl<$Res, _$ResponseContextImpl>
    implements _$$ResponseContextImplCopyWith<$Res> {
  __$$ResponseContextImplCopyWithImpl(
      _$ResponseContextImpl _value, $Res Function(_$ResponseContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorData = freezed,
    Object? serviceTrackingParams = freezed,
  }) {
    return _then(_$ResponseContextImpl(
      visitorData: freezed == visitorData
          ? _value.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceTrackingParams: freezed == serviceTrackingParams
          ? _value._serviceTrackingParams
          : serviceTrackingParams // ignore: cast_nullable_to_non_nullable
              as List<ServiceTrackingParam>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseContextImpl implements _ResponseContext {
  _$ResponseContextImpl(
      {this.visitorData,
      final List<ServiceTrackingParam>? serviceTrackingParams})
      : _serviceTrackingParams = serviceTrackingParams;

  factory _$ResponseContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseContextImplFromJson(json);

  @override
  final String? visitorData;
  final List<ServiceTrackingParam>? _serviceTrackingParams;
  @override
  List<ServiceTrackingParam>? get serviceTrackingParams {
    final value = _serviceTrackingParams;
    if (value == null) return null;
    if (_serviceTrackingParams is EqualUnmodifiableListView)
      return _serviceTrackingParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseContextImpl &&
            (identical(other.visitorData, visitorData) ||
                other.visitorData == visitorData) &&
            const DeepCollectionEquality()
                .equals(other._serviceTrackingParams, _serviceTrackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, visitorData,
      const DeepCollectionEquality().hash(_serviceTrackingParams));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseContextImplCopyWith<_$ResponseContextImpl> get copyWith =>
      __$$ResponseContextImplCopyWithImpl<_$ResponseContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseContextImplToJson(
      this,
    );
  }
}

abstract class _ResponseContext implements ResponseContext {
  factory _ResponseContext(
          {final String? visitorData,
          final List<ServiceTrackingParam>? serviceTrackingParams}) =
      _$ResponseContextImpl;

  factory _ResponseContext.fromJson(Map<String, dynamic> json) =
      _$ResponseContextImpl.fromJson;

  @override
  String? get visitorData;
  @override
  List<ServiceTrackingParam>? get serviceTrackingParams;
  @override
  @JsonKey(ignore: true)
  _$$ResponseContextImplCopyWith<_$ResponseContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceTrackingParam _$ServiceTrackingParamFromJson(Map<String, dynamic> json) {
  return _ServiceTrackingParam.fromJson(json);
}

/// @nodoc
mixin _$ServiceTrackingParam {
  String? get service => throw _privateConstructorUsedError;
  List<Param>? get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceTrackingParamCopyWith<ServiceTrackingParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTrackingParamCopyWith<$Res> {
  factory $ServiceTrackingParamCopyWith(ServiceTrackingParam value,
          $Res Function(ServiceTrackingParam) then) =
      _$ServiceTrackingParamCopyWithImpl<$Res, ServiceTrackingParam>;
  @useResult
  $Res call({String? service, List<Param>? params});
}

/// @nodoc
class _$ServiceTrackingParamCopyWithImpl<$Res,
        $Val extends ServiceTrackingParam>
    implements $ServiceTrackingParamCopyWith<$Res> {
  _$ServiceTrackingParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<Param>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceTrackingParamImplCopyWith<$Res>
    implements $ServiceTrackingParamCopyWith<$Res> {
  factory _$$ServiceTrackingParamImplCopyWith(_$ServiceTrackingParamImpl value,
          $Res Function(_$ServiceTrackingParamImpl) then) =
      __$$ServiceTrackingParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? service, List<Param>? params});
}

/// @nodoc
class __$$ServiceTrackingParamImplCopyWithImpl<$Res>
    extends _$ServiceTrackingParamCopyWithImpl<$Res, _$ServiceTrackingParamImpl>
    implements _$$ServiceTrackingParamImplCopyWith<$Res> {
  __$$ServiceTrackingParamImplCopyWithImpl(_$ServiceTrackingParamImpl _value,
      $Res Function(_$ServiceTrackingParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? params = freezed,
  }) {
    return _then(_$ServiceTrackingParamImpl(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<Param>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceTrackingParamImpl implements _ServiceTrackingParam {
  _$ServiceTrackingParamImpl({this.service, final List<Param>? params})
      : _params = params;

  factory _$ServiceTrackingParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceTrackingParamImplFromJson(json);

  @override
  final String? service;
  final List<Param>? _params;
  @override
  List<Param>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceTrackingParam(service: $service, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceTrackingParamImpl &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, service, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceTrackingParamImplCopyWith<_$ServiceTrackingParamImpl>
      get copyWith =>
          __$$ServiceTrackingParamImplCopyWithImpl<_$ServiceTrackingParamImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceTrackingParamImplToJson(
      this,
    );
  }
}

abstract class _ServiceTrackingParam implements ServiceTrackingParam {
  factory _ServiceTrackingParam(
      {final String? service,
      final List<Param>? params}) = _$ServiceTrackingParamImpl;

  factory _ServiceTrackingParam.fromJson(Map<String, dynamic> json) =
      _$ServiceTrackingParamImpl.fromJson;

  @override
  String? get service;
  @override
  List<Param>? get params;
  @override
  @JsonKey(ignore: true)
  _$$ServiceTrackingParamImplCopyWith<_$ServiceTrackingParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Param _$ParamFromJson(Map<String, dynamic> json) {
  return _Param.fromJson(json);
}

/// @nodoc
mixin _$Param {
  String? get key => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamCopyWith<Param> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamCopyWith<$Res> {
  factory $ParamCopyWith(Param value, $Res Function(Param) then) =
      _$ParamCopyWithImpl<$Res, Param>;
  @useResult
  $Res call({String? key, String? value});
}

/// @nodoc
class _$ParamCopyWithImpl<$Res, $Val extends Param>
    implements $ParamCopyWith<$Res> {
  _$ParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParamImplCopyWith<$Res> implements $ParamCopyWith<$Res> {
  factory _$$ParamImplCopyWith(
          _$ParamImpl value, $Res Function(_$ParamImpl) then) =
      __$$ParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? value});
}

/// @nodoc
class __$$ParamImplCopyWithImpl<$Res>
    extends _$ParamCopyWithImpl<$Res, _$ParamImpl>
    implements _$$ParamImplCopyWith<$Res> {
  __$$ParamImplCopyWithImpl(
      _$ParamImpl _value, $Res Function(_$ParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ParamImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParamImpl implements _Param {
  _$ParamImpl({this.key, this.value});

  factory _$ParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamImplFromJson(json);

  @override
  final String? key;
  @override
  final String? value;

  @override
  String toString() {
    return 'Param(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamImplCopyWith<_$ParamImpl> get copyWith =>
      __$$ParamImplCopyWithImpl<_$ParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamImplToJson(
      this,
    );
  }
}

abstract class _Param implements Param {
  factory _Param({final String? key, final String? value}) = _$ParamImpl;

  factory _Param.fromJson(Map<String, dynamic> json) = _$ParamImpl.fromJson;

  @override
  String? get key;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$ParamImplCopyWith<_$ParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
