// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListSearchSongResult _$ListSearchResultFromJson(Map<String, dynamic> json) {
  return _ListSearchResult.fromJson(json);
}

/// @nodoc
mixin _$ListSearchResult {
  ResponseContext? get responseContext => throw _privateConstructorUsedError;
  Contents? get contents => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListSearchResultCopyWith<ListSearchSongResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSearchResultCopyWith<$Res> {
  factory $ListSearchResultCopyWith(ListSearchSongResult value,
          $Res Function(ListSearchSongResult) then) =
      _$ListSearchResultCopyWithImpl<$Res, ListSearchSongResult>;
  @useResult
  $Res call(
      {ResponseContext? responseContext,
      Contents? contents,
      String? trackingParams});

  $ResponseContextCopyWith<$Res>? get responseContext;
  $ContentsCopyWith<$Res>? get contents;
}

/// @nodoc
class _$ListSearchResultCopyWithImpl<$Res, $Val extends ListSearchSongResult>
    implements $ListSearchResultCopyWith<$Res> {
  _$ListSearchResultCopyWithImpl(this._value, this._then);

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
              as Contents?,
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

  @override
  @pragma('vm:prefer-inline')
  $ContentsCopyWith<$Res>? get contents {
    if (_value.contents == null) {
      return null;
    }

    return $ContentsCopyWith<$Res>(_value.contents!, (value) {
      return _then(_value.copyWith(contents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListSearchResultImplCopyWith<$Res>
    implements $ListSearchResultCopyWith<$Res> {
  factory _$$ListSearchResultImplCopyWith(_$ListSearchResultImpl value,
          $Res Function(_$ListSearchResultImpl) then) =
      __$$ListSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseContext? responseContext,
      Contents? contents,
      String? trackingParams});

  @override
  $ResponseContextCopyWith<$Res>? get responseContext;
  @override
  $ContentsCopyWith<$Res>? get contents;
}

/// @nodoc
class __$$ListSearchResultImplCopyWithImpl<$Res>
    extends _$ListSearchResultCopyWithImpl<$Res, _$ListSearchResultImpl>
    implements _$$ListSearchResultImplCopyWith<$Res> {
  __$$ListSearchResultImplCopyWithImpl(_$ListSearchResultImpl _value,
      $Res Function(_$ListSearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseContext = freezed,
    Object? contents = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$ListSearchResultImpl(
      responseContext: freezed == responseContext
          ? _value.responseContext
          : responseContext // ignore: cast_nullable_to_non_nullable
              as ResponseContext?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as Contents?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListSearchResultImpl implements _ListSearchResult {
  const _$ListSearchResultImpl(
      {this.responseContext, this.contents, this.trackingParams});

  factory _$ListSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListSearchResultImplFromJson(json);

  @override
  final ResponseContext? responseContext;
  @override
  final Contents? contents;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'ListSearchResult(responseContext: $responseContext, contents: $contents, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSearchResultImpl &&
            (identical(other.responseContext, responseContext) ||
                other.responseContext == responseContext) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, responseContext, contents, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSearchResultImplCopyWith<_$ListSearchResultImpl> get copyWith =>
      __$$ListSearchResultImplCopyWithImpl<_$ListSearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListSearchResultImplToJson(
      this,
    );
  }
}

abstract class _ListSearchResult implements ListSearchSongResult {
  const factory _ListSearchResult(
      {final ResponseContext? responseContext,
      final Contents? contents,
      final String? trackingParams}) = _$ListSearchResultImpl;

  factory _ListSearchResult.fromJson(Map<String, dynamic> json) =
      _$ListSearchResultImpl.fromJson;

  @override
  ResponseContext? get responseContext;
  @override
  Contents? get contents;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$ListSearchResultImplCopyWith<_$ListSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contents _$ContentsFromJson(Map<String, dynamic> json) {
  return _Contents.fromJson(json);
}

/// @nodoc
mixin _$Contents {
  TabbedSearchResultsRenderer? get tabbedSearchResultsRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentsCopyWith<Contents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentsCopyWith<$Res> {
  factory $ContentsCopyWith(Contents value, $Res Function(Contents) then) =
      _$ContentsCopyWithImpl<$Res, Contents>;
  @useResult
  $Res call({TabbedSearchResultsRenderer? tabbedSearchResultsRenderer});

  $TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer;
}

/// @nodoc
class _$ContentsCopyWithImpl<$Res, $Val extends Contents>
    implements $ContentsCopyWith<$Res> {
  _$ContentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabbedSearchResultsRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      tabbedSearchResultsRenderer: freezed == tabbedSearchResultsRenderer
          ? _value.tabbedSearchResultsRenderer
          : tabbedSearchResultsRenderer // ignore: cast_nullable_to_non_nullable
              as TabbedSearchResultsRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer {
    if (_value.tabbedSearchResultsRenderer == null) {
      return null;
    }

    return $TabbedSearchResultsRendererCopyWith<$Res>(
        _value.tabbedSearchResultsRenderer!, (value) {
      return _then(_value.copyWith(tabbedSearchResultsRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentsImplCopyWith<$Res>
    implements $ContentsCopyWith<$Res> {
  factory _$$ContentsImplCopyWith(
          _$ContentsImpl value, $Res Function(_$ContentsImpl) then) =
      __$$ContentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TabbedSearchResultsRenderer? tabbedSearchResultsRenderer});

  @override
  $TabbedSearchResultsRendererCopyWith<$Res>? get tabbedSearchResultsRenderer;
}

/// @nodoc
class __$$ContentsImplCopyWithImpl<$Res>
    extends _$ContentsCopyWithImpl<$Res, _$ContentsImpl>
    implements _$$ContentsImplCopyWith<$Res> {
  __$$ContentsImplCopyWithImpl(
      _$ContentsImpl _value, $Res Function(_$ContentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabbedSearchResultsRenderer = freezed,
  }) {
    return _then(_$ContentsImpl(
      tabbedSearchResultsRenderer: freezed == tabbedSearchResultsRenderer
          ? _value.tabbedSearchResultsRenderer
          : tabbedSearchResultsRenderer // ignore: cast_nullable_to_non_nullable
              as TabbedSearchResultsRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentsImpl implements _Contents {
  const _$ContentsImpl({this.tabbedSearchResultsRenderer});

  factory _$ContentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentsImplFromJson(json);

  @override
  final TabbedSearchResultsRenderer? tabbedSearchResultsRenderer;

  @override
  String toString() {
    return 'Contents(tabbedSearchResultsRenderer: $tabbedSearchResultsRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsImpl &&
            (identical(other.tabbedSearchResultsRenderer,
                    tabbedSearchResultsRenderer) ||
                other.tabbedSearchResultsRenderer ==
                    tabbedSearchResultsRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tabbedSearchResultsRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsImplCopyWith<_$ContentsImpl> get copyWith =>
      __$$ContentsImplCopyWithImpl<_$ContentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentsImplToJson(
      this,
    );
  }
}

abstract class _Contents implements Contents {
  const factory _Contents(
          {final TabbedSearchResultsRenderer? tabbedSearchResultsRenderer}) =
      _$ContentsImpl;

  factory _Contents.fromJson(Map<String, dynamic> json) =
      _$ContentsImpl.fromJson;

  @override
  TabbedSearchResultsRenderer? get tabbedSearchResultsRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ContentsImplCopyWith<_$ContentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TabbedSearchResultsRenderer _$TabbedSearchResultsRendererFromJson(
    Map<String, dynamic> json) {
  return _TabbedSearchResultsRenderer.fromJson(json);
}

/// @nodoc
mixin _$TabbedSearchResultsRenderer {
  List<Tab>? get tabs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabbedSearchResultsRendererCopyWith<TabbedSearchResultsRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabbedSearchResultsRendererCopyWith<$Res> {
  factory $TabbedSearchResultsRendererCopyWith(
          TabbedSearchResultsRenderer value,
          $Res Function(TabbedSearchResultsRenderer) then) =
      _$TabbedSearchResultsRendererCopyWithImpl<$Res,
          TabbedSearchResultsRenderer>;
  @useResult
  $Res call({List<Tab>? tabs});
}

/// @nodoc
class _$TabbedSearchResultsRendererCopyWithImpl<$Res,
        $Val extends TabbedSearchResultsRenderer>
    implements $TabbedSearchResultsRendererCopyWith<$Res> {
  _$TabbedSearchResultsRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = freezed,
  }) {
    return _then(_value.copyWith(
      tabs: freezed == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<Tab>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabbedSearchResultsRendererImplCopyWith<$Res>
    implements $TabbedSearchResultsRendererCopyWith<$Res> {
  factory _$$TabbedSearchResultsRendererImplCopyWith(
          _$TabbedSearchResultsRendererImpl value,
          $Res Function(_$TabbedSearchResultsRendererImpl) then) =
      __$$TabbedSearchResultsRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tab>? tabs});
}

/// @nodoc
class __$$TabbedSearchResultsRendererImplCopyWithImpl<$Res>
    extends _$TabbedSearchResultsRendererCopyWithImpl<$Res,
        _$TabbedSearchResultsRendererImpl>
    implements _$$TabbedSearchResultsRendererImplCopyWith<$Res> {
  __$$TabbedSearchResultsRendererImplCopyWithImpl(
      _$TabbedSearchResultsRendererImpl _value,
      $Res Function(_$TabbedSearchResultsRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = freezed,
  }) {
    return _then(_$TabbedSearchResultsRendererImpl(
      tabs: freezed == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<Tab>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabbedSearchResultsRendererImpl
    implements _TabbedSearchResultsRenderer {
  const _$TabbedSearchResultsRendererImpl({final List<Tab>? tabs})
      : _tabs = tabs;

  factory _$TabbedSearchResultsRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TabbedSearchResultsRendererImplFromJson(json);

  final List<Tab>? _tabs;
  @override
  List<Tab>? get tabs {
    final value = _tabs;
    if (value == null) return null;
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TabbedSearchResultsRenderer(tabs: $tabs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabbedSearchResultsRendererImpl &&
            const DeepCollectionEquality().equals(other._tabs, _tabs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tabs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabbedSearchResultsRendererImplCopyWith<_$TabbedSearchResultsRendererImpl>
      get copyWith => __$$TabbedSearchResultsRendererImplCopyWithImpl<
          _$TabbedSearchResultsRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabbedSearchResultsRendererImplToJson(
      this,
    );
  }
}

abstract class _TabbedSearchResultsRenderer
    implements TabbedSearchResultsRenderer {
  const factory _TabbedSearchResultsRenderer({final List<Tab>? tabs}) =
      _$TabbedSearchResultsRendererImpl;

  factory _TabbedSearchResultsRenderer.fromJson(Map<String, dynamic> json) =
      _$TabbedSearchResultsRendererImpl.fromJson;

  @override
  List<Tab>? get tabs;
  @override
  @JsonKey(ignore: true)
  _$$TabbedSearchResultsRendererImplCopyWith<_$TabbedSearchResultsRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Tab _$TabFromJson(Map<String, dynamic> json) {
  return _Tab.fromJson(json);
}

/// @nodoc
mixin _$Tab {
  TabRenderer? get tabRenderer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabCopyWith<Tab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabCopyWith<$Res> {
  factory $TabCopyWith(Tab value, $Res Function(Tab) then) =
      _$TabCopyWithImpl<$Res, Tab>;
  @useResult
  $Res call({TabRenderer? tabRenderer});

  $TabRendererCopyWith<$Res>? get tabRenderer;
}

/// @nodoc
class _$TabCopyWithImpl<$Res, $Val extends Tab> implements $TabCopyWith<$Res> {
  _$TabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      tabRenderer: freezed == tabRenderer
          ? _value.tabRenderer
          : tabRenderer // ignore: cast_nullable_to_non_nullable
              as TabRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TabRendererCopyWith<$Res>? get tabRenderer {
    if (_value.tabRenderer == null) {
      return null;
    }

    return $TabRendererCopyWith<$Res>(_value.tabRenderer!, (value) {
      return _then(_value.copyWith(tabRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TabImplCopyWith<$Res> implements $TabCopyWith<$Res> {
  factory _$$TabImplCopyWith(_$TabImpl value, $Res Function(_$TabImpl) then) =
      __$$TabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TabRenderer? tabRenderer});

  @override
  $TabRendererCopyWith<$Res>? get tabRenderer;
}

/// @nodoc
class __$$TabImplCopyWithImpl<$Res> extends _$TabCopyWithImpl<$Res, _$TabImpl>
    implements _$$TabImplCopyWith<$Res> {
  __$$TabImplCopyWithImpl(_$TabImpl _value, $Res Function(_$TabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabRenderer = freezed,
  }) {
    return _then(_$TabImpl(
      tabRenderer: freezed == tabRenderer
          ? _value.tabRenderer
          : tabRenderer // ignore: cast_nullable_to_non_nullable
              as TabRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabImpl implements _Tab {
  const _$TabImpl({this.tabRenderer});

  factory _$TabImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabImplFromJson(json);

  @override
  final TabRenderer? tabRenderer;

  @override
  String toString() {
    return 'Tab(tabRenderer: $tabRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabImpl &&
            (identical(other.tabRenderer, tabRenderer) ||
                other.tabRenderer == tabRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tabRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabImplCopyWith<_$TabImpl> get copyWith =>
      __$$TabImplCopyWithImpl<_$TabImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabImplToJson(
      this,
    );
  }
}

abstract class _Tab implements Tab {
  const factory _Tab({final TabRenderer? tabRenderer}) = _$TabImpl;

  factory _Tab.fromJson(Map<String, dynamic> json) = _$TabImpl.fromJson;

  @override
  TabRenderer? get tabRenderer;
  @override
  @JsonKey(ignore: true)
  _$$TabImplCopyWith<_$TabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TabRenderer _$TabRendererFromJson(Map<String, dynamic> json) {
  return _TabRenderer.fromJson(json);
}

/// @nodoc
mixin _$TabRenderer {
  String? get title => throw _privateConstructorUsedError;
  bool? get selected => throw _privateConstructorUsedError;
  TabRendererContent? get content => throw _privateConstructorUsedError;
  String? get tabIdentifier => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabRendererCopyWith<TabRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabRendererCopyWith<$Res> {
  factory $TabRendererCopyWith(
          TabRenderer value, $Res Function(TabRenderer) then) =
      _$TabRendererCopyWithImpl<$Res, TabRenderer>;
  @useResult
  $Res call(
      {String? title,
      bool? selected,
      TabRendererContent? content,
      String? tabIdentifier,
      String? trackingParams});

  $TabRendererContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$TabRendererCopyWithImpl<$Res, $Val extends TabRenderer>
    implements $TabRendererCopyWith<$Res> {
  _$TabRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? selected = freezed,
    Object? content = freezed,
    Object? tabIdentifier = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TabRendererContent?,
      tabIdentifier: freezed == tabIdentifier
          ? _value.tabIdentifier
          : tabIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TabRendererContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $TabRendererContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TabRendererImplCopyWith<$Res>
    implements $TabRendererCopyWith<$Res> {
  factory _$$TabRendererImplCopyWith(
          _$TabRendererImpl value, $Res Function(_$TabRendererImpl) then) =
      __$$TabRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      bool? selected,
      TabRendererContent? content,
      String? tabIdentifier,
      String? trackingParams});

  @override
  $TabRendererContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$TabRendererImplCopyWithImpl<$Res>
    extends _$TabRendererCopyWithImpl<$Res, _$TabRendererImpl>
    implements _$$TabRendererImplCopyWith<$Res> {
  __$$TabRendererImplCopyWithImpl(
      _$TabRendererImpl _value, $Res Function(_$TabRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? selected = freezed,
    Object? content = freezed,
    Object? tabIdentifier = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$TabRendererImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TabRendererContent?,
      tabIdentifier: freezed == tabIdentifier
          ? _value.tabIdentifier
          : tabIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabRendererImpl implements _TabRenderer {
  const _$TabRendererImpl(
      {this.title,
      this.selected,
      this.content,
      this.tabIdentifier,
      this.trackingParams});

  factory _$TabRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabRendererImplFromJson(json);

  @override
  final String? title;
  @override
  final bool? selected;
  @override
  final TabRendererContent? content;
  @override
  final String? tabIdentifier;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'TabRenderer(title: $title, selected: $selected, content: $content, tabIdentifier: $tabIdentifier, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabRendererImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.tabIdentifier, tabIdentifier) ||
                other.tabIdentifier == tabIdentifier) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, selected, content, tabIdentifier, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabRendererImplCopyWith<_$TabRendererImpl> get copyWith =>
      __$$TabRendererImplCopyWithImpl<_$TabRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabRendererImplToJson(
      this,
    );
  }
}

abstract class _TabRenderer implements TabRenderer {
  const factory _TabRenderer(
      {final String? title,
      final bool? selected,
      final TabRendererContent? content,
      final String? tabIdentifier,
      final String? trackingParams}) = _$TabRendererImpl;

  factory _TabRenderer.fromJson(Map<String, dynamic> json) =
      _$TabRendererImpl.fromJson;

  @override
  String? get title;
  @override
  bool? get selected;
  @override
  TabRendererContent? get content;
  @override
  String? get tabIdentifier;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$TabRendererImplCopyWith<_$TabRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TabRendererContent _$TabRendererContentFromJson(Map<String, dynamic> json) {
  return _TabRendererContent.fromJson(json);
}

/// @nodoc
mixin _$TabRendererContent {
  SectionListRenderer? get sectionListRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabRendererContentCopyWith<TabRendererContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabRendererContentCopyWith<$Res> {
  factory $TabRendererContentCopyWith(
          TabRendererContent value, $Res Function(TabRendererContent) then) =
      _$TabRendererContentCopyWithImpl<$Res, TabRendererContent>;
  @useResult
  $Res call({SectionListRenderer? sectionListRenderer});

  $SectionListRendererCopyWith<$Res>? get sectionListRenderer;
}

/// @nodoc
class _$TabRendererContentCopyWithImpl<$Res, $Val extends TabRendererContent>
    implements $TabRendererContentCopyWith<$Res> {
  _$TabRendererContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionListRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      sectionListRenderer: freezed == sectionListRenderer
          ? _value.sectionListRenderer
          : sectionListRenderer // ignore: cast_nullable_to_non_nullable
              as SectionListRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SectionListRendererCopyWith<$Res>? get sectionListRenderer {
    if (_value.sectionListRenderer == null) {
      return null;
    }

    return $SectionListRendererCopyWith<$Res>(_value.sectionListRenderer!,
        (value) {
      return _then(_value.copyWith(sectionListRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TabRendererContentImplCopyWith<$Res>
    implements $TabRendererContentCopyWith<$Res> {
  factory _$$TabRendererContentImplCopyWith(_$TabRendererContentImpl value,
          $Res Function(_$TabRendererContentImpl) then) =
      __$$TabRendererContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SectionListRenderer? sectionListRenderer});

  @override
  $SectionListRendererCopyWith<$Res>? get sectionListRenderer;
}

/// @nodoc
class __$$TabRendererContentImplCopyWithImpl<$Res>
    extends _$TabRendererContentCopyWithImpl<$Res, _$TabRendererContentImpl>
    implements _$$TabRendererContentImplCopyWith<$Res> {
  __$$TabRendererContentImplCopyWithImpl(_$TabRendererContentImpl _value,
      $Res Function(_$TabRendererContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionListRenderer = freezed,
  }) {
    return _then(_$TabRendererContentImpl(
      sectionListRenderer: freezed == sectionListRenderer
          ? _value.sectionListRenderer
          : sectionListRenderer // ignore: cast_nullable_to_non_nullable
              as SectionListRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabRendererContentImpl implements _TabRendererContent {
  const _$TabRendererContentImpl({this.sectionListRenderer});

  factory _$TabRendererContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabRendererContentImplFromJson(json);

  @override
  final SectionListRenderer? sectionListRenderer;

  @override
  String toString() {
    return 'TabRendererContent(sectionListRenderer: $sectionListRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabRendererContentImpl &&
            (identical(other.sectionListRenderer, sectionListRenderer) ||
                other.sectionListRenderer == sectionListRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sectionListRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabRendererContentImplCopyWith<_$TabRendererContentImpl> get copyWith =>
      __$$TabRendererContentImplCopyWithImpl<_$TabRendererContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabRendererContentImplToJson(
      this,
    );
  }
}

abstract class _TabRendererContent implements TabRendererContent {
  const factory _TabRendererContent(
          {final SectionListRenderer? sectionListRenderer}) =
      _$TabRendererContentImpl;

  factory _TabRendererContent.fromJson(Map<String, dynamic> json) =
      _$TabRendererContentImpl.fromJson;

  @override
  SectionListRenderer? get sectionListRenderer;
  @override
  @JsonKey(ignore: true)
  _$$TabRendererContentImplCopyWith<_$TabRendererContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SectionListRenderer _$SectionListRendererFromJson(Map<String, dynamic> json) {
  return _SectionListRenderer.fromJson(json);
}

/// @nodoc
mixin _$SectionListRenderer {
  List<SectionListRendererContent>? get contents =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  Header? get header => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectionListRendererCopyWith<SectionListRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionListRendererCopyWith<$Res> {
  factory $SectionListRendererCopyWith(
          SectionListRenderer value, $Res Function(SectionListRenderer) then) =
      _$SectionListRendererCopyWithImpl<$Res, SectionListRenderer>;
  @useResult
  $Res call(
      {List<SectionListRendererContent>? contents,
      String? trackingParams,
      Header? header});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$SectionListRendererCopyWithImpl<$Res, $Val extends SectionListRenderer>
    implements $SectionListRendererCopyWith<$Res> {
  _$SectionListRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
    Object? trackingParams = freezed,
    Object? header = freezed,
  }) {
    return _then(_value.copyWith(
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SectionListRendererContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $HeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SectionListRendererImplCopyWith<$Res>
    implements $SectionListRendererCopyWith<$Res> {
  factory _$$SectionListRendererImplCopyWith(_$SectionListRendererImpl value,
          $Res Function(_$SectionListRendererImpl) then) =
      __$$SectionListRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SectionListRendererContent>? contents,
      String? trackingParams,
      Header? header});

  @override
  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$SectionListRendererImplCopyWithImpl<$Res>
    extends _$SectionListRendererCopyWithImpl<$Res, _$SectionListRendererImpl>
    implements _$$SectionListRendererImplCopyWith<$Res> {
  __$$SectionListRendererImplCopyWithImpl(_$SectionListRendererImpl _value,
      $Res Function(_$SectionListRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
    Object? trackingParams = freezed,
    Object? header = freezed,
  }) {
    return _then(_$SectionListRendererImpl(
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<SectionListRendererContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionListRendererImpl implements _SectionListRenderer {
  const _$SectionListRendererImpl(
      {final List<SectionListRendererContent>? contents,
      this.trackingParams,
      this.header})
      : _contents = contents;

  factory _$SectionListRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionListRendererImplFromJson(json);

  final List<SectionListRendererContent>? _contents;
  @override
  List<SectionListRendererContent>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? trackingParams;
  @override
  final Header? header;

  @override
  String toString() {
    return 'SectionListRenderer(contents: $contents, trackingParams: $trackingParams, header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionListRendererImpl &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.header, header) || other.header == header));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contents), trackingParams, header);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionListRendererImplCopyWith<_$SectionListRendererImpl> get copyWith =>
      __$$SectionListRendererImplCopyWithImpl<_$SectionListRendererImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionListRendererImplToJson(
      this,
    );
  }
}

abstract class _SectionListRenderer implements SectionListRenderer {
  const factory _SectionListRenderer(
      {final List<SectionListRendererContent>? contents,
      final String? trackingParams,
      final Header? header}) = _$SectionListRendererImpl;

  factory _SectionListRenderer.fromJson(Map<String, dynamic> json) =
      _$SectionListRendererImpl.fromJson;

  @override
  List<SectionListRendererContent>? get contents;
  @override
  String? get trackingParams;
  @override
  Header? get header;
  @override
  @JsonKey(ignore: true)
  _$$SectionListRendererImplCopyWith<_$SectionListRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SectionListRendererContent _$SectionListRendererContentFromJson(
    Map<String, dynamic> json) {
  return _SectionListRendererContent.fromJson(json);
}

/// @nodoc
mixin _$SectionListRendererContent {
  MusicShelfRenderer? get musicShelfRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectionListRendererContentCopyWith<SectionListRendererContent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionListRendererContentCopyWith<$Res> {
  factory $SectionListRendererContentCopyWith(SectionListRendererContent value,
          $Res Function(SectionListRendererContent) then) =
      _$SectionListRendererContentCopyWithImpl<$Res,
          SectionListRendererContent>;
  @useResult
  $Res call({MusicShelfRenderer? musicShelfRenderer});

  $MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer;
}

/// @nodoc
class _$SectionListRendererContentCopyWithImpl<$Res,
        $Val extends SectionListRendererContent>
    implements $SectionListRendererContentCopyWith<$Res> {
  _$SectionListRendererContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicShelfRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicShelfRenderer: freezed == musicShelfRenderer
          ? _value.musicShelfRenderer
          : musicShelfRenderer // ignore: cast_nullable_to_non_nullable
              as MusicShelfRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer {
    if (_value.musicShelfRenderer == null) {
      return null;
    }

    return $MusicShelfRendererCopyWith<$Res>(_value.musicShelfRenderer!,
        (value) {
      return _then(_value.copyWith(musicShelfRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SectionListRendererContentImplCopyWith<$Res>
    implements $SectionListRendererContentCopyWith<$Res> {
  factory _$$SectionListRendererContentImplCopyWith(
          _$SectionListRendererContentImpl value,
          $Res Function(_$SectionListRendererContentImpl) then) =
      __$$SectionListRendererContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MusicShelfRenderer? musicShelfRenderer});

  @override
  $MusicShelfRendererCopyWith<$Res>? get musicShelfRenderer;
}

/// @nodoc
class __$$SectionListRendererContentImplCopyWithImpl<$Res>
    extends _$SectionListRendererContentCopyWithImpl<$Res,
        _$SectionListRendererContentImpl>
    implements _$$SectionListRendererContentImplCopyWith<$Res> {
  __$$SectionListRendererContentImplCopyWithImpl(
      _$SectionListRendererContentImpl _value,
      $Res Function(_$SectionListRendererContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicShelfRenderer = freezed,
  }) {
    return _then(_$SectionListRendererContentImpl(
      musicShelfRenderer: freezed == musicShelfRenderer
          ? _value.musicShelfRenderer
          : musicShelfRenderer // ignore: cast_nullable_to_non_nullable
              as MusicShelfRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SectionListRendererContentImpl implements _SectionListRendererContent {
  const _$SectionListRendererContentImpl({this.musicShelfRenderer});

  factory _$SectionListRendererContentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SectionListRendererContentImplFromJson(json);

  @override
  final MusicShelfRenderer? musicShelfRenderer;

  @override
  String toString() {
    return 'SectionListRendererContent(musicShelfRenderer: $musicShelfRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionListRendererContentImpl &&
            (identical(other.musicShelfRenderer, musicShelfRenderer) ||
                other.musicShelfRenderer == musicShelfRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicShelfRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionListRendererContentImplCopyWith<_$SectionListRendererContentImpl>
      get copyWith => __$$SectionListRendererContentImplCopyWithImpl<
          _$SectionListRendererContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionListRendererContentImplToJson(
      this,
    );
  }
}

abstract class _SectionListRendererContent
    implements SectionListRendererContent {
  const factory _SectionListRendererContent(
          {final MusicShelfRenderer? musicShelfRenderer}) =
      _$SectionListRendererContentImpl;

  factory _SectionListRendererContent.fromJson(Map<String, dynamic> json) =
      _$SectionListRendererContentImpl.fromJson;

  @override
  MusicShelfRenderer? get musicShelfRenderer;
  @override
  @JsonKey(ignore: true)
  _$$SectionListRendererContentImplCopyWith<_$SectionListRendererContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MusicShelfRenderer _$MusicShelfRendererFromJson(Map<String, dynamic> json) {
  return _MusicShelfRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicShelfRenderer {
  Title? get title => throw _privateConstructorUsedError;
  List<MusicShelfRendererContent>? get contents =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  List<Continuation>? get continuations => throw _privateConstructorUsedError;
  ShelfDivider? get shelfDivider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicShelfRendererCopyWith<MusicShelfRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicShelfRendererCopyWith<$Res> {
  factory $MusicShelfRendererCopyWith(
          MusicShelfRenderer value, $Res Function(MusicShelfRenderer) then) =
      _$MusicShelfRendererCopyWithImpl<$Res, MusicShelfRenderer>;
  @useResult
  $Res call(
      {Title? title,
      List<MusicShelfRendererContent>? contents,
      String? trackingParams,
      List<Continuation>? continuations,
      ShelfDivider? shelfDivider});

  $TitleCopyWith<$Res>? get title;
  $ShelfDividerCopyWith<$Res>? get shelfDivider;
}

/// @nodoc
class _$MusicShelfRendererCopyWithImpl<$Res, $Val extends MusicShelfRenderer>
    implements $MusicShelfRendererCopyWith<$Res> {
  _$MusicShelfRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? contents = freezed,
    Object? trackingParams = freezed,
    Object? continuations = freezed,
    Object? shelfDivider = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<MusicShelfRendererContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      continuations: freezed == continuations
          ? _value.continuations
          : continuations // ignore: cast_nullable_to_non_nullable
              as List<Continuation>?,
      shelfDivider: freezed == shelfDivider
          ? _value.shelfDivider
          : shelfDivider // ignore: cast_nullable_to_non_nullable
              as ShelfDivider?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShelfDividerCopyWith<$Res>? get shelfDivider {
    if (_value.shelfDivider == null) {
      return null;
    }

    return $ShelfDividerCopyWith<$Res>(_value.shelfDivider!, (value) {
      return _then(_value.copyWith(shelfDivider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicShelfRendererImplCopyWith<$Res>
    implements $MusicShelfRendererCopyWith<$Res> {
  factory _$$MusicShelfRendererImplCopyWith(_$MusicShelfRendererImpl value,
          $Res Function(_$MusicShelfRendererImpl) then) =
      __$$MusicShelfRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Title? title,
      List<MusicShelfRendererContent>? contents,
      String? trackingParams,
      List<Continuation>? continuations,
      ShelfDivider? shelfDivider});

  @override
  $TitleCopyWith<$Res>? get title;
  @override
  $ShelfDividerCopyWith<$Res>? get shelfDivider;
}

/// @nodoc
class __$$MusicShelfRendererImplCopyWithImpl<$Res>
    extends _$MusicShelfRendererCopyWithImpl<$Res, _$MusicShelfRendererImpl>
    implements _$$MusicShelfRendererImplCopyWith<$Res> {
  __$$MusicShelfRendererImplCopyWithImpl(_$MusicShelfRendererImpl _value,
      $Res Function(_$MusicShelfRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? contents = freezed,
    Object? trackingParams = freezed,
    Object? continuations = freezed,
    Object? shelfDivider = freezed,
  }) {
    return _then(_$MusicShelfRendererImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title?,
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<MusicShelfRendererContent>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      continuations: freezed == continuations
          ? _value._continuations
          : continuations // ignore: cast_nullable_to_non_nullable
              as List<Continuation>?,
      shelfDivider: freezed == shelfDivider
          ? _value.shelfDivider
          : shelfDivider // ignore: cast_nullable_to_non_nullable
              as ShelfDivider?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicShelfRendererImpl implements _MusicShelfRenderer {
  const _$MusicShelfRendererImpl(
      {this.title,
      final List<MusicShelfRendererContent>? contents,
      this.trackingParams,
      final List<Continuation>? continuations,
      this.shelfDivider})
      : _contents = contents,
        _continuations = continuations;

  factory _$MusicShelfRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicShelfRendererImplFromJson(json);

  @override
  final Title? title;
  final List<MusicShelfRendererContent>? _contents;
  @override
  List<MusicShelfRendererContent>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? trackingParams;
  final List<Continuation>? _continuations;
  @override
  List<Continuation>? get continuations {
    final value = _continuations;
    if (value == null) return null;
    if (_continuations is EqualUnmodifiableListView) return _continuations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ShelfDivider? shelfDivider;

  @override
  String toString() {
    return 'MusicShelfRenderer(title: $title, contents: $contents, trackingParams: $trackingParams, continuations: $continuations, shelfDivider: $shelfDivider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicShelfRendererImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            const DeepCollectionEquality()
                .equals(other._continuations, _continuations) &&
            (identical(other.shelfDivider, shelfDivider) ||
                other.shelfDivider == shelfDivider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_contents),
      trackingParams,
      const DeepCollectionEquality().hash(_continuations),
      shelfDivider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicShelfRendererImplCopyWith<_$MusicShelfRendererImpl> get copyWith =>
      __$$MusicShelfRendererImplCopyWithImpl<_$MusicShelfRendererImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicShelfRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicShelfRenderer implements MusicShelfRenderer {
  const factory _MusicShelfRenderer(
      {final Title? title,
      final List<MusicShelfRendererContent>? contents,
      final String? trackingParams,
      final List<Continuation>? continuations,
      final ShelfDivider? shelfDivider}) = _$MusicShelfRendererImpl;

  factory _MusicShelfRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicShelfRendererImpl.fromJson;

  @override
  Title? get title;
  @override
  List<MusicShelfRendererContent>? get contents;
  @override
  String? get trackingParams;
  @override
  List<Continuation>? get continuations;
  @override
  ShelfDivider? get shelfDivider;
  @override
  @JsonKey(ignore: true)
  _$$MusicShelfRendererImplCopyWith<_$MusicShelfRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicResponsiveListItemRenderer _$MusicResponsiveListItemRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicResponsiveListItemRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicResponsiveListItemRenderer {
  String? get trackingParams => throw _privateConstructorUsedError;
  MusicResponsiveListItemRendererThumbnail? get thumbnail =>
      throw _privateConstructorUsedError;
  Overlay? get overlay => throw _privateConstructorUsedError;
  List<FlexColumn>? get flexColumns => throw _privateConstructorUsedError;
  Menu? get menu => throw _privateConstructorUsedError;
  PlaylistItemData? get playlistItemData => throw _privateConstructorUsedError;
  String? get flexColumnDisplayStyle => throw _privateConstructorUsedError;
  String? get itemHeight => throw _privateConstructorUsedError;
  List<Badge>? get badges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicResponsiveListItemRendererCopyWith<MusicResponsiveListItemRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicResponsiveListItemRendererCopyWith<$Res> {
  factory $MusicResponsiveListItemRendererCopyWith(
          MusicResponsiveListItemRenderer value,
          $Res Function(MusicResponsiveListItemRenderer) then) =
      _$MusicResponsiveListItemRendererCopyWithImpl<$Res,
          MusicResponsiveListItemRenderer>;
  @useResult
  $Res call(
      {String? trackingParams,
      MusicResponsiveListItemRendererThumbnail? thumbnail,
      Overlay? overlay,
      List<FlexColumn>? flexColumns,
      Menu? menu,
      PlaylistItemData? playlistItemData,
      String? flexColumnDisplayStyle,
      String? itemHeight,
      List<Badge>? badges});

  $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail;
  $OverlayCopyWith<$Res>? get overlay;
  $MenuCopyWith<$Res>? get menu;
  $PlaylistItemDataCopyWith<$Res>? get playlistItemData;
}

/// @nodoc
class _$MusicResponsiveListItemRendererCopyWithImpl<$Res,
        $Val extends MusicResponsiveListItemRenderer>
    implements $MusicResponsiveListItemRendererCopyWith<$Res> {
  _$MusicResponsiveListItemRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingParams = freezed,
    Object? thumbnail = freezed,
    Object? overlay = freezed,
    Object? flexColumns = freezed,
    Object? menu = freezed,
    Object? playlistItemData = freezed,
    Object? flexColumnDisplayStyle = freezed,
    Object? itemHeight = freezed,
    Object? badges = freezed,
  }) {
    return _then(_value.copyWith(
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MusicResponsiveListItemRendererThumbnail?,
      overlay: freezed == overlay
          ? _value.overlay
          : overlay // ignore: cast_nullable_to_non_nullable
              as Overlay?,
      flexColumns: freezed == flexColumns
          ? _value.flexColumns
          : flexColumns // ignore: cast_nullable_to_non_nullable
              as List<FlexColumn>?,
      menu: freezed == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu?,
      playlistItemData: freezed == playlistItemData
          ? _value.playlistItemData
          : playlistItemData // ignore: cast_nullable_to_non_nullable
              as PlaylistItemData?,
      flexColumnDisplayStyle: freezed == flexColumnDisplayStyle
          ? _value.flexColumnDisplayStyle
          : flexColumnDisplayStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      itemHeight: freezed == itemHeight
          ? _value.itemHeight
          : itemHeight // ignore: cast_nullable_to_non_nullable
              as String?,
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<Badge>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_value.thumbnail == null) {
      return null;
    }

    return $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>(
        _value.thumbnail!, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OverlayCopyWith<$Res>? get overlay {
    if (_value.overlay == null) {
      return null;
    }

    return $OverlayCopyWith<$Res>(_value.overlay!, (value) {
      return _then(_value.copyWith(overlay: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res>? get menu {
    if (_value.menu == null) {
      return null;
    }

    return $MenuCopyWith<$Res>(_value.menu!, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaylistItemDataCopyWith<$Res>? get playlistItemData {
    if (_value.playlistItemData == null) {
      return null;
    }

    return $PlaylistItemDataCopyWith<$Res>(_value.playlistItemData!, (value) {
      return _then(_value.copyWith(playlistItemData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicResponsiveListItemRendererImplCopyWith<$Res>
    implements $MusicResponsiveListItemRendererCopyWith<$Res> {
  factory _$$MusicResponsiveListItemRendererImplCopyWith(
          _$MusicResponsiveListItemRendererImpl value,
          $Res Function(_$MusicResponsiveListItemRendererImpl) then) =
      __$$MusicResponsiveListItemRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? trackingParams,
      MusicResponsiveListItemRendererThumbnail? thumbnail,
      Overlay? overlay,
      List<FlexColumn>? flexColumns,
      Menu? menu,
      PlaylistItemData? playlistItemData,
      String? flexColumnDisplayStyle,
      String? itemHeight,
      List<Badge>? badges});

  @override
  $MusicResponsiveListItemRendererThumbnailCopyWith<$Res>? get thumbnail;
  @override
  $OverlayCopyWith<$Res>? get overlay;
  @override
  $MenuCopyWith<$Res>? get menu;
  @override
  $PlaylistItemDataCopyWith<$Res>? get playlistItemData;
}

/// @nodoc
class __$$MusicResponsiveListItemRendererImplCopyWithImpl<$Res>
    extends _$MusicResponsiveListItemRendererCopyWithImpl<$Res,
        _$MusicResponsiveListItemRendererImpl>
    implements _$$MusicResponsiveListItemRendererImplCopyWith<$Res> {
  __$$MusicResponsiveListItemRendererImplCopyWithImpl(
      _$MusicResponsiveListItemRendererImpl _value,
      $Res Function(_$MusicResponsiveListItemRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingParams = freezed,
    Object? thumbnail = freezed,
    Object? overlay = freezed,
    Object? flexColumns = freezed,
    Object? menu = freezed,
    Object? playlistItemData = freezed,
    Object? flexColumnDisplayStyle = freezed,
    Object? itemHeight = freezed,
    Object? badges = freezed,
  }) {
    return _then(_$MusicResponsiveListItemRendererImpl(
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MusicResponsiveListItemRendererThumbnail?,
      overlay: freezed == overlay
          ? _value.overlay
          : overlay // ignore: cast_nullable_to_non_nullable
              as Overlay?,
      flexColumns: freezed == flexColumns
          ? _value._flexColumns
          : flexColumns // ignore: cast_nullable_to_non_nullable
              as List<FlexColumn>?,
      menu: freezed == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu?,
      playlistItemData: freezed == playlistItemData
          ? _value.playlistItemData
          : playlistItemData // ignore: cast_nullable_to_non_nullable
              as PlaylistItemData?,
      flexColumnDisplayStyle: freezed == flexColumnDisplayStyle
          ? _value.flexColumnDisplayStyle
          : flexColumnDisplayStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      itemHeight: freezed == itemHeight
          ? _value.itemHeight
          : itemHeight // ignore: cast_nullable_to_non_nullable
              as String?,
      badges: freezed == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<Badge>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicResponsiveListItemRendererImpl
    implements _MusicResponsiveListItemRenderer {
  const _$MusicResponsiveListItemRendererImpl(
      {this.trackingParams,
      this.thumbnail,
      this.overlay,
      final List<FlexColumn>? flexColumns,
      this.menu,
      this.playlistItemData,
      this.flexColumnDisplayStyle,
      this.itemHeight,
      final List<Badge>? badges})
      : _flexColumns = flexColumns,
        _badges = badges;

  factory _$MusicResponsiveListItemRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicResponsiveListItemRendererImplFromJson(json);

  @override
  final String? trackingParams;
  @override
  final MusicResponsiveListItemRendererThumbnail? thumbnail;
  @override
  final Overlay? overlay;
  final List<FlexColumn>? _flexColumns;
  @override
  List<FlexColumn>? get flexColumns {
    final value = _flexColumns;
    if (value == null) return null;
    if (_flexColumns is EqualUnmodifiableListView) return _flexColumns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Menu? menu;
  @override
  final PlaylistItemData? playlistItemData;
  @override
  final String? flexColumnDisplayStyle;
  @override
  final String? itemHeight;
  final List<Badge>? _badges;
  @override
  List<Badge>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MusicResponsiveListItemRenderer(trackingParams: $trackingParams, thumbnail: $thumbnail, overlay: $overlay, flexColumns: $flexColumns, menu: $menu, playlistItemData: $playlistItemData, flexColumnDisplayStyle: $flexColumnDisplayStyle, itemHeight: $itemHeight, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicResponsiveListItemRendererImpl &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.overlay, overlay) || other.overlay == overlay) &&
            const DeepCollectionEquality()
                .equals(other._flexColumns, _flexColumns) &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.playlistItemData, playlistItemData) ||
                other.playlistItemData == playlistItemData) &&
            (identical(other.flexColumnDisplayStyle, flexColumnDisplayStyle) ||
                other.flexColumnDisplayStyle == flexColumnDisplayStyle) &&
            (identical(other.itemHeight, itemHeight) ||
                other.itemHeight == itemHeight) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trackingParams,
      thumbnail,
      overlay,
      const DeepCollectionEquality().hash(_flexColumns),
      menu,
      playlistItemData,
      flexColumnDisplayStyle,
      itemHeight,
      const DeepCollectionEquality().hash(_badges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicResponsiveListItemRendererImplCopyWith<
          _$MusicResponsiveListItemRendererImpl>
      get copyWith => __$$MusicResponsiveListItemRendererImplCopyWithImpl<
          _$MusicResponsiveListItemRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicResponsiveListItemRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicResponsiveListItemRenderer
    implements MusicResponsiveListItemRenderer {
  const factory _MusicResponsiveListItemRenderer(
      {final String? trackingParams,
      final MusicResponsiveListItemRendererThumbnail? thumbnail,
      final Overlay? overlay,
      final List<FlexColumn>? flexColumns,
      final Menu? menu,
      final PlaylistItemData? playlistItemData,
      final String? flexColumnDisplayStyle,
      final String? itemHeight,
      final List<Badge>? badges}) = _$MusicResponsiveListItemRendererImpl;

  factory _MusicResponsiveListItemRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicResponsiveListItemRendererImpl.fromJson;

  @override
  String? get trackingParams;
  @override
  MusicResponsiveListItemRendererThumbnail? get thumbnail;
  @override
  Overlay? get overlay;
  @override
  List<FlexColumn>? get flexColumns;
  @override
  Menu? get menu;
  @override
  PlaylistItemData? get playlistItemData;
  @override
  String? get flexColumnDisplayStyle;
  @override
  String? get itemHeight;
  @override
  List<Badge>? get badges;
  @override
  @JsonKey(ignore: true)
  _$$MusicResponsiveListItemRendererImplCopyWith<
          _$MusicResponsiveListItemRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  MusicInlineBadgeRenderer? get musicInlineBadgeRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call({MusicInlineBadgeRenderer? musicInlineBadgeRenderer});

  $MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer;
}

/// @nodoc
class _$BadgeCopyWithImpl<$Res, $Val extends Badge>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicInlineBadgeRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicInlineBadgeRenderer: freezed == musicInlineBadgeRenderer
          ? _value.musicInlineBadgeRenderer
          : musicInlineBadgeRenderer // ignore: cast_nullable_to_non_nullable
              as MusicInlineBadgeRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer {
    if (_value.musicInlineBadgeRenderer == null) {
      return null;
    }

    return $MusicInlineBadgeRendererCopyWith<$Res>(
        _value.musicInlineBadgeRenderer!, (value) {
      return _then(_value.copyWith(musicInlineBadgeRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BadgeImplCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$BadgeImplCopyWith(
          _$BadgeImpl value, $Res Function(_$BadgeImpl) then) =
      __$$BadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MusicInlineBadgeRenderer? musicInlineBadgeRenderer});

  @override
  $MusicInlineBadgeRendererCopyWith<$Res>? get musicInlineBadgeRenderer;
}

/// @nodoc
class __$$BadgeImplCopyWithImpl<$Res>
    extends _$BadgeCopyWithImpl<$Res, _$BadgeImpl>
    implements _$$BadgeImplCopyWith<$Res> {
  __$$BadgeImplCopyWithImpl(
      _$BadgeImpl _value, $Res Function(_$BadgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicInlineBadgeRenderer = freezed,
  }) {
    return _then(_$BadgeImpl(
      musicInlineBadgeRenderer: freezed == musicInlineBadgeRenderer
          ? _value.musicInlineBadgeRenderer
          : musicInlineBadgeRenderer // ignore: cast_nullable_to_non_nullable
              as MusicInlineBadgeRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeImpl implements _Badge {
  const _$BadgeImpl({this.musicInlineBadgeRenderer});

  factory _$BadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeImplFromJson(json);

  @override
  final MusicInlineBadgeRenderer? musicInlineBadgeRenderer;

  @override
  String toString() {
    return 'Badge(musicInlineBadgeRenderer: $musicInlineBadgeRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeImpl &&
            (identical(
                    other.musicInlineBadgeRenderer, musicInlineBadgeRenderer) ||
                other.musicInlineBadgeRenderer == musicInlineBadgeRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicInlineBadgeRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      __$$BadgeImplCopyWithImpl<_$BadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeImplToJson(
      this,
    );
  }
}

abstract class _Badge implements Badge {
  const factory _Badge(
      {final MusicInlineBadgeRenderer? musicInlineBadgeRenderer}) = _$BadgeImpl;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$BadgeImpl.fromJson;

  @override
  MusicInlineBadgeRenderer? get musicInlineBadgeRenderer;
  @override
  @JsonKey(ignore: true)
  _$$BadgeImplCopyWith<_$BadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicInlineBadgeRenderer _$MusicInlineBadgeRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicInlineBadgeRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicInlineBadgeRenderer {
  String? get trackingParams => throw _privateConstructorUsedError;
  Icon? get icon => throw _privateConstructorUsedError;
  Accessibility? get accessibilityData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicInlineBadgeRendererCopyWith<MusicInlineBadgeRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicInlineBadgeRendererCopyWith<$Res> {
  factory $MusicInlineBadgeRendererCopyWith(MusicInlineBadgeRenderer value,
          $Res Function(MusicInlineBadgeRenderer) then) =
      _$MusicInlineBadgeRendererCopyWithImpl<$Res, MusicInlineBadgeRenderer>;
  @useResult
  $Res call(
      {String? trackingParams, Icon? icon, Accessibility? accessibilityData});

  $IconCopyWith<$Res>? get icon;
  $AccessibilityCopyWith<$Res>? get accessibilityData;
}

/// @nodoc
class _$MusicInlineBadgeRendererCopyWithImpl<$Res,
        $Val extends MusicInlineBadgeRenderer>
    implements $MusicInlineBadgeRendererCopyWith<$Res> {
  _$MusicInlineBadgeRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingParams = freezed,
    Object? icon = freezed,
    Object? accessibilityData = freezed,
  }) {
    return _then(_value.copyWith(
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_value.accessibilityData == null) {
      return null;
    }

    return $AccessibilityCopyWith<$Res>(_value.accessibilityData!, (value) {
      return _then(_value.copyWith(accessibilityData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicInlineBadgeRendererImplCopyWith<$Res>
    implements $MusicInlineBadgeRendererCopyWith<$Res> {
  factory _$$MusicInlineBadgeRendererImplCopyWith(
          _$MusicInlineBadgeRendererImpl value,
          $Res Function(_$MusicInlineBadgeRendererImpl) then) =
      __$$MusicInlineBadgeRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? trackingParams, Icon? icon, Accessibility? accessibilityData});

  @override
  $IconCopyWith<$Res>? get icon;
  @override
  $AccessibilityCopyWith<$Res>? get accessibilityData;
}

/// @nodoc
class __$$MusicInlineBadgeRendererImplCopyWithImpl<$Res>
    extends _$MusicInlineBadgeRendererCopyWithImpl<$Res,
        _$MusicInlineBadgeRendererImpl>
    implements _$$MusicInlineBadgeRendererImplCopyWith<$Res> {
  __$$MusicInlineBadgeRendererImplCopyWithImpl(
      _$MusicInlineBadgeRendererImpl _value,
      $Res Function(_$MusicInlineBadgeRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingParams = freezed,
    Object? icon = freezed,
    Object? accessibilityData = freezed,
  }) {
    return _then(_$MusicInlineBadgeRendererImpl(
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicInlineBadgeRendererImpl implements _MusicInlineBadgeRenderer {
  const _$MusicInlineBadgeRendererImpl(
      {this.trackingParams, this.icon, this.accessibilityData});

  factory _$MusicInlineBadgeRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicInlineBadgeRendererImplFromJson(json);

  @override
  final String? trackingParams;
  @override
  final Icon? icon;
  @override
  final Accessibility? accessibilityData;

  @override
  String toString() {
    return 'MusicInlineBadgeRenderer(trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicInlineBadgeRendererImpl &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.accessibilityData, accessibilityData) ||
                other.accessibilityData == accessibilityData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, trackingParams, icon, accessibilityData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicInlineBadgeRendererImplCopyWith<_$MusicInlineBadgeRendererImpl>
      get copyWith => __$$MusicInlineBadgeRendererImplCopyWithImpl<
          _$MusicInlineBadgeRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicInlineBadgeRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicInlineBadgeRenderer implements MusicInlineBadgeRenderer {
  const factory _MusicInlineBadgeRenderer(
      {final String? trackingParams,
      final Icon? icon,
      final Accessibility? accessibilityData}) = _$MusicInlineBadgeRendererImpl;

  factory _MusicInlineBadgeRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicInlineBadgeRendererImpl.fromJson;

  @override
  String? get trackingParams;
  @override
  Icon? get icon;
  @override
  Accessibility? get accessibilityData;
  @override
  @JsonKey(ignore: true)
  _$$MusicInlineBadgeRendererImplCopyWith<_$MusicInlineBadgeRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Accessibility _$AccessibilityFromJson(Map<String, dynamic> json) {
  return _Accessibility.fromJson(json);
}

/// @nodoc
mixin _$Accessibility {
  AccessibilityData? get accessibilityData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessibilityCopyWith<Accessibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessibilityCopyWith<$Res> {
  factory $AccessibilityCopyWith(
          Accessibility value, $Res Function(Accessibility) then) =
      _$AccessibilityCopyWithImpl<$Res, Accessibility>;
  @useResult
  $Res call({AccessibilityData? accessibilityData});

  $AccessibilityDataCopyWith<$Res>? get accessibilityData;
}

/// @nodoc
class _$AccessibilityCopyWithImpl<$Res, $Val extends Accessibility>
    implements $AccessibilityCopyWith<$Res> {
  _$AccessibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessibilityData = freezed,
  }) {
    return _then(_value.copyWith(
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as AccessibilityData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityDataCopyWith<$Res>? get accessibilityData {
    if (_value.accessibilityData == null) {
      return null;
    }

    return $AccessibilityDataCopyWith<$Res>(_value.accessibilityData!, (value) {
      return _then(_value.copyWith(accessibilityData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccessibilityImplCopyWith<$Res>
    implements $AccessibilityCopyWith<$Res> {
  factory _$$AccessibilityImplCopyWith(
          _$AccessibilityImpl value, $Res Function(_$AccessibilityImpl) then) =
      __$$AccessibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccessibilityData? accessibilityData});

  @override
  $AccessibilityDataCopyWith<$Res>? get accessibilityData;
}

/// @nodoc
class __$$AccessibilityImplCopyWithImpl<$Res>
    extends _$AccessibilityCopyWithImpl<$Res, _$AccessibilityImpl>
    implements _$$AccessibilityImplCopyWith<$Res> {
  __$$AccessibilityImplCopyWithImpl(
      _$AccessibilityImpl _value, $Res Function(_$AccessibilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessibilityData = freezed,
  }) {
    return _then(_$AccessibilityImpl(
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as AccessibilityData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessibilityImpl implements _Accessibility {
  const _$AccessibilityImpl({this.accessibilityData});

  factory _$AccessibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessibilityImplFromJson(json);

  @override
  final AccessibilityData? accessibilityData;

  @override
  String toString() {
    return 'Accessibility(accessibilityData: $accessibilityData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessibilityImpl &&
            (identical(other.accessibilityData, accessibilityData) ||
                other.accessibilityData == accessibilityData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessibilityData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessibilityImplCopyWith<_$AccessibilityImpl> get copyWith =>
      __$$AccessibilityImplCopyWithImpl<_$AccessibilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessibilityImplToJson(
      this,
    );
  }
}

abstract class _Accessibility implements Accessibility {
  const factory _Accessibility({final AccessibilityData? accessibilityData}) =
      _$AccessibilityImpl;

  factory _Accessibility.fromJson(Map<String, dynamic> json) =
      _$AccessibilityImpl.fromJson;

  @override
  AccessibilityData? get accessibilityData;
  @override
  @JsonKey(ignore: true)
  _$$AccessibilityImplCopyWith<_$AccessibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccessibilityData _$AccessibilityDataFromJson(Map<String, dynamic> json) {
  return _AccessibilityData.fromJson(json);
}

/// @nodoc
mixin _$AccessibilityData {
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessibilityDataCopyWith<AccessibilityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessibilityDataCopyWith<$Res> {
  factory $AccessibilityDataCopyWith(
          AccessibilityData value, $Res Function(AccessibilityData) then) =
      _$AccessibilityDataCopyWithImpl<$Res, AccessibilityData>;
  @useResult
  $Res call({String? label});
}

/// @nodoc
class _$AccessibilityDataCopyWithImpl<$Res, $Val extends AccessibilityData>
    implements $AccessibilityDataCopyWith<$Res> {
  _$AccessibilityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessibilityDataImplCopyWith<$Res>
    implements $AccessibilityDataCopyWith<$Res> {
  factory _$$AccessibilityDataImplCopyWith(_$AccessibilityDataImpl value,
          $Res Function(_$AccessibilityDataImpl) then) =
      __$$AccessibilityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label});
}

/// @nodoc
class __$$AccessibilityDataImplCopyWithImpl<$Res>
    extends _$AccessibilityDataCopyWithImpl<$Res, _$AccessibilityDataImpl>
    implements _$$AccessibilityDataImplCopyWith<$Res> {
  __$$AccessibilityDataImplCopyWithImpl(_$AccessibilityDataImpl _value,
      $Res Function(_$AccessibilityDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
  }) {
    return _then(_$AccessibilityDataImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessibilityDataImpl implements _AccessibilityData {
  const _$AccessibilityDataImpl({this.label});

  factory _$AccessibilityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessibilityDataImplFromJson(json);

  @override
  final String? label;

  @override
  String toString() {
    return 'AccessibilityData(label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessibilityDataImpl &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessibilityDataImplCopyWith<_$AccessibilityDataImpl> get copyWith =>
      __$$AccessibilityDataImplCopyWithImpl<_$AccessibilityDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessibilityDataImplToJson(
      this,
    );
  }
}

abstract class _AccessibilityData implements AccessibilityData {
  const factory _AccessibilityData({final String? label}) =
      _$AccessibilityDataImpl;

  factory _AccessibilityData.fromJson(Map<String, dynamic> json) =
      _$AccessibilityDataImpl.fromJson;

  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$AccessibilityDataImplCopyWith<_$AccessibilityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Icon _$IconFromJson(Map<String, dynamic> json) {
  return _Icon.fromJson(json);
}

/// @nodoc
mixin _$Icon {
  String? get iconType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IconCopyWith<Icon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconCopyWith<$Res> {
  factory $IconCopyWith(Icon value, $Res Function(Icon) then) =
      _$IconCopyWithImpl<$Res, Icon>;
  @useResult
  $Res call({String? iconType});
}

/// @nodoc
class _$IconCopyWithImpl<$Res, $Val extends Icon>
    implements $IconCopyWith<$Res> {
  _$IconCopyWithImpl(this._value, this._then);

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
abstract class _$$IconImplCopyWith<$Res> implements $IconCopyWith<$Res> {
  factory _$$IconImplCopyWith(
          _$IconImpl value, $Res Function(_$IconImpl) then) =
      __$$IconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? iconType});
}

/// @nodoc
class __$$IconImplCopyWithImpl<$Res>
    extends _$IconCopyWithImpl<$Res, _$IconImpl>
    implements _$$IconImplCopyWith<$Res> {
  __$$IconImplCopyWithImpl(_$IconImpl _value, $Res Function(_$IconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconType = freezed,
  }) {
    return _then(_$IconImpl(
      iconType: freezed == iconType
          ? _value.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IconImpl implements _Icon {
  const _$IconImpl({this.iconType});

  factory _$IconImpl.fromJson(Map<String, dynamic> json) =>
      _$$IconImplFromJson(json);

  @override
  final String? iconType;

  @override
  String toString() {
    return 'Icon(iconType: $iconType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconImpl &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iconType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconImplCopyWith<_$IconImpl> get copyWith =>
      __$$IconImplCopyWithImpl<_$IconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IconImplToJson(
      this,
    );
  }
}

abstract class _Icon implements Icon {
  const factory _Icon({final String? iconType}) = _$IconImpl;

  factory _Icon.fromJson(Map<String, dynamic> json) = _$IconImpl.fromJson;

  @override
  String? get iconType;
  @override
  @JsonKey(ignore: true)
  _$$IconImplCopyWith<_$IconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlexColumn _$FlexColumnFromJson(Map<String, dynamic> json) {
  return _FlexColumn.fromJson(json);
}

/// @nodoc
mixin _$FlexColumn {
  MusicResponsiveListItemFlexColumnRenderer?
      get musicResponsiveListItemFlexColumnRenderer =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlexColumnCopyWith<FlexColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexColumnCopyWith<$Res> {
  factory $FlexColumnCopyWith(
          FlexColumn value, $Res Function(FlexColumn) then) =
      _$FlexColumnCopyWithImpl<$Res, FlexColumn>;
  @useResult
  $Res call(
      {MusicResponsiveListItemFlexColumnRenderer?
          musicResponsiveListItemFlexColumnRenderer});

  $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>?
      get musicResponsiveListItemFlexColumnRenderer;
}

/// @nodoc
class _$FlexColumnCopyWithImpl<$Res, $Val extends FlexColumn>
    implements $FlexColumnCopyWith<$Res> {
  _$FlexColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicResponsiveListItemFlexColumnRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicResponsiveListItemFlexColumnRenderer: freezed ==
              musicResponsiveListItemFlexColumnRenderer
          ? _value.musicResponsiveListItemFlexColumnRenderer
          : musicResponsiveListItemFlexColumnRenderer // ignore: cast_nullable_to_non_nullable
              as MusicResponsiveListItemFlexColumnRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>?
      get musicResponsiveListItemFlexColumnRenderer {
    if (_value.musicResponsiveListItemFlexColumnRenderer == null) {
      return null;
    }

    return $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>(
        _value.musicResponsiveListItemFlexColumnRenderer!, (value) {
      return _then(_value.copyWith(
          musicResponsiveListItemFlexColumnRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlexColumnImplCopyWith<$Res>
    implements $FlexColumnCopyWith<$Res> {
  factory _$$FlexColumnImplCopyWith(
          _$FlexColumnImpl value, $Res Function(_$FlexColumnImpl) then) =
      __$$FlexColumnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MusicResponsiveListItemFlexColumnRenderer?
          musicResponsiveListItemFlexColumnRenderer});

  @override
  $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res>?
      get musicResponsiveListItemFlexColumnRenderer;
}

/// @nodoc
class __$$FlexColumnImplCopyWithImpl<$Res>
    extends _$FlexColumnCopyWithImpl<$Res, _$FlexColumnImpl>
    implements _$$FlexColumnImplCopyWith<$Res> {
  __$$FlexColumnImplCopyWithImpl(
      _$FlexColumnImpl _value, $Res Function(_$FlexColumnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicResponsiveListItemFlexColumnRenderer = freezed,
  }) {
    return _then(_$FlexColumnImpl(
      musicResponsiveListItemFlexColumnRenderer: freezed ==
              musicResponsiveListItemFlexColumnRenderer
          ? _value.musicResponsiveListItemFlexColumnRenderer
          : musicResponsiveListItemFlexColumnRenderer // ignore: cast_nullable_to_non_nullable
              as MusicResponsiveListItemFlexColumnRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlexColumnImpl implements _FlexColumn {
  const _$FlexColumnImpl({this.musicResponsiveListItemFlexColumnRenderer});

  factory _$FlexColumnImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlexColumnImplFromJson(json);

  @override
  final MusicResponsiveListItemFlexColumnRenderer?
      musicResponsiveListItemFlexColumnRenderer;

  @override
  String toString() {
    return 'FlexColumn(musicResponsiveListItemFlexColumnRenderer: $musicResponsiveListItemFlexColumnRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlexColumnImpl &&
            (identical(other.musicResponsiveListItemFlexColumnRenderer,
                    musicResponsiveListItemFlexColumnRenderer) ||
                other.musicResponsiveListItemFlexColumnRenderer ==
                    musicResponsiveListItemFlexColumnRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, musicResponsiveListItemFlexColumnRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlexColumnImplCopyWith<_$FlexColumnImpl> get copyWith =>
      __$$FlexColumnImplCopyWithImpl<_$FlexColumnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlexColumnImplToJson(
      this,
    );
  }
}

abstract class _FlexColumn implements FlexColumn {
  const factory _FlexColumn(
      {final MusicResponsiveListItemFlexColumnRenderer?
          musicResponsiveListItemFlexColumnRenderer}) = _$FlexColumnImpl;

  factory _FlexColumn.fromJson(Map<String, dynamic> json) =
      _$FlexColumnImpl.fromJson;

  @override
  MusicResponsiveListItemFlexColumnRenderer?
      get musicResponsiveListItemFlexColumnRenderer;
  @override
  @JsonKey(ignore: true)
  _$$FlexColumnImplCopyWith<_$FlexColumnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicResponsiveListItemFlexColumnRenderer
    _$MusicResponsiveListItemFlexColumnRendererFromJson(
        Map<String, dynamic> json) {
  return _MusicResponsiveListItemFlexColumnRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicResponsiveListItemFlexColumnRenderer {
  Text? get text => throw _privateConstructorUsedError;
  String? get displayPriority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicResponsiveListItemFlexColumnRendererCopyWith<
          MusicResponsiveListItemFlexColumnRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  factory $MusicResponsiveListItemFlexColumnRendererCopyWith(
          MusicResponsiveListItemFlexColumnRenderer value,
          $Res Function(MusicResponsiveListItemFlexColumnRenderer) then) =
      _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<$Res,
          MusicResponsiveListItemFlexColumnRenderer>;
  @useResult
  $Res call({Text? text, String? displayPriority});

  $TextCopyWith<$Res>? get text;
}

/// @nodoc
class _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<$Res,
        $Val extends MusicResponsiveListItemFlexColumnRenderer>
    implements $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? displayPriority = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Text?,
      displayPriority: freezed == displayPriority
          ? _value.displayPriority
          : displayPriority // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $TextCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicResponsiveListItemFlexColumnRendererImplCopyWith<$Res>
    implements $MusicResponsiveListItemFlexColumnRendererCopyWith<$Res> {
  factory _$$MusicResponsiveListItemFlexColumnRendererImplCopyWith(
          _$MusicResponsiveListItemFlexColumnRendererImpl value,
          $Res Function(_$MusicResponsiveListItemFlexColumnRendererImpl) then) =
      __$$MusicResponsiveListItemFlexColumnRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Text? text, String? displayPriority});

  @override
  $TextCopyWith<$Res>? get text;
}

/// @nodoc
class __$$MusicResponsiveListItemFlexColumnRendererImplCopyWithImpl<$Res>
    extends _$MusicResponsiveListItemFlexColumnRendererCopyWithImpl<$Res,
        _$MusicResponsiveListItemFlexColumnRendererImpl>
    implements _$$MusicResponsiveListItemFlexColumnRendererImplCopyWith<$Res> {
  __$$MusicResponsiveListItemFlexColumnRendererImplCopyWithImpl(
      _$MusicResponsiveListItemFlexColumnRendererImpl _value,
      $Res Function(_$MusicResponsiveListItemFlexColumnRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? displayPriority = freezed,
  }) {
    return _then(_$MusicResponsiveListItemFlexColumnRendererImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Text?,
      displayPriority: freezed == displayPriority
          ? _value.displayPriority
          : displayPriority // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicResponsiveListItemFlexColumnRendererImpl
    implements _MusicResponsiveListItemFlexColumnRenderer {
  const _$MusicResponsiveListItemFlexColumnRendererImpl(
      {this.text, this.displayPriority});

  factory _$MusicResponsiveListItemFlexColumnRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicResponsiveListItemFlexColumnRendererImplFromJson(json);

  @override
  final Text? text;
  @override
  final String? displayPriority;

  @override
  String toString() {
    return 'MusicResponsiveListItemFlexColumnRenderer(text: $text, displayPriority: $displayPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicResponsiveListItemFlexColumnRendererImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.displayPriority, displayPriority) ||
                other.displayPriority == displayPriority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, displayPriority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicResponsiveListItemFlexColumnRendererImplCopyWith<
          _$MusicResponsiveListItemFlexColumnRendererImpl>
      get copyWith =>
          __$$MusicResponsiveListItemFlexColumnRendererImplCopyWithImpl<
                  _$MusicResponsiveListItemFlexColumnRendererImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicResponsiveListItemFlexColumnRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicResponsiveListItemFlexColumnRenderer
    implements MusicResponsiveListItemFlexColumnRenderer {
  const factory _MusicResponsiveListItemFlexColumnRenderer(
          {final Text? text, final String? displayPriority}) =
      _$MusicResponsiveListItemFlexColumnRendererImpl;

  factory _MusicResponsiveListItemFlexColumnRenderer.fromJson(
          Map<String, dynamic> json) =
      _$MusicResponsiveListItemFlexColumnRendererImpl.fromJson;

  @override
  Text? get text;
  @override
  String? get displayPriority;
  @override
  @JsonKey(ignore: true)
  _$$MusicResponsiveListItemFlexColumnRendererImplCopyWith<
          _$MusicResponsiveListItemFlexColumnRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Text _$TextFromJson(Map<String, dynamic> json) {
  return _Text.fromJson(json);
}

/// @nodoc
mixin _$Text {
  List<PurpleRun>? get runs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextCopyWith<Text> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextCopyWith<$Res> {
  factory $TextCopyWith(Text value, $Res Function(Text) then) =
      _$TextCopyWithImpl<$Res, Text>;
  @useResult
  $Res call({List<PurpleRun>? runs});
}

/// @nodoc
class _$TextCopyWithImpl<$Res, $Val extends Text>
    implements $TextCopyWith<$Res> {
  _$TextCopyWithImpl(this._value, this._then);

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
              as List<PurpleRun>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextImplCopyWith<$Res> implements $TextCopyWith<$Res> {
  factory _$$TextImplCopyWith(
          _$TextImpl value, $Res Function(_$TextImpl) then) =
      __$$TextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PurpleRun>? runs});
}

/// @nodoc
class __$$TextImplCopyWithImpl<$Res>
    extends _$TextCopyWithImpl<$Res, _$TextImpl>
    implements _$$TextImplCopyWith<$Res> {
  __$$TextImplCopyWithImpl(_$TextImpl _value, $Res Function(_$TextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runs = freezed,
  }) {
    return _then(_$TextImpl(
      runs: freezed == runs
          ? _value._runs
          : runs // ignore: cast_nullable_to_non_nullable
              as List<PurpleRun>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextImpl implements _Text {
  const _$TextImpl({final List<PurpleRun>? runs}) : _runs = runs;

  factory _$TextImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextImplFromJson(json);

  final List<PurpleRun>? _runs;
  @override
  List<PurpleRun>? get runs {
    final value = _runs;
    if (value == null) return null;
    if (_runs is EqualUnmodifiableListView) return _runs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Text(runs: $runs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextImpl &&
            const DeepCollectionEquality().equals(other._runs, _runs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_runs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextImplCopyWith<_$TextImpl> get copyWith =>
      __$$TextImplCopyWithImpl<_$TextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextImplToJson(
      this,
    );
  }
}

abstract class _Text implements Text {
  const factory _Text({final List<PurpleRun>? runs}) = _$TextImpl;

  factory _Text.fromJson(Map<String, dynamic> json) = _$TextImpl.fromJson;

  @override
  List<PurpleRun>? get runs;
  @override
  @JsonKey(ignore: true)
  _$$TextImplCopyWith<_$TextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurpleRun _$PurpleRunFromJson(Map<String, dynamic> json) {
  return _PurpleRun.fromJson(json);
}

/// @nodoc
mixin _$PurpleRun {
  String? get text => throw _privateConstructorUsedError;
  RunNavigationEndpoint? get navigationEndpoint =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurpleRunCopyWith<PurpleRun> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurpleRunCopyWith<$Res> {
  factory $PurpleRunCopyWith(PurpleRun value, $Res Function(PurpleRun) then) =
      _$PurpleRunCopyWithImpl<$Res, PurpleRun>;
  @useResult
  $Res call({String? text, RunNavigationEndpoint? navigationEndpoint});

  $RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint;
}

/// @nodoc
class _$PurpleRunCopyWithImpl<$Res, $Val extends PurpleRun>
    implements $PurpleRunCopyWith<$Res> {
  _$PurpleRunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? navigationEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as RunNavigationEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_value.navigationEndpoint == null) {
      return null;
    }

    return $RunNavigationEndpointCopyWith<$Res>(_value.navigationEndpoint!,
        (value) {
      return _then(_value.copyWith(navigationEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurpleRunImplCopyWith<$Res>
    implements $PurpleRunCopyWith<$Res> {
  factory _$$PurpleRunImplCopyWith(
          _$PurpleRunImpl value, $Res Function(_$PurpleRunImpl) then) =
      __$$PurpleRunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, RunNavigationEndpoint? navigationEndpoint});

  @override
  $RunNavigationEndpointCopyWith<$Res>? get navigationEndpoint;
}

/// @nodoc
class __$$PurpleRunImplCopyWithImpl<$Res>
    extends _$PurpleRunCopyWithImpl<$Res, _$PurpleRunImpl>
    implements _$$PurpleRunImplCopyWith<$Res> {
  __$$PurpleRunImplCopyWithImpl(
      _$PurpleRunImpl _value, $Res Function(_$PurpleRunImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? navigationEndpoint = freezed,
  }) {
    return _then(_$PurpleRunImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as RunNavigationEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurpleRunImpl implements _PurpleRun {
  const _$PurpleRunImpl({this.text, this.navigationEndpoint});

  factory _$PurpleRunImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurpleRunImplFromJson(json);

  @override
  final String? text;
  @override
  final RunNavigationEndpoint? navigationEndpoint;

  @override
  String toString() {
    return 'PurpleRun(text: $text, navigationEndpoint: $navigationEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurpleRunImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, navigationEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurpleRunImplCopyWith<_$PurpleRunImpl> get copyWith =>
      __$$PurpleRunImplCopyWithImpl<_$PurpleRunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurpleRunImplToJson(
      this,
    );
  }
}

abstract class _PurpleRun implements PurpleRun {
  const factory _PurpleRun(
      {final String? text,
      final RunNavigationEndpoint? navigationEndpoint}) = _$PurpleRunImpl;

  factory _PurpleRun.fromJson(Map<String, dynamic> json) =
      _$PurpleRunImpl.fromJson;

  @override
  String? get text;
  @override
  RunNavigationEndpoint? get navigationEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$PurpleRunImplCopyWith<_$PurpleRunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RunNavigationEndpoint _$RunNavigationEndpointFromJson(
    Map<String, dynamic> json) {
  return _RunNavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$RunNavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  PlayNavigationEndpointWatchEndpoint? get watchEndpoint =>
      throw _privateConstructorUsedError;
  BrowseEndpoint? get browseEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunNavigationEndpointCopyWith<RunNavigationEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunNavigationEndpointCopyWith<$Res> {
  factory $RunNavigationEndpointCopyWith(RunNavigationEndpoint value,
          $Res Function(RunNavigationEndpoint) then) =
      _$RunNavigationEndpointCopyWithImpl<$Res, RunNavigationEndpoint>;
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PlayNavigationEndpointWatchEndpoint? watchEndpoint,
      BrowseEndpoint? browseEndpoint});

  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint;
}

/// @nodoc
class _$RunNavigationEndpointCopyWithImpl<$Res,
        $Val extends RunNavigationEndpoint>
    implements $RunNavigationEndpointCopyWith<$Res> {
  _$RunNavigationEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
    Object? browseEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpointWatchEndpoint?,
      browseEndpoint: freezed == browseEndpoint
          ? _value.browseEndpoint
          : browseEndpoint // ignore: cast_nullable_to_non_nullable
              as BrowseEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_value.watchEndpoint == null) {
      return null;
    }

    return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(
        _value.watchEndpoint!, (value) {
      return _then(_value.copyWith(watchEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_value.browseEndpoint == null) {
      return null;
    }

    return $BrowseEndpointCopyWith<$Res>(_value.browseEndpoint!, (value) {
      return _then(_value.copyWith(browseEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RunNavigationEndpointImplCopyWith<$Res>
    implements $RunNavigationEndpointCopyWith<$Res> {
  factory _$$RunNavigationEndpointImplCopyWith(
          _$RunNavigationEndpointImpl value,
          $Res Function(_$RunNavigationEndpointImpl) then) =
      __$$RunNavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PlayNavigationEndpointWatchEndpoint? watchEndpoint,
      BrowseEndpoint? browseEndpoint});

  @override
  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;
  @override
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint;
}

/// @nodoc
class __$$RunNavigationEndpointImplCopyWithImpl<$Res>
    extends _$RunNavigationEndpointCopyWithImpl<$Res,
        _$RunNavigationEndpointImpl>
    implements _$$RunNavigationEndpointImplCopyWith<$Res> {
  __$$RunNavigationEndpointImplCopyWithImpl(_$RunNavigationEndpointImpl _value,
      $Res Function(_$RunNavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
    Object? browseEndpoint = freezed,
  }) {
    return _then(_$RunNavigationEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpointWatchEndpoint?,
      browseEndpoint: freezed == browseEndpoint
          ? _value.browseEndpoint
          : browseEndpoint // ignore: cast_nullable_to_non_nullable
              as BrowseEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunNavigationEndpointImpl implements _RunNavigationEndpoint {
  const _$RunNavigationEndpointImpl(
      {this.clickTrackingParams, this.watchEndpoint, this.browseEndpoint});

  factory _$RunNavigationEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunNavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final PlayNavigationEndpointWatchEndpoint? watchEndpoint;
  @override
  final BrowseEndpoint? browseEndpoint;

  @override
  String toString() {
    return 'RunNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, browseEndpoint: $browseEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunNavigationEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.watchEndpoint, watchEndpoint) ||
                other.watchEndpoint == watchEndpoint) &&
            (identical(other.browseEndpoint, browseEndpoint) ||
                other.browseEndpoint == browseEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, clickTrackingParams, watchEndpoint, browseEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunNavigationEndpointImplCopyWith<_$RunNavigationEndpointImpl>
      get copyWith => __$$RunNavigationEndpointImplCopyWithImpl<
          _$RunNavigationEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunNavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _RunNavigationEndpoint implements RunNavigationEndpoint {
  const factory _RunNavigationEndpoint(
      {final String? clickTrackingParams,
      final PlayNavigationEndpointWatchEndpoint? watchEndpoint,
      final BrowseEndpoint? browseEndpoint}) = _$RunNavigationEndpointImpl;

  factory _RunNavigationEndpoint.fromJson(Map<String, dynamic> json) =
      _$RunNavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  PlayNavigationEndpointWatchEndpoint? get watchEndpoint;
  @override
  BrowseEndpoint? get browseEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$RunNavigationEndpointImplCopyWith<_$RunNavigationEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BrowseEndpoint _$BrowseEndpointFromJson(Map<String, dynamic> json) {
  return _BrowseEndpoint.fromJson(json);
}

/// @nodoc
mixin _$BrowseEndpoint {
  String? get browseId => throw _privateConstructorUsedError;
  BrowseEndpointContextSupportedConfigs?
      get browseEndpointContextSupportedConfigs =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowseEndpointCopyWith<BrowseEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowseEndpointCopyWith<$Res> {
  factory $BrowseEndpointCopyWith(
          BrowseEndpoint value, $Res Function(BrowseEndpoint) then) =
      _$BrowseEndpointCopyWithImpl<$Res, BrowseEndpoint>;
  @useResult
  $Res call(
      {String? browseId,
      BrowseEndpointContextSupportedConfigs?
          browseEndpointContextSupportedConfigs});

  $BrowseEndpointContextSupportedConfigsCopyWith<$Res>?
      get browseEndpointContextSupportedConfigs;
}

/// @nodoc
class _$BrowseEndpointCopyWithImpl<$Res, $Val extends BrowseEndpoint>
    implements $BrowseEndpointCopyWith<$Res> {
  _$BrowseEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseId = freezed,
    Object? browseEndpointContextSupportedConfigs = freezed,
  }) {
    return _then(_value.copyWith(
      browseId: freezed == browseId
          ? _value.browseId
          : browseId // ignore: cast_nullable_to_non_nullable
              as String?,
      browseEndpointContextSupportedConfigs: freezed ==
              browseEndpointContextSupportedConfigs
          ? _value.browseEndpointContextSupportedConfigs
          : browseEndpointContextSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as BrowseEndpointContextSupportedConfigs?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowseEndpointContextSupportedConfigsCopyWith<$Res>?
      get browseEndpointContextSupportedConfigs {
    if (_value.browseEndpointContextSupportedConfigs == null) {
      return null;
    }

    return $BrowseEndpointContextSupportedConfigsCopyWith<$Res>(
        _value.browseEndpointContextSupportedConfigs!, (value) {
      return _then(_value.copyWith(browseEndpointContextSupportedConfigs: value)
          as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrowseEndpointImplCopyWith<$Res>
    implements $BrowseEndpointCopyWith<$Res> {
  factory _$$BrowseEndpointImplCopyWith(_$BrowseEndpointImpl value,
          $Res Function(_$BrowseEndpointImpl) then) =
      __$$BrowseEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? browseId,
      BrowseEndpointContextSupportedConfigs?
          browseEndpointContextSupportedConfigs});

  @override
  $BrowseEndpointContextSupportedConfigsCopyWith<$Res>?
      get browseEndpointContextSupportedConfigs;
}

/// @nodoc
class __$$BrowseEndpointImplCopyWithImpl<$Res>
    extends _$BrowseEndpointCopyWithImpl<$Res, _$BrowseEndpointImpl>
    implements _$$BrowseEndpointImplCopyWith<$Res> {
  __$$BrowseEndpointImplCopyWithImpl(
      _$BrowseEndpointImpl _value, $Res Function(_$BrowseEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseId = freezed,
    Object? browseEndpointContextSupportedConfigs = freezed,
  }) {
    return _then(_$BrowseEndpointImpl(
      browseId: freezed == browseId
          ? _value.browseId
          : browseId // ignore: cast_nullable_to_non_nullable
              as String?,
      browseEndpointContextSupportedConfigs: freezed ==
              browseEndpointContextSupportedConfigs
          ? _value.browseEndpointContextSupportedConfigs
          : browseEndpointContextSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as BrowseEndpointContextSupportedConfigs?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowseEndpointImpl implements _BrowseEndpoint {
  const _$BrowseEndpointImpl(
      {this.browseId, this.browseEndpointContextSupportedConfigs});

  factory _$BrowseEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrowseEndpointImplFromJson(json);

  @override
  final String? browseId;
  @override
  final BrowseEndpointContextSupportedConfigs?
      browseEndpointContextSupportedConfigs;

  @override
  String toString() {
    return 'BrowseEndpoint(browseId: $browseId, browseEndpointContextSupportedConfigs: $browseEndpointContextSupportedConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowseEndpointImpl &&
            (identical(other.browseId, browseId) ||
                other.browseId == browseId) &&
            (identical(other.browseEndpointContextSupportedConfigs,
                    browseEndpointContextSupportedConfigs) ||
                other.browseEndpointContextSupportedConfigs ==
                    browseEndpointContextSupportedConfigs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, browseId, browseEndpointContextSupportedConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowseEndpointImplCopyWith<_$BrowseEndpointImpl> get copyWith =>
      __$$BrowseEndpointImplCopyWithImpl<_$BrowseEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowseEndpointImplToJson(
      this,
    );
  }
}

abstract class _BrowseEndpoint implements BrowseEndpoint {
  const factory _BrowseEndpoint(
      {final String? browseId,
      final BrowseEndpointContextSupportedConfigs?
          browseEndpointContextSupportedConfigs}) = _$BrowseEndpointImpl;

  factory _BrowseEndpoint.fromJson(Map<String, dynamic> json) =
      _$BrowseEndpointImpl.fromJson;

  @override
  String? get browseId;
  @override
  BrowseEndpointContextSupportedConfigs?
      get browseEndpointContextSupportedConfigs;
  @override
  @JsonKey(ignore: true)
  _$$BrowseEndpointImplCopyWith<_$BrowseEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrowseEndpointContextSupportedConfigs
    _$BrowseEndpointContextSupportedConfigsFromJson(Map<String, dynamic> json) {
  return _BrowseEndpointContextSupportedConfigs.fromJson(json);
}

/// @nodoc
mixin _$BrowseEndpointContextSupportedConfigs {
  BrowseEndpointContextMusicConfig? get browseEndpointContextMusicConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowseEndpointContextSupportedConfigsCopyWith<
          BrowseEndpointContextSupportedConfigs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  factory $BrowseEndpointContextSupportedConfigsCopyWith(
          BrowseEndpointContextSupportedConfigs value,
          $Res Function(BrowseEndpointContextSupportedConfigs) then) =
      _$BrowseEndpointContextSupportedConfigsCopyWithImpl<$Res,
          BrowseEndpointContextSupportedConfigs>;
  @useResult
  $Res call(
      {BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig});

  $BrowseEndpointContextMusicConfigCopyWith<$Res>?
      get browseEndpointContextMusicConfig;
}

/// @nodoc
class _$BrowseEndpointContextSupportedConfigsCopyWithImpl<$Res,
        $Val extends BrowseEndpointContextSupportedConfigs>
    implements $BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  _$BrowseEndpointContextSupportedConfigsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseEndpointContextMusicConfig = freezed,
  }) {
    return _then(_value.copyWith(
      browseEndpointContextMusicConfig: freezed ==
              browseEndpointContextMusicConfig
          ? _value.browseEndpointContextMusicConfig
          : browseEndpointContextMusicConfig // ignore: cast_nullable_to_non_nullable
              as BrowseEndpointContextMusicConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowseEndpointContextMusicConfigCopyWith<$Res>?
      get browseEndpointContextMusicConfig {
    if (_value.browseEndpointContextMusicConfig == null) {
      return null;
    }

    return $BrowseEndpointContextMusicConfigCopyWith<$Res>(
        _value.browseEndpointContextMusicConfig!, (value) {
      return _then(
          _value.copyWith(browseEndpointContextMusicConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrowseEndpointContextSupportedConfigsImplCopyWith<$Res>
    implements $BrowseEndpointContextSupportedConfigsCopyWith<$Res> {
  factory _$$BrowseEndpointContextSupportedConfigsImplCopyWith(
          _$BrowseEndpointContextSupportedConfigsImpl value,
          $Res Function(_$BrowseEndpointContextSupportedConfigsImpl) then) =
      __$$BrowseEndpointContextSupportedConfigsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig});

  @override
  $BrowseEndpointContextMusicConfigCopyWith<$Res>?
      get browseEndpointContextMusicConfig;
}

/// @nodoc
class __$$BrowseEndpointContextSupportedConfigsImplCopyWithImpl<$Res>
    extends _$BrowseEndpointContextSupportedConfigsCopyWithImpl<$Res,
        _$BrowseEndpointContextSupportedConfigsImpl>
    implements _$$BrowseEndpointContextSupportedConfigsImplCopyWith<$Res> {
  __$$BrowseEndpointContextSupportedConfigsImplCopyWithImpl(
      _$BrowseEndpointContextSupportedConfigsImpl _value,
      $Res Function(_$BrowseEndpointContextSupportedConfigsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseEndpointContextMusicConfig = freezed,
  }) {
    return _then(_$BrowseEndpointContextSupportedConfigsImpl(
      browseEndpointContextMusicConfig: freezed ==
              browseEndpointContextMusicConfig
          ? _value.browseEndpointContextMusicConfig
          : browseEndpointContextMusicConfig // ignore: cast_nullable_to_non_nullable
              as BrowseEndpointContextMusicConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowseEndpointContextSupportedConfigsImpl
    implements _BrowseEndpointContextSupportedConfigs {
  const _$BrowseEndpointContextSupportedConfigsImpl(
      {this.browseEndpointContextMusicConfig});

  factory _$BrowseEndpointContextSupportedConfigsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BrowseEndpointContextSupportedConfigsImplFromJson(json);

  @override
  final BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

  @override
  String toString() {
    return 'BrowseEndpointContextSupportedConfigs(browseEndpointContextMusicConfig: $browseEndpointContextMusicConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowseEndpointContextSupportedConfigsImpl &&
            (identical(other.browseEndpointContextMusicConfig,
                    browseEndpointContextMusicConfig) ||
                other.browseEndpointContextMusicConfig ==
                    browseEndpointContextMusicConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, browseEndpointContextMusicConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowseEndpointContextSupportedConfigsImplCopyWith<
          _$BrowseEndpointContextSupportedConfigsImpl>
      get copyWith => __$$BrowseEndpointContextSupportedConfigsImplCopyWithImpl<
          _$BrowseEndpointContextSupportedConfigsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowseEndpointContextSupportedConfigsImplToJson(
      this,
    );
  }
}

abstract class _BrowseEndpointContextSupportedConfigs
    implements BrowseEndpointContextSupportedConfigs {
  const factory _BrowseEndpointContextSupportedConfigs(
          {final BrowseEndpointContextMusicConfig?
              browseEndpointContextMusicConfig}) =
      _$BrowseEndpointContextSupportedConfigsImpl;

  factory _BrowseEndpointContextSupportedConfigs.fromJson(
          Map<String, dynamic> json) =
      _$BrowseEndpointContextSupportedConfigsImpl.fromJson;

  @override
  BrowseEndpointContextMusicConfig? get browseEndpointContextMusicConfig;
  @override
  @JsonKey(ignore: true)
  _$$BrowseEndpointContextSupportedConfigsImplCopyWith<
          _$BrowseEndpointContextSupportedConfigsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BrowseEndpointContextMusicConfig _$BrowseEndpointContextMusicConfigFromJson(
    Map<String, dynamic> json) {
  return _BrowseEndpointContextMusicConfig.fromJson(json);
}

/// @nodoc
mixin _$BrowseEndpointContextMusicConfig {
  String? get pageType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowseEndpointContextMusicConfigCopyWith<BrowseEndpointContextMusicConfig>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowseEndpointContextMusicConfigCopyWith<$Res> {
  factory $BrowseEndpointContextMusicConfigCopyWith(
          BrowseEndpointContextMusicConfig value,
          $Res Function(BrowseEndpointContextMusicConfig) then) =
      _$BrowseEndpointContextMusicConfigCopyWithImpl<$Res,
          BrowseEndpointContextMusicConfig>;
  @useResult
  $Res call({String? pageType});
}

/// @nodoc
class _$BrowseEndpointContextMusicConfigCopyWithImpl<$Res,
        $Val extends BrowseEndpointContextMusicConfig>
    implements $BrowseEndpointContextMusicConfigCopyWith<$Res> {
  _$BrowseEndpointContextMusicConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = freezed,
  }) {
    return _then(_value.copyWith(
      pageType: freezed == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrowseEndpointContextMusicConfigImplCopyWith<$Res>
    implements $BrowseEndpointContextMusicConfigCopyWith<$Res> {
  factory _$$BrowseEndpointContextMusicConfigImplCopyWith(
          _$BrowseEndpointContextMusicConfigImpl value,
          $Res Function(_$BrowseEndpointContextMusicConfigImpl) then) =
      __$$BrowseEndpointContextMusicConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? pageType});
}

/// @nodoc
class __$$BrowseEndpointContextMusicConfigImplCopyWithImpl<$Res>
    extends _$BrowseEndpointContextMusicConfigCopyWithImpl<$Res,
        _$BrowseEndpointContextMusicConfigImpl>
    implements _$$BrowseEndpointContextMusicConfigImplCopyWith<$Res> {
  __$$BrowseEndpointContextMusicConfigImplCopyWithImpl(
      _$BrowseEndpointContextMusicConfigImpl _value,
      $Res Function(_$BrowseEndpointContextMusicConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = freezed,
  }) {
    return _then(_$BrowseEndpointContextMusicConfigImpl(
      pageType: freezed == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowseEndpointContextMusicConfigImpl
    implements _BrowseEndpointContextMusicConfig {
  const _$BrowseEndpointContextMusicConfigImpl({this.pageType});

  factory _$BrowseEndpointContextMusicConfigImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BrowseEndpointContextMusicConfigImplFromJson(json);

  @override
  final String? pageType;

  @override
  String toString() {
    return 'BrowseEndpointContextMusicConfig(pageType: $pageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowseEndpointContextMusicConfigImpl &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowseEndpointContextMusicConfigImplCopyWith<
          _$BrowseEndpointContextMusicConfigImpl>
      get copyWith => __$$BrowseEndpointContextMusicConfigImplCopyWithImpl<
          _$BrowseEndpointContextMusicConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowseEndpointContextMusicConfigImplToJson(
      this,
    );
  }
}

abstract class _BrowseEndpointContextMusicConfig
    implements BrowseEndpointContextMusicConfig {
  const factory _BrowseEndpointContextMusicConfig({final String? pageType}) =
      _$BrowseEndpointContextMusicConfigImpl;

  factory _BrowseEndpointContextMusicConfig.fromJson(
          Map<String, dynamic> json) =
      _$BrowseEndpointContextMusicConfigImpl.fromJson;

  @override
  String? get pageType;
  @override
  @JsonKey(ignore: true)
  _$$BrowseEndpointContextMusicConfigImplCopyWith<
          _$BrowseEndpointContextMusicConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlayNavigationEndpointWatchEndpoint
    _$PlayNavigationEndpointWatchEndpointFromJson(Map<String, dynamic> json) {
  return _PlayNavigationEndpointWatchEndpoint.fromJson(json);
}

/// @nodoc
mixin _$PlayNavigationEndpointWatchEndpoint {
  String? get videoId => throw _privateConstructorUsedError;
  WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayNavigationEndpointWatchEndpointCopyWith<
          PlayNavigationEndpointWatchEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  factory $PlayNavigationEndpointWatchEndpointCopyWith(
          PlayNavigationEndpointWatchEndpoint value,
          $Res Function(PlayNavigationEndpointWatchEndpoint) then) =
      _$PlayNavigationEndpointWatchEndpointCopyWithImpl<$Res,
          PlayNavigationEndpointWatchEndpoint>;
  @useResult
  $Res call(
      {String? videoId,
      WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs});

  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs;
}

/// @nodoc
class _$PlayNavigationEndpointWatchEndpointCopyWithImpl<$Res,
        $Val extends PlayNavigationEndpointWatchEndpoint>
    implements $PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  _$PlayNavigationEndpointWatchEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? watchEndpointMusicSupportedConfigs = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpointMusicSupportedConfigs: freezed ==
              watchEndpointMusicSupportedConfigs
          ? _value.watchEndpointMusicSupportedConfigs
          : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicSupportedConfigs?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs {
    if (_value.watchEndpointMusicSupportedConfigs == null) {
      return null;
    }

    return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(
        _value.watchEndpointMusicSupportedConfigs!, (value) {
      return _then(
          _value.copyWith(watchEndpointMusicSupportedConfigs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayNavigationEndpointWatchEndpointImplCopyWith<$Res>
    implements $PlayNavigationEndpointWatchEndpointCopyWith<$Res> {
  factory _$$PlayNavigationEndpointWatchEndpointImplCopyWith(
          _$PlayNavigationEndpointWatchEndpointImpl value,
          $Res Function(_$PlayNavigationEndpointWatchEndpointImpl) then) =
      __$$PlayNavigationEndpointWatchEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? videoId,
      WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs});

  @override
  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs;
}

/// @nodoc
class __$$PlayNavigationEndpointWatchEndpointImplCopyWithImpl<$Res>
    extends _$PlayNavigationEndpointWatchEndpointCopyWithImpl<$Res,
        _$PlayNavigationEndpointWatchEndpointImpl>
    implements _$$PlayNavigationEndpointWatchEndpointImplCopyWith<$Res> {
  __$$PlayNavigationEndpointWatchEndpointImplCopyWithImpl(
      _$PlayNavigationEndpointWatchEndpointImpl _value,
      $Res Function(_$PlayNavigationEndpointWatchEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? watchEndpointMusicSupportedConfigs = freezed,
  }) {
    return _then(_$PlayNavigationEndpointWatchEndpointImpl(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpointMusicSupportedConfigs: freezed ==
              watchEndpointMusicSupportedConfigs
          ? _value.watchEndpointMusicSupportedConfigs
          : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicSupportedConfigs?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayNavigationEndpointWatchEndpointImpl
    implements _PlayNavigationEndpointWatchEndpoint {
  const _$PlayNavigationEndpointWatchEndpointImpl(
      {this.videoId, this.watchEndpointMusicSupportedConfigs});

  factory _$PlayNavigationEndpointWatchEndpointImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlayNavigationEndpointWatchEndpointImplFromJson(json);

  @override
  final String? videoId;
  @override
  final WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs;

  @override
  String toString() {
    return 'PlayNavigationEndpointWatchEndpoint(videoId: $videoId, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayNavigationEndpointWatchEndpointImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.watchEndpointMusicSupportedConfigs,
                    watchEndpointMusicSupportedConfigs) ||
                other.watchEndpointMusicSupportedConfigs ==
                    watchEndpointMusicSupportedConfigs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, videoId, watchEndpointMusicSupportedConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayNavigationEndpointWatchEndpointImplCopyWith<
          _$PlayNavigationEndpointWatchEndpointImpl>
      get copyWith => __$$PlayNavigationEndpointWatchEndpointImplCopyWithImpl<
          _$PlayNavigationEndpointWatchEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayNavigationEndpointWatchEndpointImplToJson(
      this,
    );
  }
}

abstract class _PlayNavigationEndpointWatchEndpoint
    implements PlayNavigationEndpointWatchEndpoint {
  const factory _PlayNavigationEndpointWatchEndpoint(
          {final String? videoId,
          final WatchEndpointMusicSupportedConfigs?
              watchEndpointMusicSupportedConfigs}) =
      _$PlayNavigationEndpointWatchEndpointImpl;

  factory _PlayNavigationEndpointWatchEndpoint.fromJson(
          Map<String, dynamic> json) =
      _$PlayNavigationEndpointWatchEndpointImpl.fromJson;

  @override
  String? get videoId;
  @override
  WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs;
  @override
  @JsonKey(ignore: true)
  _$$PlayNavigationEndpointWatchEndpointImplCopyWith<
          _$PlayNavigationEndpointWatchEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WatchEndpointMusicSupportedConfigs _$WatchEndpointMusicSupportedConfigsFromJson(
    Map<String, dynamic> json) {
  return _WatchEndpointMusicSupportedConfigs.fromJson(json);
}

/// @nodoc
mixin _$WatchEndpointMusicSupportedConfigs {
  WatchEndpointMusicConfig? get watchEndpointMusicConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchEndpointMusicSupportedConfigsCopyWith<
          WatchEndpointMusicSupportedConfigs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  factory $WatchEndpointMusicSupportedConfigsCopyWith(
          WatchEndpointMusicSupportedConfigs value,
          $Res Function(WatchEndpointMusicSupportedConfigs) then) =
      _$WatchEndpointMusicSupportedConfigsCopyWithImpl<$Res,
          WatchEndpointMusicSupportedConfigs>;
  @useResult
  $Res call({WatchEndpointMusicConfig? watchEndpointMusicConfig});

  $WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig;
}

/// @nodoc
class _$WatchEndpointMusicSupportedConfigsCopyWithImpl<$Res,
        $Val extends WatchEndpointMusicSupportedConfigs>
    implements $WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  _$WatchEndpointMusicSupportedConfigsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchEndpointMusicConfig = freezed,
  }) {
    return _then(_value.copyWith(
      watchEndpointMusicConfig: freezed == watchEndpointMusicConfig
          ? _value.watchEndpointMusicConfig
          : watchEndpointMusicConfig // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig {
    if (_value.watchEndpointMusicConfig == null) {
      return null;
    }

    return $WatchEndpointMusicConfigCopyWith<$Res>(
        _value.watchEndpointMusicConfig!, (value) {
      return _then(_value.copyWith(watchEndpointMusicConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchEndpointMusicSupportedConfigsImplCopyWith<$Res>
    implements $WatchEndpointMusicSupportedConfigsCopyWith<$Res> {
  factory _$$WatchEndpointMusicSupportedConfigsImplCopyWith(
          _$WatchEndpointMusicSupportedConfigsImpl value,
          $Res Function(_$WatchEndpointMusicSupportedConfigsImpl) then) =
      __$$WatchEndpointMusicSupportedConfigsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WatchEndpointMusicConfig? watchEndpointMusicConfig});

  @override
  $WatchEndpointMusicConfigCopyWith<$Res>? get watchEndpointMusicConfig;
}

/// @nodoc
class __$$WatchEndpointMusicSupportedConfigsImplCopyWithImpl<$Res>
    extends _$WatchEndpointMusicSupportedConfigsCopyWithImpl<$Res,
        _$WatchEndpointMusicSupportedConfigsImpl>
    implements _$$WatchEndpointMusicSupportedConfigsImplCopyWith<$Res> {
  __$$WatchEndpointMusicSupportedConfigsImplCopyWithImpl(
      _$WatchEndpointMusicSupportedConfigsImpl _value,
      $Res Function(_$WatchEndpointMusicSupportedConfigsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchEndpointMusicConfig = freezed,
  }) {
    return _then(_$WatchEndpointMusicSupportedConfigsImpl(
      watchEndpointMusicConfig: freezed == watchEndpointMusicConfig
          ? _value.watchEndpointMusicConfig
          : watchEndpointMusicConfig // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchEndpointMusicSupportedConfigsImpl
    implements _WatchEndpointMusicSupportedConfigs {
  const _$WatchEndpointMusicSupportedConfigsImpl(
      {this.watchEndpointMusicConfig});

  factory _$WatchEndpointMusicSupportedConfigsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WatchEndpointMusicSupportedConfigsImplFromJson(json);

  @override
  final WatchEndpointMusicConfig? watchEndpointMusicConfig;

  @override
  String toString() {
    return 'WatchEndpointMusicSupportedConfigs(watchEndpointMusicConfig: $watchEndpointMusicConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchEndpointMusicSupportedConfigsImpl &&
            (identical(
                    other.watchEndpointMusicConfig, watchEndpointMusicConfig) ||
                other.watchEndpointMusicConfig == watchEndpointMusicConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, watchEndpointMusicConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchEndpointMusicSupportedConfigsImplCopyWith<
          _$WatchEndpointMusicSupportedConfigsImpl>
      get copyWith => __$$WatchEndpointMusicSupportedConfigsImplCopyWithImpl<
          _$WatchEndpointMusicSupportedConfigsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchEndpointMusicSupportedConfigsImplToJson(
      this,
    );
  }
}

abstract class _WatchEndpointMusicSupportedConfigs
    implements WatchEndpointMusicSupportedConfigs {
  const factory _WatchEndpointMusicSupportedConfigs(
          {final WatchEndpointMusicConfig? watchEndpointMusicConfig}) =
      _$WatchEndpointMusicSupportedConfigsImpl;

  factory _WatchEndpointMusicSupportedConfigs.fromJson(
          Map<String, dynamic> json) =
      _$WatchEndpointMusicSupportedConfigsImpl.fromJson;

  @override
  WatchEndpointMusicConfig? get watchEndpointMusicConfig;
  @override
  @JsonKey(ignore: true)
  _$$WatchEndpointMusicSupportedConfigsImplCopyWith<
          _$WatchEndpointMusicSupportedConfigsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WatchEndpointMusicConfig _$WatchEndpointMusicConfigFromJson(
    Map<String, dynamic> json) {
  return _WatchEndpointMusicConfig.fromJson(json);
}

/// @nodoc
mixin _$WatchEndpointMusicConfig {
  String? get musicVideoType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchEndpointMusicConfigCopyWith<WatchEndpointMusicConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchEndpointMusicConfigCopyWith<$Res> {
  factory $WatchEndpointMusicConfigCopyWith(WatchEndpointMusicConfig value,
          $Res Function(WatchEndpointMusicConfig) then) =
      _$WatchEndpointMusicConfigCopyWithImpl<$Res, WatchEndpointMusicConfig>;
  @useResult
  $Res call({String? musicVideoType});
}

/// @nodoc
class _$WatchEndpointMusicConfigCopyWithImpl<$Res,
        $Val extends WatchEndpointMusicConfig>
    implements $WatchEndpointMusicConfigCopyWith<$Res> {
  _$WatchEndpointMusicConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicVideoType = freezed,
  }) {
    return _then(_value.copyWith(
      musicVideoType: freezed == musicVideoType
          ? _value.musicVideoType
          : musicVideoType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchEndpointMusicConfigImplCopyWith<$Res>
    implements $WatchEndpointMusicConfigCopyWith<$Res> {
  factory _$$WatchEndpointMusicConfigImplCopyWith(
          _$WatchEndpointMusicConfigImpl value,
          $Res Function(_$WatchEndpointMusicConfigImpl) then) =
      __$$WatchEndpointMusicConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? musicVideoType});
}

/// @nodoc
class __$$WatchEndpointMusicConfigImplCopyWithImpl<$Res>
    extends _$WatchEndpointMusicConfigCopyWithImpl<$Res,
        _$WatchEndpointMusicConfigImpl>
    implements _$$WatchEndpointMusicConfigImplCopyWith<$Res> {
  __$$WatchEndpointMusicConfigImplCopyWithImpl(
      _$WatchEndpointMusicConfigImpl _value,
      $Res Function(_$WatchEndpointMusicConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicVideoType = freezed,
  }) {
    return _then(_$WatchEndpointMusicConfigImpl(
      musicVideoType: freezed == musicVideoType
          ? _value.musicVideoType
          : musicVideoType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchEndpointMusicConfigImpl implements _WatchEndpointMusicConfig {
  const _$WatchEndpointMusicConfigImpl({this.musicVideoType});

  factory _$WatchEndpointMusicConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchEndpointMusicConfigImplFromJson(json);

  @override
  final String? musicVideoType;

  @override
  String toString() {
    return 'WatchEndpointMusicConfig(musicVideoType: $musicVideoType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchEndpointMusicConfigImpl &&
            (identical(other.musicVideoType, musicVideoType) ||
                other.musicVideoType == musicVideoType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicVideoType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchEndpointMusicConfigImplCopyWith<_$WatchEndpointMusicConfigImpl>
      get copyWith => __$$WatchEndpointMusicConfigImplCopyWithImpl<
          _$WatchEndpointMusicConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchEndpointMusicConfigImplToJson(
      this,
    );
  }
}

abstract class _WatchEndpointMusicConfig implements WatchEndpointMusicConfig {
  const factory _WatchEndpointMusicConfig({final String? musicVideoType}) =
      _$WatchEndpointMusicConfigImpl;

  factory _WatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) =
      _$WatchEndpointMusicConfigImpl.fromJson;

  @override
  String? get musicVideoType;
  @override
  @JsonKey(ignore: true)
  _$$WatchEndpointMusicConfigImplCopyWith<_$WatchEndpointMusicConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  MenuRenderer? get menuRenderer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call({MenuRenderer? menuRenderer});

  $MenuRendererCopyWith<$Res>? get menuRenderer;
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      menuRenderer: freezed == menuRenderer
          ? _value.menuRenderer
          : menuRenderer // ignore: cast_nullable_to_non_nullable
              as MenuRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuRendererCopyWith<$Res>? get menuRenderer {
    if (_value.menuRenderer == null) {
      return null;
    }

    return $MenuRendererCopyWith<$Res>(_value.menuRenderer!, (value) {
      return _then(_value.copyWith(menuRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MenuRenderer? menuRenderer});

  @override
  $MenuRendererCopyWith<$Res>? get menuRenderer;
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuRenderer = freezed,
  }) {
    return _then(_$MenuImpl(
      menuRenderer: freezed == menuRenderer
          ? _value.menuRenderer
          : menuRenderer // ignore: cast_nullable_to_non_nullable
              as MenuRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl implements _Menu {
  const _$MenuImpl({this.menuRenderer});

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final MenuRenderer? menuRenderer;

  @override
  String toString() {
    return 'Menu(menuRenderer: $menuRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.menuRenderer, menuRenderer) ||
                other.menuRenderer == menuRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, menuRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  const factory _Menu({final MenuRenderer? menuRenderer}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  MenuRenderer? get menuRenderer;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuRenderer _$MenuRendererFromJson(Map<String, dynamic> json) {
  return _MenuRenderer.fromJson(json);
}

/// @nodoc
mixin _$MenuRenderer {
  List<ItemElement>? get items => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  Accessibility? get accessibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuRendererCopyWith<MenuRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRendererCopyWith<$Res> {
  factory $MenuRendererCopyWith(
          MenuRenderer value, $Res Function(MenuRenderer) then) =
      _$MenuRendererCopyWithImpl<$Res, MenuRenderer>;
  @useResult
  $Res call(
      {List<ItemElement>? items,
      String? trackingParams,
      Accessibility? accessibility});

  $AccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class _$MenuRendererCopyWithImpl<$Res, $Val extends MenuRenderer>
    implements $MenuRendererCopyWith<$Res> {
  _$MenuRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? trackingParams = freezed,
    Object? accessibility = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemElement>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      accessibility: freezed == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityCopyWith<$Res>? get accessibility {
    if (_value.accessibility == null) {
      return null;
    }

    return $AccessibilityCopyWith<$Res>(_value.accessibility!, (value) {
      return _then(_value.copyWith(accessibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuRendererImplCopyWith<$Res>
    implements $MenuRendererCopyWith<$Res> {
  factory _$$MenuRendererImplCopyWith(
          _$MenuRendererImpl value, $Res Function(_$MenuRendererImpl) then) =
      __$$MenuRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemElement>? items,
      String? trackingParams,
      Accessibility? accessibility});

  @override
  $AccessibilityCopyWith<$Res>? get accessibility;
}

/// @nodoc
class __$$MenuRendererImplCopyWithImpl<$Res>
    extends _$MenuRendererCopyWithImpl<$Res, _$MenuRendererImpl>
    implements _$$MenuRendererImplCopyWith<$Res> {
  __$$MenuRendererImplCopyWithImpl(
      _$MenuRendererImpl _value, $Res Function(_$MenuRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? trackingParams = freezed,
    Object? accessibility = freezed,
  }) {
    return _then(_$MenuRendererImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemElement>?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      accessibility: freezed == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuRendererImpl implements _MenuRenderer {
  const _$MenuRendererImpl(
      {final List<ItemElement>? items, this.trackingParams, this.accessibility})
      : _items = items;

  factory _$MenuRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuRendererImplFromJson(json);

  final List<ItemElement>? _items;
  @override
  List<ItemElement>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? trackingParams;
  @override
  final Accessibility? accessibility;

  @override
  String toString() {
    return 'MenuRenderer(items: $items, trackingParams: $trackingParams, accessibility: $accessibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRendererImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      trackingParams,
      accessibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRendererImplCopyWith<_$MenuRendererImpl> get copyWith =>
      __$$MenuRendererImplCopyWithImpl<_$MenuRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuRendererImplToJson(
      this,
    );
  }
}

abstract class _MenuRenderer implements MenuRenderer {
  const factory _MenuRenderer(
      {final List<ItemElement>? items,
      final String? trackingParams,
      final Accessibility? accessibility}) = _$MenuRendererImpl;

  factory _MenuRenderer.fromJson(Map<String, dynamic> json) =
      _$MenuRendererImpl.fromJson;

  @override
  List<ItemElement>? get items;
  @override
  String? get trackingParams;
  @override
  Accessibility? get accessibility;
  @override
  @JsonKey(ignore: true)
  _$$MenuRendererImplCopyWith<_$MenuRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemElement _$ItemElementFromJson(Map<String, dynamic> json) {
  return _ItemElement.fromJson(json);
}

/// @nodoc
mixin _$ItemElement {
  MenuItemRenderer? get menuNavigationItemRenderer =>
      throw _privateConstructorUsedError;
  MenuItemRenderer? get menuServiceItemRenderer =>
      throw _privateConstructorUsedError;
  ToggleMenuServiceItemRenderer? get toggleMenuServiceItemRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemElementCopyWith<ItemElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemElementCopyWith<$Res> {
  factory $ItemElementCopyWith(
          ItemElement value, $Res Function(ItemElement) then) =
      _$ItemElementCopyWithImpl<$Res, ItemElement>;
  @useResult
  $Res call(
      {MenuItemRenderer? menuNavigationItemRenderer,
      MenuItemRenderer? menuServiceItemRenderer,
      ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer});

  $MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer;
  $MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer;
  $ToggleMenuServiceItemRendererCopyWith<$Res>?
      get toggleMenuServiceItemRenderer;
}

/// @nodoc
class _$ItemElementCopyWithImpl<$Res, $Val extends ItemElement>
    implements $ItemElementCopyWith<$Res> {
  _$ItemElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuNavigationItemRenderer = freezed,
    Object? menuServiceItemRenderer = freezed,
    Object? toggleMenuServiceItemRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      menuNavigationItemRenderer: freezed == menuNavigationItemRenderer
          ? _value.menuNavigationItemRenderer
          : menuNavigationItemRenderer // ignore: cast_nullable_to_non_nullable
              as MenuItemRenderer?,
      menuServiceItemRenderer: freezed == menuServiceItemRenderer
          ? _value.menuServiceItemRenderer
          : menuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
              as MenuItemRenderer?,
      toggleMenuServiceItemRenderer: freezed == toggleMenuServiceItemRenderer
          ? _value.toggleMenuServiceItemRenderer
          : toggleMenuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
              as ToggleMenuServiceItemRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer {
    if (_value.menuNavigationItemRenderer == null) {
      return null;
    }

    return $MenuItemRendererCopyWith<$Res>(_value.menuNavigationItemRenderer!,
        (value) {
      return _then(_value.copyWith(menuNavigationItemRenderer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer {
    if (_value.menuServiceItemRenderer == null) {
      return null;
    }

    return $MenuItemRendererCopyWith<$Res>(_value.menuServiceItemRenderer!,
        (value) {
      return _then(_value.copyWith(menuServiceItemRenderer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ToggleMenuServiceItemRendererCopyWith<$Res>?
      get toggleMenuServiceItemRenderer {
    if (_value.toggleMenuServiceItemRenderer == null) {
      return null;
    }

    return $ToggleMenuServiceItemRendererCopyWith<$Res>(
        _value.toggleMenuServiceItemRenderer!, (value) {
      return _then(
          _value.copyWith(toggleMenuServiceItemRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemElementImplCopyWith<$Res>
    implements $ItemElementCopyWith<$Res> {
  factory _$$ItemElementImplCopyWith(
          _$ItemElementImpl value, $Res Function(_$ItemElementImpl) then) =
      __$$ItemElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MenuItemRenderer? menuNavigationItemRenderer,
      MenuItemRenderer? menuServiceItemRenderer,
      ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer});

  @override
  $MenuItemRendererCopyWith<$Res>? get menuNavigationItemRenderer;
  @override
  $MenuItemRendererCopyWith<$Res>? get menuServiceItemRenderer;
  @override
  $ToggleMenuServiceItemRendererCopyWith<$Res>?
      get toggleMenuServiceItemRenderer;
}

/// @nodoc
class __$$ItemElementImplCopyWithImpl<$Res>
    extends _$ItemElementCopyWithImpl<$Res, _$ItemElementImpl>
    implements _$$ItemElementImplCopyWith<$Res> {
  __$$ItemElementImplCopyWithImpl(
      _$ItemElementImpl _value, $Res Function(_$ItemElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuNavigationItemRenderer = freezed,
    Object? menuServiceItemRenderer = freezed,
    Object? toggleMenuServiceItemRenderer = freezed,
  }) {
    return _then(_$ItemElementImpl(
      menuNavigationItemRenderer: freezed == menuNavigationItemRenderer
          ? _value.menuNavigationItemRenderer
          : menuNavigationItemRenderer // ignore: cast_nullable_to_non_nullable
              as MenuItemRenderer?,
      menuServiceItemRenderer: freezed == menuServiceItemRenderer
          ? _value.menuServiceItemRenderer
          : menuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
              as MenuItemRenderer?,
      toggleMenuServiceItemRenderer: freezed == toggleMenuServiceItemRenderer
          ? _value.toggleMenuServiceItemRenderer
          : toggleMenuServiceItemRenderer // ignore: cast_nullable_to_non_nullable
              as ToggleMenuServiceItemRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemElementImpl implements _ItemElement {
  const _$ItemElementImpl(
      {this.menuNavigationItemRenderer,
      this.menuServiceItemRenderer,
      this.toggleMenuServiceItemRenderer});

  factory _$ItemElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemElementImplFromJson(json);

  @override
  final MenuItemRenderer? menuNavigationItemRenderer;
  @override
  final MenuItemRenderer? menuServiceItemRenderer;
  @override
  final ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer;

  @override
  String toString() {
    return 'ItemElement(menuNavigationItemRenderer: $menuNavigationItemRenderer, menuServiceItemRenderer: $menuServiceItemRenderer, toggleMenuServiceItemRenderer: $toggleMenuServiceItemRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemElementImpl &&
            (identical(other.menuNavigationItemRenderer,
                    menuNavigationItemRenderer) ||
                other.menuNavigationItemRenderer ==
                    menuNavigationItemRenderer) &&
            (identical(
                    other.menuServiceItemRenderer, menuServiceItemRenderer) ||
                other.menuServiceItemRenderer == menuServiceItemRenderer) &&
            (identical(other.toggleMenuServiceItemRenderer,
                    toggleMenuServiceItemRenderer) ||
                other.toggleMenuServiceItemRenderer ==
                    toggleMenuServiceItemRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, menuNavigationItemRenderer,
      menuServiceItemRenderer, toggleMenuServiceItemRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemElementImplCopyWith<_$ItemElementImpl> get copyWith =>
      __$$ItemElementImplCopyWithImpl<_$ItemElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemElementImplToJson(
      this,
    );
  }
}

abstract class _ItemElement implements ItemElement {
  const factory _ItemElement(
          {final MenuItemRenderer? menuNavigationItemRenderer,
          final MenuItemRenderer? menuServiceItemRenderer,
          final ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer}) =
      _$ItemElementImpl;

  factory _ItemElement.fromJson(Map<String, dynamic> json) =
      _$ItemElementImpl.fromJson;

  @override
  MenuItemRenderer? get menuNavigationItemRenderer;
  @override
  MenuItemRenderer? get menuServiceItemRenderer;
  @override
  ToggleMenuServiceItemRenderer? get toggleMenuServiceItemRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ItemElementImplCopyWith<_$ItemElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemRenderer _$MenuItemRendererFromJson(Map<String, dynamic> json) {
  return _MenuItemRenderer.fromJson(json);
}

/// @nodoc
mixin _$MenuItemRenderer {
  Title? get text => throw _privateConstructorUsedError;
  Icon? get icon => throw _privateConstructorUsedError;
  MenuNavigationItemRendererNavigationEndpoint? get navigationEndpoint =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  ServiceEndpoint? get serviceEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemRendererCopyWith<MenuItemRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemRendererCopyWith<$Res> {
  factory $MenuItemRendererCopyWith(
          MenuItemRenderer value, $Res Function(MenuItemRenderer) then) =
      _$MenuItemRendererCopyWithImpl<$Res, MenuItemRenderer>;
  @useResult
  $Res call(
      {Title? text,
      Icon? icon,
      MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      ServiceEndpoint? serviceEndpoint});

  $TitleCopyWith<$Res>? get text;
  $IconCopyWith<$Res>? get icon;
  $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint;
  $ServiceEndpointCopyWith<$Res>? get serviceEndpoint;
}

/// @nodoc
class _$MenuItemRendererCopyWithImpl<$Res, $Val extends MenuItemRenderer>
    implements $MenuItemRendererCopyWith<$Res> {
  _$MenuItemRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? icon = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? serviceEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as MenuNavigationItemRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceEndpoint: freezed == serviceEndpoint
          ? _value.serviceEndpoint
          : serviceEndpoint // ignore: cast_nullable_to_non_nullable
              as ServiceEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint {
    if (_value.navigationEndpoint == null) {
      return null;
    }

    return $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>(
        _value.navigationEndpoint!, (value) {
      return _then(_value.copyWith(navigationEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceEndpointCopyWith<$Res>? get serviceEndpoint {
    if (_value.serviceEndpoint == null) {
      return null;
    }

    return $ServiceEndpointCopyWith<$Res>(_value.serviceEndpoint!, (value) {
      return _then(_value.copyWith(serviceEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuItemRendererImplCopyWith<$Res>
    implements $MenuItemRendererCopyWith<$Res> {
  factory _$$MenuItemRendererImplCopyWith(_$MenuItemRendererImpl value,
          $Res Function(_$MenuItemRendererImpl) then) =
      __$$MenuItemRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Title? text,
      Icon? icon,
      MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      ServiceEndpoint? serviceEndpoint});

  @override
  $TitleCopyWith<$Res>? get text;
  @override
  $IconCopyWith<$Res>? get icon;
  @override
  $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint;
  @override
  $ServiceEndpointCopyWith<$Res>? get serviceEndpoint;
}

/// @nodoc
class __$$MenuItemRendererImplCopyWithImpl<$Res>
    extends _$MenuItemRendererCopyWithImpl<$Res, _$MenuItemRendererImpl>
    implements _$$MenuItemRendererImplCopyWith<$Res> {
  __$$MenuItemRendererImplCopyWithImpl(_$MenuItemRendererImpl _value,
      $Res Function(_$MenuItemRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? icon = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? serviceEndpoint = freezed,
  }) {
    return _then(_$MenuItemRendererImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as MenuNavigationItemRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceEndpoint: freezed == serviceEndpoint
          ? _value.serviceEndpoint
          : serviceEndpoint // ignore: cast_nullable_to_non_nullable
              as ServiceEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemRendererImpl implements _MenuItemRenderer {
  const _$MenuItemRendererImpl(
      {this.text,
      this.icon,
      this.navigationEndpoint,
      this.trackingParams,
      this.serviceEndpoint});

  factory _$MenuItemRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemRendererImplFromJson(json);

  @override
  final Title? text;
  @override
  final Icon? icon;
  @override
  final MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint;
  @override
  final String? trackingParams;
  @override
  final ServiceEndpoint? serviceEndpoint;

  @override
  String toString() {
    return 'MenuItemRenderer(text: $text, icon: $icon, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, serviceEndpoint: $serviceEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemRendererImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.serviceEndpoint, serviceEndpoint) ||
                other.serviceEndpoint == serviceEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, icon, navigationEndpoint,
      trackingParams, serviceEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemRendererImplCopyWith<_$MenuItemRendererImpl> get copyWith =>
      __$$MenuItemRendererImplCopyWithImpl<_$MenuItemRendererImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemRendererImplToJson(
      this,
    );
  }
}

abstract class _MenuItemRenderer implements MenuItemRenderer {
  const factory _MenuItemRenderer(
      {final Title? text,
      final Icon? icon,
      final MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,
      final String? trackingParams,
      final ServiceEndpoint? serviceEndpoint}) = _$MenuItemRendererImpl;

  factory _MenuItemRenderer.fromJson(Map<String, dynamic> json) =
      _$MenuItemRendererImpl.fromJson;

  @override
  Title? get text;
  @override
  Icon? get icon;
  @override
  MenuNavigationItemRendererNavigationEndpoint? get navigationEndpoint;
  @override
  String? get trackingParams;
  @override
  ServiceEndpoint? get serviceEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$MenuItemRendererImplCopyWith<_$MenuItemRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuNavigationItemRendererNavigationEndpoint
    _$MenuNavigationItemRendererNavigationEndpointFromJson(
        Map<String, dynamic> json) {
  return _MenuNavigationItemRendererNavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$MenuNavigationItemRendererNavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  PurpleWatchEndpoint? get watchEndpoint => throw _privateConstructorUsedError;
  ModalEndpoint? get modalEndpoint => throw _privateConstructorUsedError;
  BrowseEndpoint? get browseEndpoint => throw _privateConstructorUsedError;
  ShareEntityEndpoint? get shareEntityEndpoint =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuNavigationItemRendererNavigationEndpointCopyWith<
          MenuNavigationItemRendererNavigationEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  factory $MenuNavigationItemRendererNavigationEndpointCopyWith(
          MenuNavigationItemRendererNavigationEndpoint value,
          $Res Function(MenuNavigationItemRendererNavigationEndpoint) then) =
      _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<$Res,
          MenuNavigationItemRendererNavigationEndpoint>;
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PurpleWatchEndpoint? watchEndpoint,
      ModalEndpoint? modalEndpoint,
      BrowseEndpoint? browseEndpoint,
      ShareEntityEndpoint? shareEntityEndpoint});

  $PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint;
  $ModalEndpointCopyWith<$Res>? get modalEndpoint;
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint;
  $ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint;
}

/// @nodoc
class _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<$Res,
        $Val extends MenuNavigationItemRendererNavigationEndpoint>
    implements $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
    Object? modalEndpoint = freezed,
    Object? browseEndpoint = freezed,
    Object? shareEntityEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PurpleWatchEndpoint?,
      modalEndpoint: freezed == modalEndpoint
          ? _value.modalEndpoint
          : modalEndpoint // ignore: cast_nullable_to_non_nullable
              as ModalEndpoint?,
      browseEndpoint: freezed == browseEndpoint
          ? _value.browseEndpoint
          : browseEndpoint // ignore: cast_nullable_to_non_nullable
              as BrowseEndpoint?,
      shareEntityEndpoint: freezed == shareEntityEndpoint
          ? _value.shareEntityEndpoint
          : shareEntityEndpoint // ignore: cast_nullable_to_non_nullable
              as ShareEntityEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_value.watchEndpoint == null) {
      return null;
    }

    return $PurpleWatchEndpointCopyWith<$Res>(_value.watchEndpoint!, (value) {
      return _then(_value.copyWith(watchEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_value.modalEndpoint == null) {
      return null;
    }

    return $ModalEndpointCopyWith<$Res>(_value.modalEndpoint!, (value) {
      return _then(_value.copyWith(modalEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint {
    if (_value.browseEndpoint == null) {
      return null;
    }

    return $BrowseEndpointCopyWith<$Res>(_value.browseEndpoint!, (value) {
      return _then(_value.copyWith(browseEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint {
    if (_value.shareEntityEndpoint == null) {
      return null;
    }

    return $ShareEntityEndpointCopyWith<$Res>(_value.shareEntityEndpoint!,
        (value) {
      return _then(_value.copyWith(shareEntityEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuNavigationItemRendererNavigationEndpointImplCopyWith<$Res>
    implements $MenuNavigationItemRendererNavigationEndpointCopyWith<$Res> {
  factory _$$MenuNavigationItemRendererNavigationEndpointImplCopyWith(
          _$MenuNavigationItemRendererNavigationEndpointImpl value,
          $Res Function(_$MenuNavigationItemRendererNavigationEndpointImpl)
              then) =
      __$$MenuNavigationItemRendererNavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PurpleWatchEndpoint? watchEndpoint,
      ModalEndpoint? modalEndpoint,
      BrowseEndpoint? browseEndpoint,
      ShareEntityEndpoint? shareEntityEndpoint});

  @override
  $PurpleWatchEndpointCopyWith<$Res>? get watchEndpoint;
  @override
  $ModalEndpointCopyWith<$Res>? get modalEndpoint;
  @override
  $BrowseEndpointCopyWith<$Res>? get browseEndpoint;
  @override
  $ShareEntityEndpointCopyWith<$Res>? get shareEntityEndpoint;
}

/// @nodoc
class __$$MenuNavigationItemRendererNavigationEndpointImplCopyWithImpl<$Res>
    extends _$MenuNavigationItemRendererNavigationEndpointCopyWithImpl<$Res,
        _$MenuNavigationItemRendererNavigationEndpointImpl>
    implements
        _$$MenuNavigationItemRendererNavigationEndpointImplCopyWith<$Res> {
  __$$MenuNavigationItemRendererNavigationEndpointImplCopyWithImpl(
      _$MenuNavigationItemRendererNavigationEndpointImpl _value,
      $Res Function(_$MenuNavigationItemRendererNavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
    Object? modalEndpoint = freezed,
    Object? browseEndpoint = freezed,
    Object? shareEntityEndpoint = freezed,
  }) {
    return _then(_$MenuNavigationItemRendererNavigationEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PurpleWatchEndpoint?,
      modalEndpoint: freezed == modalEndpoint
          ? _value.modalEndpoint
          : modalEndpoint // ignore: cast_nullable_to_non_nullable
              as ModalEndpoint?,
      browseEndpoint: freezed == browseEndpoint
          ? _value.browseEndpoint
          : browseEndpoint // ignore: cast_nullable_to_non_nullable
              as BrowseEndpoint?,
      shareEntityEndpoint: freezed == shareEntityEndpoint
          ? _value.shareEntityEndpoint
          : shareEntityEndpoint // ignore: cast_nullable_to_non_nullable
              as ShareEntityEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuNavigationItemRendererNavigationEndpointImpl
    implements _MenuNavigationItemRendererNavigationEndpoint {
  const _$MenuNavigationItemRendererNavigationEndpointImpl(
      {this.clickTrackingParams,
      this.watchEndpoint,
      this.modalEndpoint,
      this.browseEndpoint,
      this.shareEntityEndpoint});

  factory _$MenuNavigationItemRendererNavigationEndpointImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MenuNavigationItemRendererNavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final PurpleWatchEndpoint? watchEndpoint;
  @override
  final ModalEndpoint? modalEndpoint;
  @override
  final BrowseEndpoint? browseEndpoint;
  @override
  final ShareEntityEndpoint? shareEntityEndpoint;

  @override
  String toString() {
    return 'MenuNavigationItemRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint, modalEndpoint: $modalEndpoint, browseEndpoint: $browseEndpoint, shareEntityEndpoint: $shareEntityEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuNavigationItemRendererNavigationEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.watchEndpoint, watchEndpoint) ||
                other.watchEndpoint == watchEndpoint) &&
            (identical(other.modalEndpoint, modalEndpoint) ||
                other.modalEndpoint == modalEndpoint) &&
            (identical(other.browseEndpoint, browseEndpoint) ||
                other.browseEndpoint == browseEndpoint) &&
            (identical(other.shareEntityEndpoint, shareEntityEndpoint) ||
                other.shareEntityEndpoint == shareEntityEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clickTrackingParams,
      watchEndpoint, modalEndpoint, browseEndpoint, shareEntityEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuNavigationItemRendererNavigationEndpointImplCopyWith<
          _$MenuNavigationItemRendererNavigationEndpointImpl>
      get copyWith =>
          __$$MenuNavigationItemRendererNavigationEndpointImplCopyWithImpl<
                  _$MenuNavigationItemRendererNavigationEndpointImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuNavigationItemRendererNavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _MenuNavigationItemRendererNavigationEndpoint
    implements MenuNavigationItemRendererNavigationEndpoint {
  const factory _MenuNavigationItemRendererNavigationEndpoint(
          {final String? clickTrackingParams,
          final PurpleWatchEndpoint? watchEndpoint,
          final ModalEndpoint? modalEndpoint,
          final BrowseEndpoint? browseEndpoint,
          final ShareEntityEndpoint? shareEntityEndpoint}) =
      _$MenuNavigationItemRendererNavigationEndpointImpl;

  factory _MenuNavigationItemRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =
      _$MenuNavigationItemRendererNavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  PurpleWatchEndpoint? get watchEndpoint;
  @override
  ModalEndpoint? get modalEndpoint;
  @override
  BrowseEndpoint? get browseEndpoint;
  @override
  ShareEntityEndpoint? get shareEntityEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$MenuNavigationItemRendererNavigationEndpointImplCopyWith<
          _$MenuNavigationItemRendererNavigationEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Title _$TitleFromJson(Map<String, dynamic> json) {
  return _Title.fromJson(json);
}

/// @nodoc
mixin _$Title {
  List<TitleRun>? get runs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleCopyWith<Title> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleCopyWith<$Res> {
  factory $TitleCopyWith(Title value, $Res Function(Title) then) =
      _$TitleCopyWithImpl<$Res, Title>;
  @useResult
  $Res call({List<TitleRun>? runs});
}

/// @nodoc
class _$TitleCopyWithImpl<$Res, $Val extends Title>
    implements $TitleCopyWith<$Res> {
  _$TitleCopyWithImpl(this._value, this._then);

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
              as List<TitleRun>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleImplCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$$TitleImplCopyWith(
          _$TitleImpl value, $Res Function(_$TitleImpl) then) =
      __$$TitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TitleRun>? runs});
}

/// @nodoc
class __$$TitleImplCopyWithImpl<$Res>
    extends _$TitleCopyWithImpl<$Res, _$TitleImpl>
    implements _$$TitleImplCopyWith<$Res> {
  __$$TitleImplCopyWithImpl(
      _$TitleImpl _value, $Res Function(_$TitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runs = freezed,
  }) {
    return _then(_$TitleImpl(
      runs: freezed == runs
          ? _value._runs
          : runs // ignore: cast_nullable_to_non_nullable
              as List<TitleRun>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleImpl implements _Title {
  const _$TitleImpl({final List<TitleRun>? runs}) : _runs = runs;

  factory _$TitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleImplFromJson(json);

  final List<TitleRun>? _runs;
  @override
  List<TitleRun>? get runs {
    final value = _runs;
    if (value == null) return null;
    if (_runs is EqualUnmodifiableListView) return _runs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Title(runs: $runs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleImpl &&
            const DeepCollectionEquality().equals(other._runs, _runs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_runs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleImplCopyWith<_$TitleImpl> get copyWith =>
      __$$TitleImplCopyWithImpl<_$TitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleImplToJson(
      this,
    );
  }
}

abstract class _Title implements Title {
  const factory _Title({final List<TitleRun>? runs}) = _$TitleImpl;

  factory _Title.fromJson(Map<String, dynamic> json) = _$TitleImpl.fromJson;

  @override
  List<TitleRun>? get runs;
  @override
  @JsonKey(ignore: true)
  _$$TitleImplCopyWith<_$TitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TitleRun _$TitleRunFromJson(Map<String, dynamic> json) {
  return _TitleRun.fromJson(json);
}

/// @nodoc
mixin _$TitleRun {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleRunCopyWith<TitleRun> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleRunCopyWith<$Res> {
  factory $TitleRunCopyWith(TitleRun value, $Res Function(TitleRun) then) =
      _$TitleRunCopyWithImpl<$Res, TitleRun>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class _$TitleRunCopyWithImpl<$Res, $Val extends TitleRun>
    implements $TitleRunCopyWith<$Res> {
  _$TitleRunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleRunImplCopyWith<$Res>
    implements $TitleRunCopyWith<$Res> {
  factory _$$TitleRunImplCopyWith(
          _$TitleRunImpl value, $Res Function(_$TitleRunImpl) then) =
      __$$TitleRunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$TitleRunImplCopyWithImpl<$Res>
    extends _$TitleRunCopyWithImpl<$Res, _$TitleRunImpl>
    implements _$$TitleRunImplCopyWith<$Res> {
  __$$TitleRunImplCopyWithImpl(
      _$TitleRunImpl _value, $Res Function(_$TitleRunImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$TitleRunImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleRunImpl implements _TitleRun {
  const _$TitleRunImpl({this.text});

  factory _$TitleRunImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleRunImplFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'TitleRun(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleRunImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleRunImplCopyWith<_$TitleRunImpl> get copyWith =>
      __$$TitleRunImplCopyWithImpl<_$TitleRunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleRunImplToJson(
      this,
    );
  }
}

abstract class _TitleRun implements TitleRun {
  const factory _TitleRun({final String? text}) = _$TitleRunImpl;

  factory _TitleRun.fromJson(Map<String, dynamic> json) =
      _$TitleRunImpl.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$TitleRunImplCopyWith<_$TitleRunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShareEntityEndpoint _$ShareEntityEndpointFromJson(Map<String, dynamic> json) {
  return _ShareEntityEndpoint.fromJson(json);
}

/// @nodoc
mixin _$ShareEntityEndpoint {
  String? get serializedShareEntity => throw _privateConstructorUsedError;
  String? get sharePanelType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareEntityEndpointCopyWith<ShareEntityEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareEntityEndpointCopyWith<$Res> {
  factory $ShareEntityEndpointCopyWith(
          ShareEntityEndpoint value, $Res Function(ShareEntityEndpoint) then) =
      _$ShareEntityEndpointCopyWithImpl<$Res, ShareEntityEndpoint>;
  @useResult
  $Res call({String? serializedShareEntity, String? sharePanelType});
}

/// @nodoc
class _$ShareEntityEndpointCopyWithImpl<$Res, $Val extends ShareEntityEndpoint>
    implements $ShareEntityEndpointCopyWith<$Res> {
  _$ShareEntityEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serializedShareEntity = freezed,
    Object? sharePanelType = freezed,
  }) {
    return _then(_value.copyWith(
      serializedShareEntity: freezed == serializedShareEntity
          ? _value.serializedShareEntity
          : serializedShareEntity // ignore: cast_nullable_to_non_nullable
              as String?,
      sharePanelType: freezed == sharePanelType
          ? _value.sharePanelType
          : sharePanelType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareEntityEndpointImplCopyWith<$Res>
    implements $ShareEntityEndpointCopyWith<$Res> {
  factory _$$ShareEntityEndpointImplCopyWith(_$ShareEntityEndpointImpl value,
          $Res Function(_$ShareEntityEndpointImpl) then) =
      __$$ShareEntityEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? serializedShareEntity, String? sharePanelType});
}

/// @nodoc
class __$$ShareEntityEndpointImplCopyWithImpl<$Res>
    extends _$ShareEntityEndpointCopyWithImpl<$Res, _$ShareEntityEndpointImpl>
    implements _$$ShareEntityEndpointImplCopyWith<$Res> {
  __$$ShareEntityEndpointImplCopyWithImpl(_$ShareEntityEndpointImpl _value,
      $Res Function(_$ShareEntityEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serializedShareEntity = freezed,
    Object? sharePanelType = freezed,
  }) {
    return _then(_$ShareEntityEndpointImpl(
      serializedShareEntity: freezed == serializedShareEntity
          ? _value.serializedShareEntity
          : serializedShareEntity // ignore: cast_nullable_to_non_nullable
              as String?,
      sharePanelType: freezed == sharePanelType
          ? _value.sharePanelType
          : sharePanelType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareEntityEndpointImpl implements _ShareEntityEndpoint {
  const _$ShareEntityEndpointImpl(
      {this.serializedShareEntity, this.sharePanelType});

  factory _$ShareEntityEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareEntityEndpointImplFromJson(json);

  @override
  final String? serializedShareEntity;
  @override
  final String? sharePanelType;

  @override
  String toString() {
    return 'ShareEntityEndpoint(serializedShareEntity: $serializedShareEntity, sharePanelType: $sharePanelType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareEntityEndpointImpl &&
            (identical(other.serializedShareEntity, serializedShareEntity) ||
                other.serializedShareEntity == serializedShareEntity) &&
            (identical(other.sharePanelType, sharePanelType) ||
                other.sharePanelType == sharePanelType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serializedShareEntity, sharePanelType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareEntityEndpointImplCopyWith<_$ShareEntityEndpointImpl> get copyWith =>
      __$$ShareEntityEndpointImplCopyWithImpl<_$ShareEntityEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareEntityEndpointImplToJson(
      this,
    );
  }
}

abstract class _ShareEntityEndpoint implements ShareEntityEndpoint {
  const factory _ShareEntityEndpoint(
      {final String? serializedShareEntity,
      final String? sharePanelType}) = _$ShareEntityEndpointImpl;

  factory _ShareEntityEndpoint.fromJson(Map<String, dynamic> json) =
      _$ShareEntityEndpointImpl.fromJson;

  @override
  String? get serializedShareEntity;
  @override
  String? get sharePanelType;
  @override
  @JsonKey(ignore: true)
  _$$ShareEntityEndpointImplCopyWith<_$ShareEntityEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModalEndpoint _$ModalEndpointFromJson(Map<String, dynamic> json) {
  return _ModalEndpoint.fromJson(json);
}

/// @nodoc
mixin _$ModalEndpoint {
  Modal? get modal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModalEndpointCopyWith<ModalEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModalEndpointCopyWith<$Res> {
  factory $ModalEndpointCopyWith(
          ModalEndpoint value, $Res Function(ModalEndpoint) then) =
      _$ModalEndpointCopyWithImpl<$Res, ModalEndpoint>;
  @useResult
  $Res call({Modal? modal});

  $ModalCopyWith<$Res>? get modal;
}

/// @nodoc
class _$ModalEndpointCopyWithImpl<$Res, $Val extends ModalEndpoint>
    implements $ModalEndpointCopyWith<$Res> {
  _$ModalEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modal = freezed,
  }) {
    return _then(_value.copyWith(
      modal: freezed == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as Modal?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModalCopyWith<$Res>? get modal {
    if (_value.modal == null) {
      return null;
    }

    return $ModalCopyWith<$Res>(_value.modal!, (value) {
      return _then(_value.copyWith(modal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModalEndpointImplCopyWith<$Res>
    implements $ModalEndpointCopyWith<$Res> {
  factory _$$ModalEndpointImplCopyWith(
          _$ModalEndpointImpl value, $Res Function(_$ModalEndpointImpl) then) =
      __$$ModalEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Modal? modal});

  @override
  $ModalCopyWith<$Res>? get modal;
}

/// @nodoc
class __$$ModalEndpointImplCopyWithImpl<$Res>
    extends _$ModalEndpointCopyWithImpl<$Res, _$ModalEndpointImpl>
    implements _$$ModalEndpointImplCopyWith<$Res> {
  __$$ModalEndpointImplCopyWithImpl(
      _$ModalEndpointImpl _value, $Res Function(_$ModalEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modal = freezed,
  }) {
    return _then(_$ModalEndpointImpl(
      modal: freezed == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as Modal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModalEndpointImpl implements _ModalEndpoint {
  const _$ModalEndpointImpl({this.modal});

  factory _$ModalEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModalEndpointImplFromJson(json);

  @override
  final Modal? modal;

  @override
  String toString() {
    return 'ModalEndpoint(modal: $modal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModalEndpointImpl &&
            (identical(other.modal, modal) || other.modal == modal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, modal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModalEndpointImplCopyWith<_$ModalEndpointImpl> get copyWith =>
      __$$ModalEndpointImplCopyWithImpl<_$ModalEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModalEndpointImplToJson(
      this,
    );
  }
}

abstract class _ModalEndpoint implements ModalEndpoint {
  const factory _ModalEndpoint({final Modal? modal}) = _$ModalEndpointImpl;

  factory _ModalEndpoint.fromJson(Map<String, dynamic> json) =
      _$ModalEndpointImpl.fromJson;

  @override
  Modal? get modal;
  @override
  @JsonKey(ignore: true)
  _$$ModalEndpointImplCopyWith<_$ModalEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Modal _$ModalFromJson(Map<String, dynamic> json) {
  return _Modal.fromJson(json);
}

/// @nodoc
mixin _$Modal {
  ModalWithTitleAndButtonRenderer? get modalWithTitleAndButtonRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModalCopyWith<Modal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModalCopyWith<$Res> {
  factory $ModalCopyWith(Modal value, $Res Function(Modal) then) =
      _$ModalCopyWithImpl<$Res, Modal>;
  @useResult
  $Res call({ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer});

  $ModalWithTitleAndButtonRendererCopyWith<$Res>?
      get modalWithTitleAndButtonRenderer;
}

/// @nodoc
class _$ModalCopyWithImpl<$Res, $Val extends Modal>
    implements $ModalCopyWith<$Res> {
  _$ModalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalWithTitleAndButtonRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      modalWithTitleAndButtonRenderer: freezed ==
              modalWithTitleAndButtonRenderer
          ? _value.modalWithTitleAndButtonRenderer
          : modalWithTitleAndButtonRenderer // ignore: cast_nullable_to_non_nullable
              as ModalWithTitleAndButtonRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModalWithTitleAndButtonRendererCopyWith<$Res>?
      get modalWithTitleAndButtonRenderer {
    if (_value.modalWithTitleAndButtonRenderer == null) {
      return null;
    }

    return $ModalWithTitleAndButtonRendererCopyWith<$Res>(
        _value.modalWithTitleAndButtonRenderer!, (value) {
      return _then(
          _value.copyWith(modalWithTitleAndButtonRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModalImplCopyWith<$Res> implements $ModalCopyWith<$Res> {
  factory _$$ModalImplCopyWith(
          _$ModalImpl value, $Res Function(_$ModalImpl) then) =
      __$$ModalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer});

  @override
  $ModalWithTitleAndButtonRendererCopyWith<$Res>?
      get modalWithTitleAndButtonRenderer;
}

/// @nodoc
class __$$ModalImplCopyWithImpl<$Res>
    extends _$ModalCopyWithImpl<$Res, _$ModalImpl>
    implements _$$ModalImplCopyWith<$Res> {
  __$$ModalImplCopyWithImpl(
      _$ModalImpl _value, $Res Function(_$ModalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalWithTitleAndButtonRenderer = freezed,
  }) {
    return _then(_$ModalImpl(
      modalWithTitleAndButtonRenderer: freezed ==
              modalWithTitleAndButtonRenderer
          ? _value.modalWithTitleAndButtonRenderer
          : modalWithTitleAndButtonRenderer // ignore: cast_nullable_to_non_nullable
              as ModalWithTitleAndButtonRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModalImpl implements _Modal {
  const _$ModalImpl({this.modalWithTitleAndButtonRenderer});

  factory _$ModalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModalImplFromJson(json);

  @override
  final ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer;

  @override
  String toString() {
    return 'Modal(modalWithTitleAndButtonRenderer: $modalWithTitleAndButtonRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModalImpl &&
            (identical(other.modalWithTitleAndButtonRenderer,
                    modalWithTitleAndButtonRenderer) ||
                other.modalWithTitleAndButtonRenderer ==
                    modalWithTitleAndButtonRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, modalWithTitleAndButtonRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModalImplCopyWith<_$ModalImpl> get copyWith =>
      __$$ModalImplCopyWithImpl<_$ModalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModalImplToJson(
      this,
    );
  }
}

abstract class _Modal implements Modal {
  const factory _Modal(
      {final ModalWithTitleAndButtonRenderer?
          modalWithTitleAndButtonRenderer}) = _$ModalImpl;

  factory _Modal.fromJson(Map<String, dynamic> json) = _$ModalImpl.fromJson;

  @override
  ModalWithTitleAndButtonRenderer? get modalWithTitleAndButtonRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ModalImplCopyWith<_$ModalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModalWithTitleAndButtonRenderer _$ModalWithTitleAndButtonRendererFromJson(
    Map<String, dynamic> json) {
  return _ModalWithTitleAndButtonRenderer.fromJson(json);
}

/// @nodoc
mixin _$ModalWithTitleAndButtonRenderer {
  Title? get title => throw _privateConstructorUsedError;
  Title? get content => throw _privateConstructorUsedError;
  Button? get button => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModalWithTitleAndButtonRendererCopyWith<ModalWithTitleAndButtonRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModalWithTitleAndButtonRendererCopyWith<$Res> {
  factory $ModalWithTitleAndButtonRendererCopyWith(
          ModalWithTitleAndButtonRenderer value,
          $Res Function(ModalWithTitleAndButtonRenderer) then) =
      _$ModalWithTitleAndButtonRendererCopyWithImpl<$Res,
          ModalWithTitleAndButtonRenderer>;
  @useResult
  $Res call({Title? title, Title? content, Button? button});

  $TitleCopyWith<$Res>? get title;
  $TitleCopyWith<$Res>? get content;
  $ButtonCopyWith<$Res>? get button;
}

/// @nodoc
class _$ModalWithTitleAndButtonRendererCopyWithImpl<$Res,
        $Val extends ModalWithTitleAndButtonRenderer>
    implements $ModalWithTitleAndButtonRendererCopyWith<$Res> {
  _$ModalWithTitleAndButtonRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? button = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Title?,
      button: freezed == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as Button?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ButtonCopyWith<$Res>? get button {
    if (_value.button == null) {
      return null;
    }

    return $ButtonCopyWith<$Res>(_value.button!, (value) {
      return _then(_value.copyWith(button: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModalWithTitleAndButtonRendererImplCopyWith<$Res>
    implements $ModalWithTitleAndButtonRendererCopyWith<$Res> {
  factory _$$ModalWithTitleAndButtonRendererImplCopyWith(
          _$ModalWithTitleAndButtonRendererImpl value,
          $Res Function(_$ModalWithTitleAndButtonRendererImpl) then) =
      __$$ModalWithTitleAndButtonRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Title? title, Title? content, Button? button});

  @override
  $TitleCopyWith<$Res>? get title;
  @override
  $TitleCopyWith<$Res>? get content;
  @override
  $ButtonCopyWith<$Res>? get button;
}

/// @nodoc
class __$$ModalWithTitleAndButtonRendererImplCopyWithImpl<$Res>
    extends _$ModalWithTitleAndButtonRendererCopyWithImpl<$Res,
        _$ModalWithTitleAndButtonRendererImpl>
    implements _$$ModalWithTitleAndButtonRendererImplCopyWith<$Res> {
  __$$ModalWithTitleAndButtonRendererImplCopyWithImpl(
      _$ModalWithTitleAndButtonRendererImpl _value,
      $Res Function(_$ModalWithTitleAndButtonRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? button = freezed,
  }) {
    return _then(_$ModalWithTitleAndButtonRendererImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Title?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Title?,
      button: freezed == button
          ? _value.button
          : button // ignore: cast_nullable_to_non_nullable
              as Button?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModalWithTitleAndButtonRendererImpl
    implements _ModalWithTitleAndButtonRenderer {
  const _$ModalWithTitleAndButtonRendererImpl(
      {this.title, this.content, this.button});

  factory _$ModalWithTitleAndButtonRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ModalWithTitleAndButtonRendererImplFromJson(json);

  @override
  final Title? title;
  @override
  final Title? content;
  @override
  final Button? button;

  @override
  String toString() {
    return 'ModalWithTitleAndButtonRenderer(title: $title, content: $content, button: $button)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModalWithTitleAndButtonRendererImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.button, button) || other.button == button));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, button);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModalWithTitleAndButtonRendererImplCopyWith<
          _$ModalWithTitleAndButtonRendererImpl>
      get copyWith => __$$ModalWithTitleAndButtonRendererImplCopyWithImpl<
          _$ModalWithTitleAndButtonRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModalWithTitleAndButtonRendererImplToJson(
      this,
    );
  }
}

abstract class _ModalWithTitleAndButtonRenderer
    implements ModalWithTitleAndButtonRenderer {
  const factory _ModalWithTitleAndButtonRenderer(
      {final Title? title,
      final Title? content,
      final Button? button}) = _$ModalWithTitleAndButtonRendererImpl;

  factory _ModalWithTitleAndButtonRenderer.fromJson(Map<String, dynamic> json) =
      _$ModalWithTitleAndButtonRendererImpl.fromJson;

  @override
  Title? get title;
  @override
  Title? get content;
  @override
  Button? get button;
  @override
  @JsonKey(ignore: true)
  _$$ModalWithTitleAndButtonRendererImplCopyWith<
          _$ModalWithTitleAndButtonRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return _Button.fromJson(json);
}

/// @nodoc
mixin _$Button {
  ButtonRenderer? get buttonRenderer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonCopyWith<Button> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonCopyWith<$Res> {
  factory $ButtonCopyWith(Button value, $Res Function(Button) then) =
      _$ButtonCopyWithImpl<$Res, Button>;
  @useResult
  $Res call({ButtonRenderer? buttonRenderer});

  $ButtonRendererCopyWith<$Res>? get buttonRenderer;
}

/// @nodoc
class _$ButtonCopyWithImpl<$Res, $Val extends Button>
    implements $ButtonCopyWith<$Res> {
  _$ButtonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buttonRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      buttonRenderer: freezed == buttonRenderer
          ? _value.buttonRenderer
          : buttonRenderer // ignore: cast_nullable_to_non_nullable
              as ButtonRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ButtonRendererCopyWith<$Res>? get buttonRenderer {
    if (_value.buttonRenderer == null) {
      return null;
    }

    return $ButtonRendererCopyWith<$Res>(_value.buttonRenderer!, (value) {
      return _then(_value.copyWith(buttonRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ButtonImplCopyWith<$Res> implements $ButtonCopyWith<$Res> {
  factory _$$ButtonImplCopyWith(
          _$ButtonImpl value, $Res Function(_$ButtonImpl) then) =
      __$$ButtonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ButtonRenderer? buttonRenderer});

  @override
  $ButtonRendererCopyWith<$Res>? get buttonRenderer;
}

/// @nodoc
class __$$ButtonImplCopyWithImpl<$Res>
    extends _$ButtonCopyWithImpl<$Res, _$ButtonImpl>
    implements _$$ButtonImplCopyWith<$Res> {
  __$$ButtonImplCopyWithImpl(
      _$ButtonImpl _value, $Res Function(_$ButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buttonRenderer = freezed,
  }) {
    return _then(_$ButtonImpl(
      buttonRenderer: freezed == buttonRenderer
          ? _value.buttonRenderer
          : buttonRenderer // ignore: cast_nullable_to_non_nullable
              as ButtonRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ButtonImpl implements _Button {
  const _$ButtonImpl({this.buttonRenderer});

  factory _$ButtonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ButtonImplFromJson(json);

  @override
  final ButtonRenderer? buttonRenderer;

  @override
  String toString() {
    return 'Button(buttonRenderer: $buttonRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonImpl &&
            (identical(other.buttonRenderer, buttonRenderer) ||
                other.buttonRenderer == buttonRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, buttonRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonImplCopyWith<_$ButtonImpl> get copyWith =>
      __$$ButtonImplCopyWithImpl<_$ButtonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ButtonImplToJson(
      this,
    );
  }
}

abstract class _Button implements Button {
  const factory _Button({final ButtonRenderer? buttonRenderer}) = _$ButtonImpl;

  factory _Button.fromJson(Map<String, dynamic> json) = _$ButtonImpl.fromJson;

  @override
  ButtonRenderer? get buttonRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ButtonImplCopyWith<_$ButtonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ButtonRenderer _$ButtonRendererFromJson(Map<String, dynamic> json) {
  return _ButtonRenderer.fromJson(json);
}

/// @nodoc
mixin _$ButtonRenderer {
  String? get style => throw _privateConstructorUsedError;
  bool? get isDisabled => throw _privateConstructorUsedError;
  Title? get text => throw _privateConstructorUsedError;
  ButtonRendererNavigationEndpoint? get navigationEndpoint =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonRendererCopyWith<ButtonRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonRendererCopyWith<$Res> {
  factory $ButtonRendererCopyWith(
          ButtonRenderer value, $Res Function(ButtonRenderer) then) =
      _$ButtonRendererCopyWithImpl<$Res, ButtonRenderer>;
  @useResult
  $Res call(
      {String? style,
      bool? isDisabled,
      Title? text,
      ButtonRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams});

  $TitleCopyWith<$Res>? get text;
  $ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;
}

/// @nodoc
class _$ButtonRendererCopyWithImpl<$Res, $Val extends ButtonRenderer>
    implements $ButtonRendererCopyWith<$Res> {
  _$ButtonRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = freezed,
    Object? isDisabled = freezed,
    Object? text = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as ButtonRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint {
    if (_value.navigationEndpoint == null) {
      return null;
    }

    return $ButtonRendererNavigationEndpointCopyWith<$Res>(
        _value.navigationEndpoint!, (value) {
      return _then(_value.copyWith(navigationEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ButtonRendererImplCopyWith<$Res>
    implements $ButtonRendererCopyWith<$Res> {
  factory _$$ButtonRendererImplCopyWith(_$ButtonRendererImpl value,
          $Res Function(_$ButtonRendererImpl) then) =
      __$$ButtonRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? style,
      bool? isDisabled,
      Title? text,
      ButtonRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams});

  @override
  $TitleCopyWith<$Res>? get text;
  @override
  $ButtonRendererNavigationEndpointCopyWith<$Res>? get navigationEndpoint;
}

/// @nodoc
class __$$ButtonRendererImplCopyWithImpl<$Res>
    extends _$ButtonRendererCopyWithImpl<$Res, _$ButtonRendererImpl>
    implements _$$ButtonRendererImplCopyWith<$Res> {
  __$$ButtonRendererImplCopyWithImpl(
      _$ButtonRendererImpl _value, $Res Function(_$ButtonRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = freezed,
    Object? isDisabled = freezed,
    Object? text = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$ButtonRendererImpl(
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as ButtonRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ButtonRendererImpl implements _ButtonRenderer {
  const _$ButtonRendererImpl(
      {this.style,
      this.isDisabled,
      this.text,
      this.navigationEndpoint,
      this.trackingParams});

  factory _$ButtonRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$ButtonRendererImplFromJson(json);

  @override
  final String? style;
  @override
  final bool? isDisabled;
  @override
  final Title? text;
  @override
  final ButtonRendererNavigationEndpoint? navigationEndpoint;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'ButtonRenderer(style: $style, isDisabled: $isDisabled, text: $text, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonRendererImpl &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, style, isDisabled, text, navigationEndpoint, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonRendererImplCopyWith<_$ButtonRendererImpl> get copyWith =>
      __$$ButtonRendererImplCopyWithImpl<_$ButtonRendererImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ButtonRendererImplToJson(
      this,
    );
  }
}

abstract class _ButtonRenderer implements ButtonRenderer {
  const factory _ButtonRenderer(
      {final String? style,
      final bool? isDisabled,
      final Title? text,
      final ButtonRendererNavigationEndpoint? navigationEndpoint,
      final String? trackingParams}) = _$ButtonRendererImpl;

  factory _ButtonRenderer.fromJson(Map<String, dynamic> json) =
      _$ButtonRendererImpl.fromJson;

  @override
  String? get style;
  @override
  bool? get isDisabled;
  @override
  Title? get text;
  @override
  ButtonRendererNavigationEndpoint? get navigationEndpoint;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$ButtonRendererImplCopyWith<_$ButtonRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ButtonRendererNavigationEndpoint _$ButtonRendererNavigationEndpointFromJson(
    Map<String, dynamic> json) {
  return _ButtonRendererNavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$ButtonRendererNavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  SignInEndpoint? get signInEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonRendererNavigationEndpointCopyWith<ButtonRendererNavigationEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonRendererNavigationEndpointCopyWith<$Res> {
  factory $ButtonRendererNavigationEndpointCopyWith(
          ButtonRendererNavigationEndpoint value,
          $Res Function(ButtonRendererNavigationEndpoint) then) =
      _$ButtonRendererNavigationEndpointCopyWithImpl<$Res,
          ButtonRendererNavigationEndpoint>;
  @useResult
  $Res call({String? clickTrackingParams, SignInEndpoint? signInEndpoint});

  $SignInEndpointCopyWith<$Res>? get signInEndpoint;
}

/// @nodoc
class _$ButtonRendererNavigationEndpointCopyWithImpl<$Res,
        $Val extends ButtonRendererNavigationEndpoint>
    implements $ButtonRendererNavigationEndpointCopyWith<$Res> {
  _$ButtonRendererNavigationEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? signInEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      signInEndpoint: freezed == signInEndpoint
          ? _value.signInEndpoint
          : signInEndpoint // ignore: cast_nullable_to_non_nullable
              as SignInEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignInEndpointCopyWith<$Res>? get signInEndpoint {
    if (_value.signInEndpoint == null) {
      return null;
    }

    return $SignInEndpointCopyWith<$Res>(_value.signInEndpoint!, (value) {
      return _then(_value.copyWith(signInEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ButtonRendererNavigationEndpointImplCopyWith<$Res>
    implements $ButtonRendererNavigationEndpointCopyWith<$Res> {
  factory _$$ButtonRendererNavigationEndpointImplCopyWith(
          _$ButtonRendererNavigationEndpointImpl value,
          $Res Function(_$ButtonRendererNavigationEndpointImpl) then) =
      __$$ButtonRendererNavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, SignInEndpoint? signInEndpoint});

  @override
  $SignInEndpointCopyWith<$Res>? get signInEndpoint;
}

/// @nodoc
class __$$ButtonRendererNavigationEndpointImplCopyWithImpl<$Res>
    extends _$ButtonRendererNavigationEndpointCopyWithImpl<$Res,
        _$ButtonRendererNavigationEndpointImpl>
    implements _$$ButtonRendererNavigationEndpointImplCopyWith<$Res> {
  __$$ButtonRendererNavigationEndpointImplCopyWithImpl(
      _$ButtonRendererNavigationEndpointImpl _value,
      $Res Function(_$ButtonRendererNavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? signInEndpoint = freezed,
  }) {
    return _then(_$ButtonRendererNavigationEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      signInEndpoint: freezed == signInEndpoint
          ? _value.signInEndpoint
          : signInEndpoint // ignore: cast_nullable_to_non_nullable
              as SignInEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ButtonRendererNavigationEndpointImpl
    implements _ButtonRendererNavigationEndpoint {
  const _$ButtonRendererNavigationEndpointImpl(
      {this.clickTrackingParams, this.signInEndpoint});

  factory _$ButtonRendererNavigationEndpointImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ButtonRendererNavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final SignInEndpoint? signInEndpoint;

  @override
  String toString() {
    return 'ButtonRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, signInEndpoint: $signInEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonRendererNavigationEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.signInEndpoint, signInEndpoint) ||
                other.signInEndpoint == signInEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, signInEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonRendererNavigationEndpointImplCopyWith<
          _$ButtonRendererNavigationEndpointImpl>
      get copyWith => __$$ButtonRendererNavigationEndpointImplCopyWithImpl<
          _$ButtonRendererNavigationEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ButtonRendererNavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _ButtonRendererNavigationEndpoint
    implements ButtonRendererNavigationEndpoint {
  const factory _ButtonRendererNavigationEndpoint(
          {final String? clickTrackingParams,
          final SignInEndpoint? signInEndpoint}) =
      _$ButtonRendererNavigationEndpointImpl;

  factory _ButtonRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =
      _$ButtonRendererNavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  SignInEndpoint? get signInEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$ButtonRendererNavigationEndpointImplCopyWith<
          _$ButtonRendererNavigationEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SignInEndpoint _$SignInEndpointFromJson(Map<String, dynamic> json) {
  return _SignInEndpoint.fromJson(json);
}

/// @nodoc
mixin _$SignInEndpoint {
  bool? get hack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInEndpointCopyWith<SignInEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEndpointCopyWith<$Res> {
  factory $SignInEndpointCopyWith(
          SignInEndpoint value, $Res Function(SignInEndpoint) then) =
      _$SignInEndpointCopyWithImpl<$Res, SignInEndpoint>;
  @useResult
  $Res call({bool? hack});
}

/// @nodoc
class _$SignInEndpointCopyWithImpl<$Res, $Val extends SignInEndpoint>
    implements $SignInEndpointCopyWith<$Res> {
  _$SignInEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hack = freezed,
  }) {
    return _then(_value.copyWith(
      hack: freezed == hack
          ? _value.hack
          : hack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInEndpointImplCopyWith<$Res>
    implements $SignInEndpointCopyWith<$Res> {
  factory _$$SignInEndpointImplCopyWith(_$SignInEndpointImpl value,
          $Res Function(_$SignInEndpointImpl) then) =
      __$$SignInEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? hack});
}

/// @nodoc
class __$$SignInEndpointImplCopyWithImpl<$Res>
    extends _$SignInEndpointCopyWithImpl<$Res, _$SignInEndpointImpl>
    implements _$$SignInEndpointImplCopyWith<$Res> {
  __$$SignInEndpointImplCopyWithImpl(
      _$SignInEndpointImpl _value, $Res Function(_$SignInEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hack = freezed,
  }) {
    return _then(_$SignInEndpointImpl(
      hack: freezed == hack
          ? _value.hack
          : hack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInEndpointImpl implements _SignInEndpoint {
  const _$SignInEndpointImpl({this.hack});

  factory _$SignInEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInEndpointImplFromJson(json);

  @override
  final bool? hack;

  @override
  String toString() {
    return 'SignInEndpoint(hack: $hack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEndpointImpl &&
            (identical(other.hack, hack) || other.hack == hack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEndpointImplCopyWith<_$SignInEndpointImpl> get copyWith =>
      __$$SignInEndpointImplCopyWithImpl<_$SignInEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInEndpointImplToJson(
      this,
    );
  }
}

abstract class _SignInEndpoint implements SignInEndpoint {
  const factory _SignInEndpoint({final bool? hack}) = _$SignInEndpointImpl;

  factory _SignInEndpoint.fromJson(Map<String, dynamic> json) =
      _$SignInEndpointImpl.fromJson;

  @override
  bool? get hack;
  @override
  @JsonKey(ignore: true)
  _$$SignInEndpointImplCopyWith<_$SignInEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurpleWatchEndpoint _$PurpleWatchEndpointFromJson(Map<String, dynamic> json) {
  return _PurpleWatchEndpoint.fromJson(json);
}

/// @nodoc
mixin _$PurpleWatchEndpoint {
  String? get videoId => throw _privateConstructorUsedError;
  String? get playlistId => throw _privateConstructorUsedError;
  String? get params => throw _privateConstructorUsedError;
  LoggingContext? get loggingContext => throw _privateConstructorUsedError;
  WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurpleWatchEndpointCopyWith<PurpleWatchEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurpleWatchEndpointCopyWith<$Res> {
  factory $PurpleWatchEndpointCopyWith(
          PurpleWatchEndpoint value, $Res Function(PurpleWatchEndpoint) then) =
      _$PurpleWatchEndpointCopyWithImpl<$Res, PurpleWatchEndpoint>;
  @useResult
  $Res call(
      {String? videoId,
      String? playlistId,
      String? params,
      LoggingContext? loggingContext,
      WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs});

  $LoggingContextCopyWith<$Res>? get loggingContext;
  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs;
}

/// @nodoc
class _$PurpleWatchEndpointCopyWithImpl<$Res, $Val extends PurpleWatchEndpoint>
    implements $PurpleWatchEndpointCopyWith<$Res> {
  _$PurpleWatchEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? playlistId = freezed,
    Object? params = freezed,
    Object? loggingContext = freezed,
    Object? watchEndpointMusicSupportedConfigs = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
      loggingContext: freezed == loggingContext
          ? _value.loggingContext
          : loggingContext // ignore: cast_nullable_to_non_nullable
              as LoggingContext?,
      watchEndpointMusicSupportedConfigs: freezed ==
              watchEndpointMusicSupportedConfigs
          ? _value.watchEndpointMusicSupportedConfigs
          : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicSupportedConfigs?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoggingContextCopyWith<$Res>? get loggingContext {
    if (_value.loggingContext == null) {
      return null;
    }

    return $LoggingContextCopyWith<$Res>(_value.loggingContext!, (value) {
      return _then(_value.copyWith(loggingContext: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs {
    if (_value.watchEndpointMusicSupportedConfigs == null) {
      return null;
    }

    return $WatchEndpointMusicSupportedConfigsCopyWith<$Res>(
        _value.watchEndpointMusicSupportedConfigs!, (value) {
      return _then(
          _value.copyWith(watchEndpointMusicSupportedConfigs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurpleWatchEndpointImplCopyWith<$Res>
    implements $PurpleWatchEndpointCopyWith<$Res> {
  factory _$$PurpleWatchEndpointImplCopyWith(_$PurpleWatchEndpointImpl value,
          $Res Function(_$PurpleWatchEndpointImpl) then) =
      __$$PurpleWatchEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? videoId,
      String? playlistId,
      String? params,
      LoggingContext? loggingContext,
      WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs});

  @override
  $LoggingContextCopyWith<$Res>? get loggingContext;
  @override
  $WatchEndpointMusicSupportedConfigsCopyWith<$Res>?
      get watchEndpointMusicSupportedConfigs;
}

/// @nodoc
class __$$PurpleWatchEndpointImplCopyWithImpl<$Res>
    extends _$PurpleWatchEndpointCopyWithImpl<$Res, _$PurpleWatchEndpointImpl>
    implements _$$PurpleWatchEndpointImplCopyWith<$Res> {
  __$$PurpleWatchEndpointImplCopyWithImpl(_$PurpleWatchEndpointImpl _value,
      $Res Function(_$PurpleWatchEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? playlistId = freezed,
    Object? params = freezed,
    Object? loggingContext = freezed,
    Object? watchEndpointMusicSupportedConfigs = freezed,
  }) {
    return _then(_$PurpleWatchEndpointImpl(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
      loggingContext: freezed == loggingContext
          ? _value.loggingContext
          : loggingContext // ignore: cast_nullable_to_non_nullable
              as LoggingContext?,
      watchEndpointMusicSupportedConfigs: freezed ==
              watchEndpointMusicSupportedConfigs
          ? _value.watchEndpointMusicSupportedConfigs
          : watchEndpointMusicSupportedConfigs // ignore: cast_nullable_to_non_nullable
              as WatchEndpointMusicSupportedConfigs?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurpleWatchEndpointImpl implements _PurpleWatchEndpoint {
  const _$PurpleWatchEndpointImpl(
      {this.videoId,
      this.playlistId,
      this.params,
      this.loggingContext,
      this.watchEndpointMusicSupportedConfigs});

  factory _$PurpleWatchEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurpleWatchEndpointImplFromJson(json);

  @override
  final String? videoId;
  @override
  final String? playlistId;
  @override
  final String? params;
  @override
  final LoggingContext? loggingContext;
  @override
  final WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs;

  @override
  String toString() {
    return 'PurpleWatchEndpoint(videoId: $videoId, playlistId: $playlistId, params: $params, loggingContext: $loggingContext, watchEndpointMusicSupportedConfigs: $watchEndpointMusicSupportedConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurpleWatchEndpointImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.loggingContext, loggingContext) ||
                other.loggingContext == loggingContext) &&
            (identical(other.watchEndpointMusicSupportedConfigs,
                    watchEndpointMusicSupportedConfigs) ||
                other.watchEndpointMusicSupportedConfigs ==
                    watchEndpointMusicSupportedConfigs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, videoId, playlistId, params,
      loggingContext, watchEndpointMusicSupportedConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurpleWatchEndpointImplCopyWith<_$PurpleWatchEndpointImpl> get copyWith =>
      __$$PurpleWatchEndpointImplCopyWithImpl<_$PurpleWatchEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurpleWatchEndpointImplToJson(
      this,
    );
  }
}

abstract class _PurpleWatchEndpoint implements PurpleWatchEndpoint {
  const factory _PurpleWatchEndpoint(
      {final String? videoId,
      final String? playlistId,
      final String? params,
      final LoggingContext? loggingContext,
      final WatchEndpointMusicSupportedConfigs?
          watchEndpointMusicSupportedConfigs}) = _$PurpleWatchEndpointImpl;

  factory _PurpleWatchEndpoint.fromJson(Map<String, dynamic> json) =
      _$PurpleWatchEndpointImpl.fromJson;

  @override
  String? get videoId;
  @override
  String? get playlistId;
  @override
  String? get params;
  @override
  LoggingContext? get loggingContext;
  @override
  WatchEndpointMusicSupportedConfigs? get watchEndpointMusicSupportedConfigs;
  @override
  @JsonKey(ignore: true)
  _$$PurpleWatchEndpointImplCopyWith<_$PurpleWatchEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoggingContext _$LoggingContextFromJson(Map<String, dynamic> json) {
  return _LoggingContext.fromJson(json);
}

/// @nodoc
mixin _$LoggingContext {
  VssLoggingContext? get vssLoggingContext =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggingContextCopyWith<LoggingContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggingContextCopyWith<$Res> {
  factory $LoggingContextCopyWith(
          LoggingContext value, $Res Function(LoggingContext) then) =
      _$LoggingContextCopyWithImpl<$Res, LoggingContext>;
  @useResult
  $Res call({VssLoggingContext? vssLoggingContext});

  $VssLoggingContextCopyWith<$Res>? get vssLoggingContext;
}

/// @nodoc
class _$LoggingContextCopyWithImpl<$Res, $Val extends LoggingContext>
    implements $LoggingContextCopyWith<$Res> {
  _$LoggingContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vssLoggingContext = freezed,
  }) {
    return _then(_value.copyWith(
      vssLoggingContext: freezed == vssLoggingContext
          ? _value.vssLoggingContext
          : vssLoggingContext // ignore: cast_nullable_to_non_nullable
              as VssLoggingContext?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VssLoggingContextCopyWith<$Res>? get vssLoggingContext {
    if (_value.vssLoggingContext == null) {
      return null;
    }

    return $VssLoggingContextCopyWith<$Res>(_value.vssLoggingContext!, (value) {
      return _then(_value.copyWith(vssLoggingContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoggingContextImplCopyWith<$Res>
    implements $LoggingContextCopyWith<$Res> {
  factory _$$LoggingContextImplCopyWith(_$LoggingContextImpl value,
          $Res Function(_$LoggingContextImpl) then) =
      __$$LoggingContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VssLoggingContext? vssLoggingContext});

  @override
  $VssLoggingContextCopyWith<$Res>? get vssLoggingContext;
}

/// @nodoc
class __$$LoggingContextImplCopyWithImpl<$Res>
    extends _$LoggingContextCopyWithImpl<$Res, _$LoggingContextImpl>
    implements _$$LoggingContextImplCopyWith<$Res> {
  __$$LoggingContextImplCopyWithImpl(
      _$LoggingContextImpl _value, $Res Function(_$LoggingContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vssLoggingContext = freezed,
  }) {
    return _then(_$LoggingContextImpl(
      vssLoggingContext: freezed == vssLoggingContext
          ? _value.vssLoggingContext
          : vssLoggingContext // ignore: cast_nullable_to_non_nullable
              as VssLoggingContext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggingContextImpl implements _LoggingContext {
  const _$LoggingContextImpl({this.vssLoggingContext});

  factory _$LoggingContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggingContextImplFromJson(json);

  @override
  final VssLoggingContext? vssLoggingContext;

  @override
  String toString() {
    return 'LoggingContext(vssLoggingContext: $vssLoggingContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggingContextImpl &&
            (identical(other.vssLoggingContext, vssLoggingContext) ||
                other.vssLoggingContext == vssLoggingContext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vssLoggingContext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggingContextImplCopyWith<_$LoggingContextImpl> get copyWith =>
      __$$LoggingContextImplCopyWithImpl<_$LoggingContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggingContextImplToJson(
      this,
    );
  }
}

abstract class _LoggingContext implements LoggingContext {
  const factory _LoggingContext({final VssLoggingContext? vssLoggingContext}) =
      _$LoggingContextImpl;

  factory _LoggingContext.fromJson(Map<String, dynamic> json) =
      _$LoggingContextImpl.fromJson;

  @override
  VssLoggingContext? get vssLoggingContext;
  @override
  @JsonKey(ignore: true)
  _$$LoggingContextImplCopyWith<_$LoggingContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VssLoggingContext _$VssLoggingContextFromJson(Map<String, dynamic> json) {
  return _VssLoggingContext.fromJson(json);
}

/// @nodoc
mixin _$VssLoggingContext {
  String? get serializedContextData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VssLoggingContextCopyWith<VssLoggingContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VssLoggingContextCopyWith<$Res> {
  factory $VssLoggingContextCopyWith(
          VssLoggingContext value, $Res Function(VssLoggingContext) then) =
      _$VssLoggingContextCopyWithImpl<$Res, VssLoggingContext>;
  @useResult
  $Res call({String? serializedContextData});
}

/// @nodoc
class _$VssLoggingContextCopyWithImpl<$Res, $Val extends VssLoggingContext>
    implements $VssLoggingContextCopyWith<$Res> {
  _$VssLoggingContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serializedContextData = freezed,
  }) {
    return _then(_value.copyWith(
      serializedContextData: freezed == serializedContextData
          ? _value.serializedContextData
          : serializedContextData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VssLoggingContextImplCopyWith<$Res>
    implements $VssLoggingContextCopyWith<$Res> {
  factory _$$VssLoggingContextImplCopyWith(_$VssLoggingContextImpl value,
          $Res Function(_$VssLoggingContextImpl) then) =
      __$$VssLoggingContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? serializedContextData});
}

/// @nodoc
class __$$VssLoggingContextImplCopyWithImpl<$Res>
    extends _$VssLoggingContextCopyWithImpl<$Res, _$VssLoggingContextImpl>
    implements _$$VssLoggingContextImplCopyWith<$Res> {
  __$$VssLoggingContextImplCopyWithImpl(_$VssLoggingContextImpl _value,
      $Res Function(_$VssLoggingContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serializedContextData = freezed,
  }) {
    return _then(_$VssLoggingContextImpl(
      serializedContextData: freezed == serializedContextData
          ? _value.serializedContextData
          : serializedContextData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VssLoggingContextImpl implements _VssLoggingContext {
  const _$VssLoggingContextImpl({this.serializedContextData});

  factory _$VssLoggingContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$VssLoggingContextImplFromJson(json);

  @override
  final String? serializedContextData;

  @override
  String toString() {
    return 'VssLoggingContext(serializedContextData: $serializedContextData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VssLoggingContextImpl &&
            (identical(other.serializedContextData, serializedContextData) ||
                other.serializedContextData == serializedContextData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serializedContextData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VssLoggingContextImplCopyWith<_$VssLoggingContextImpl> get copyWith =>
      __$$VssLoggingContextImplCopyWithImpl<_$VssLoggingContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VssLoggingContextImplToJson(
      this,
    );
  }
}

abstract class _VssLoggingContext implements VssLoggingContext {
  const factory _VssLoggingContext({final String? serializedContextData}) =
      _$VssLoggingContextImpl;

  factory _VssLoggingContext.fromJson(Map<String, dynamic> json) =
      _$VssLoggingContextImpl.fromJson;

  @override
  String? get serializedContextData;
  @override
  @JsonKey(ignore: true)
  _$$VssLoggingContextImplCopyWith<_$VssLoggingContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceEndpoint _$ServiceEndpointFromJson(Map<String, dynamic> json) {
  return _ServiceEndpoint.fromJson(json);
}

/// @nodoc
mixin _$ServiceEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  QueueAddEndpoint? get queueAddEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceEndpointCopyWith<ServiceEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEndpointCopyWith<$Res> {
  factory $ServiceEndpointCopyWith(
          ServiceEndpoint value, $Res Function(ServiceEndpoint) then) =
      _$ServiceEndpointCopyWithImpl<$Res, ServiceEndpoint>;
  @useResult
  $Res call({String? clickTrackingParams, QueueAddEndpoint? queueAddEndpoint});

  $QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint;
}

/// @nodoc
class _$ServiceEndpointCopyWithImpl<$Res, $Val extends ServiceEndpoint>
    implements $ServiceEndpointCopyWith<$Res> {
  _$ServiceEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? queueAddEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      queueAddEndpoint: freezed == queueAddEndpoint
          ? _value.queueAddEndpoint
          : queueAddEndpoint // ignore: cast_nullable_to_non_nullable
              as QueueAddEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint {
    if (_value.queueAddEndpoint == null) {
      return null;
    }

    return $QueueAddEndpointCopyWith<$Res>(_value.queueAddEndpoint!, (value) {
      return _then(_value.copyWith(queueAddEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceEndpointImplCopyWith<$Res>
    implements $ServiceEndpointCopyWith<$Res> {
  factory _$$ServiceEndpointImplCopyWith(_$ServiceEndpointImpl value,
          $Res Function(_$ServiceEndpointImpl) then) =
      __$$ServiceEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, QueueAddEndpoint? queueAddEndpoint});

  @override
  $QueueAddEndpointCopyWith<$Res>? get queueAddEndpoint;
}

/// @nodoc
class __$$ServiceEndpointImplCopyWithImpl<$Res>
    extends _$ServiceEndpointCopyWithImpl<$Res, _$ServiceEndpointImpl>
    implements _$$ServiceEndpointImplCopyWith<$Res> {
  __$$ServiceEndpointImplCopyWithImpl(
      _$ServiceEndpointImpl _value, $Res Function(_$ServiceEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? queueAddEndpoint = freezed,
  }) {
    return _then(_$ServiceEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      queueAddEndpoint: freezed == queueAddEndpoint
          ? _value.queueAddEndpoint
          : queueAddEndpoint // ignore: cast_nullable_to_non_nullable
              as QueueAddEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceEndpointImpl implements _ServiceEndpoint {
  const _$ServiceEndpointImpl(
      {this.clickTrackingParams, this.queueAddEndpoint});

  factory _$ServiceEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final QueueAddEndpoint? queueAddEndpoint;

  @override
  String toString() {
    return 'ServiceEndpoint(clickTrackingParams: $clickTrackingParams, queueAddEndpoint: $queueAddEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.queueAddEndpoint, queueAddEndpoint) ||
                other.queueAddEndpoint == queueAddEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, queueAddEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceEndpointImplCopyWith<_$ServiceEndpointImpl> get copyWith =>
      __$$ServiceEndpointImplCopyWithImpl<_$ServiceEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceEndpointImplToJson(
      this,
    );
  }
}

abstract class _ServiceEndpoint implements ServiceEndpoint {
  const factory _ServiceEndpoint(
      {final String? clickTrackingParams,
      final QueueAddEndpoint? queueAddEndpoint}) = _$ServiceEndpointImpl;

  factory _ServiceEndpoint.fromJson(Map<String, dynamic> json) =
      _$ServiceEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  QueueAddEndpoint? get queueAddEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$ServiceEndpointImplCopyWith<_$ServiceEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueueAddEndpoint _$QueueAddEndpointFromJson(Map<String, dynamic> json) {
  return _QueueAddEndpoint.fromJson(json);
}

/// @nodoc
mixin _$QueueAddEndpoint {
  QueueTarget? get queueTarget => throw _privateConstructorUsedError;
  String? get queueInsertPosition => throw _privateConstructorUsedError;
  List<Command>? get commands => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueueAddEndpointCopyWith<QueueAddEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueAddEndpointCopyWith<$Res> {
  factory $QueueAddEndpointCopyWith(
          QueueAddEndpoint value, $Res Function(QueueAddEndpoint) then) =
      _$QueueAddEndpointCopyWithImpl<$Res, QueueAddEndpoint>;
  @useResult
  $Res call(
      {QueueTarget? queueTarget,
      String? queueInsertPosition,
      List<Command>? commands});

  $QueueTargetCopyWith<$Res>? get queueTarget;
}

/// @nodoc
class _$QueueAddEndpointCopyWithImpl<$Res, $Val extends QueueAddEndpoint>
    implements $QueueAddEndpointCopyWith<$Res> {
  _$QueueAddEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queueTarget = freezed,
    Object? queueInsertPosition = freezed,
    Object? commands = freezed,
  }) {
    return _then(_value.copyWith(
      queueTarget: freezed == queueTarget
          ? _value.queueTarget
          : queueTarget // ignore: cast_nullable_to_non_nullable
              as QueueTarget?,
      queueInsertPosition: freezed == queueInsertPosition
          ? _value.queueInsertPosition
          : queueInsertPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      commands: freezed == commands
          ? _value.commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<Command>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QueueTargetCopyWith<$Res>? get queueTarget {
    if (_value.queueTarget == null) {
      return null;
    }

    return $QueueTargetCopyWith<$Res>(_value.queueTarget!, (value) {
      return _then(_value.copyWith(queueTarget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueueAddEndpointImplCopyWith<$Res>
    implements $QueueAddEndpointCopyWith<$Res> {
  factory _$$QueueAddEndpointImplCopyWith(_$QueueAddEndpointImpl value,
          $Res Function(_$QueueAddEndpointImpl) then) =
      __$$QueueAddEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QueueTarget? queueTarget,
      String? queueInsertPosition,
      List<Command>? commands});

  @override
  $QueueTargetCopyWith<$Res>? get queueTarget;
}

/// @nodoc
class __$$QueueAddEndpointImplCopyWithImpl<$Res>
    extends _$QueueAddEndpointCopyWithImpl<$Res, _$QueueAddEndpointImpl>
    implements _$$QueueAddEndpointImplCopyWith<$Res> {
  __$$QueueAddEndpointImplCopyWithImpl(_$QueueAddEndpointImpl _value,
      $Res Function(_$QueueAddEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queueTarget = freezed,
    Object? queueInsertPosition = freezed,
    Object? commands = freezed,
  }) {
    return _then(_$QueueAddEndpointImpl(
      queueTarget: freezed == queueTarget
          ? _value.queueTarget
          : queueTarget // ignore: cast_nullable_to_non_nullable
              as QueueTarget?,
      queueInsertPosition: freezed == queueInsertPosition
          ? _value.queueInsertPosition
          : queueInsertPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      commands: freezed == commands
          ? _value._commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<Command>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueAddEndpointImpl implements _QueueAddEndpoint {
  const _$QueueAddEndpointImpl(
      {this.queueTarget,
      this.queueInsertPosition,
      final List<Command>? commands})
      : _commands = commands;

  factory _$QueueAddEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueAddEndpointImplFromJson(json);

  @override
  final QueueTarget? queueTarget;
  @override
  final String? queueInsertPosition;
  final List<Command>? _commands;
  @override
  List<Command>? get commands {
    final value = _commands;
    if (value == null) return null;
    if (_commands is EqualUnmodifiableListView) return _commands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueueAddEndpoint(queueTarget: $queueTarget, queueInsertPosition: $queueInsertPosition, commands: $commands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueAddEndpointImpl &&
            (identical(other.queueTarget, queueTarget) ||
                other.queueTarget == queueTarget) &&
            (identical(other.queueInsertPosition, queueInsertPosition) ||
                other.queueInsertPosition == queueInsertPosition) &&
            const DeepCollectionEquality().equals(other._commands, _commands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, queueTarget, queueInsertPosition,
      const DeepCollectionEquality().hash(_commands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueAddEndpointImplCopyWith<_$QueueAddEndpointImpl> get copyWith =>
      __$$QueueAddEndpointImplCopyWithImpl<_$QueueAddEndpointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueAddEndpointImplToJson(
      this,
    );
  }
}

abstract class _QueueAddEndpoint implements QueueAddEndpoint {
  const factory _QueueAddEndpoint(
      {final QueueTarget? queueTarget,
      final String? queueInsertPosition,
      final List<Command>? commands}) = _$QueueAddEndpointImpl;

  factory _QueueAddEndpoint.fromJson(Map<String, dynamic> json) =
      _$QueueAddEndpointImpl.fromJson;

  @override
  QueueTarget? get queueTarget;
  @override
  String? get queueInsertPosition;
  @override
  List<Command>? get commands;
  @override
  @JsonKey(ignore: true)
  _$$QueueAddEndpointImplCopyWith<_$QueueAddEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Command _$CommandFromJson(Map<String, dynamic> json) {
  return _Command.fromJson(json);
}

/// @nodoc
mixin _$Command {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  AddToToastAction? get addToToastAction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandCopyWith<Command> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
  @useResult
  $Res call({String? clickTrackingParams, AddToToastAction? addToToastAction});

  $AddToToastActionCopyWith<$Res>? get addToToastAction;
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? addToToastAction = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      addToToastAction: freezed == addToToastAction
          ? _value.addToToastAction
          : addToToastAction // ignore: cast_nullable_to_non_nullable
              as AddToToastAction?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddToToastActionCopyWith<$Res>? get addToToastAction {
    if (_value.addToToastAction == null) {
      return null;
    }

    return $AddToToastActionCopyWith<$Res>(_value.addToToastAction!, (value) {
      return _then(_value.copyWith(addToToastAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommandImplCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$$CommandImplCopyWith(
          _$CommandImpl value, $Res Function(_$CommandImpl) then) =
      __$$CommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, AddToToastAction? addToToastAction});

  @override
  $AddToToastActionCopyWith<$Res>? get addToToastAction;
}

/// @nodoc
class __$$CommandImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandImpl>
    implements _$$CommandImplCopyWith<$Res> {
  __$$CommandImplCopyWithImpl(
      _$CommandImpl _value, $Res Function(_$CommandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? addToToastAction = freezed,
  }) {
    return _then(_$CommandImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      addToToastAction: freezed == addToToastAction
          ? _value.addToToastAction
          : addToToastAction // ignore: cast_nullable_to_non_nullable
              as AddToToastAction?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommandImpl implements _Command {
  const _$CommandImpl({this.clickTrackingParams, this.addToToastAction});

  factory _$CommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final AddToToastAction? addToToastAction;

  @override
  String toString() {
    return 'Command(clickTrackingParams: $clickTrackingParams, addToToastAction: $addToToastAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.addToToastAction, addToToastAction) ||
                other.addToToastAction == addToToastAction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, addToToastAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      __$$CommandImplCopyWithImpl<_$CommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandImplToJson(
      this,
    );
  }
}

abstract class _Command implements Command {
  const factory _Command(
      {final String? clickTrackingParams,
      final AddToToastAction? addToToastAction}) = _$CommandImpl;

  factory _Command.fromJson(Map<String, dynamic> json) = _$CommandImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  AddToToastAction? get addToToastAction;
  @override
  @JsonKey(ignore: true)
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddToToastAction _$AddToToastActionFromJson(Map<String, dynamic> json) {
  return _AddToToastAction.fromJson(json);
}

/// @nodoc
mixin _$AddToToastAction {
  AddToToastActionItem? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToToastActionCopyWith<AddToToastAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToToastActionCopyWith<$Res> {
  factory $AddToToastActionCopyWith(
          AddToToastAction value, $Res Function(AddToToastAction) then) =
      _$AddToToastActionCopyWithImpl<$Res, AddToToastAction>;
  @useResult
  $Res call({AddToToastActionItem? item});

  $AddToToastActionItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$AddToToastActionCopyWithImpl<$Res, $Val extends AddToToastAction>
    implements $AddToToastActionCopyWith<$Res> {
  _$AddToToastActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AddToToastActionItem?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddToToastActionItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $AddToToastActionItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddToToastActionImplCopyWith<$Res>
    implements $AddToToastActionCopyWith<$Res> {
  factory _$$AddToToastActionImplCopyWith(_$AddToToastActionImpl value,
          $Res Function(_$AddToToastActionImpl) then) =
      __$$AddToToastActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddToToastActionItem? item});

  @override
  $AddToToastActionItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$$AddToToastActionImplCopyWithImpl<$Res>
    extends _$AddToToastActionCopyWithImpl<$Res, _$AddToToastActionImpl>
    implements _$$AddToToastActionImplCopyWith<$Res> {
  __$$AddToToastActionImplCopyWithImpl(_$AddToToastActionImpl _value,
      $Res Function(_$AddToToastActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$AddToToastActionImpl(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AddToToastActionItem?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddToToastActionImpl implements _AddToToastAction {
  const _$AddToToastActionImpl({this.item});

  factory _$AddToToastActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddToToastActionImplFromJson(json);

  @override
  final AddToToastActionItem? item;

  @override
  String toString() {
    return 'AddToToastAction(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToToastActionImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToToastActionImplCopyWith<_$AddToToastActionImpl> get copyWith =>
      __$$AddToToastActionImplCopyWithImpl<_$AddToToastActionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddToToastActionImplToJson(
      this,
    );
  }
}

abstract class _AddToToastAction implements AddToToastAction {
  const factory _AddToToastAction({final AddToToastActionItem? item}) =
      _$AddToToastActionImpl;

  factory _AddToToastAction.fromJson(Map<String, dynamic> json) =
      _$AddToToastActionImpl.fromJson;

  @override
  AddToToastActionItem? get item;
  @override
  @JsonKey(ignore: true)
  _$$AddToToastActionImplCopyWith<_$AddToToastActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddToToastActionItem _$AddToToastActionItemFromJson(Map<String, dynamic> json) {
  return _AddToToastActionItem.fromJson(json);
}

/// @nodoc
mixin _$AddToToastActionItem {
  NotificationTextRenderer? get notificationTextRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToToastActionItemCopyWith<AddToToastActionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToToastActionItemCopyWith<$Res> {
  factory $AddToToastActionItemCopyWith(AddToToastActionItem value,
          $Res Function(AddToToastActionItem) then) =
      _$AddToToastActionItemCopyWithImpl<$Res, AddToToastActionItem>;
  @useResult
  $Res call({NotificationTextRenderer? notificationTextRenderer});

  $NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer;
}

/// @nodoc
class _$AddToToastActionItemCopyWithImpl<$Res,
        $Val extends AddToToastActionItem>
    implements $AddToToastActionItemCopyWith<$Res> {
  _$AddToToastActionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationTextRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      notificationTextRenderer: freezed == notificationTextRenderer
          ? _value.notificationTextRenderer
          : notificationTextRenderer // ignore: cast_nullable_to_non_nullable
              as NotificationTextRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer {
    if (_value.notificationTextRenderer == null) {
      return null;
    }

    return $NotificationTextRendererCopyWith<$Res>(
        _value.notificationTextRenderer!, (value) {
      return _then(_value.copyWith(notificationTextRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddToToastActionItemImplCopyWith<$Res>
    implements $AddToToastActionItemCopyWith<$Res> {
  factory _$$AddToToastActionItemImplCopyWith(_$AddToToastActionItemImpl value,
          $Res Function(_$AddToToastActionItemImpl) then) =
      __$$AddToToastActionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationTextRenderer? notificationTextRenderer});

  @override
  $NotificationTextRendererCopyWith<$Res>? get notificationTextRenderer;
}

/// @nodoc
class __$$AddToToastActionItemImplCopyWithImpl<$Res>
    extends _$AddToToastActionItemCopyWithImpl<$Res, _$AddToToastActionItemImpl>
    implements _$$AddToToastActionItemImplCopyWith<$Res> {
  __$$AddToToastActionItemImplCopyWithImpl(_$AddToToastActionItemImpl _value,
      $Res Function(_$AddToToastActionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationTextRenderer = freezed,
  }) {
    return _then(_$AddToToastActionItemImpl(
      notificationTextRenderer: freezed == notificationTextRenderer
          ? _value.notificationTextRenderer
          : notificationTextRenderer // ignore: cast_nullable_to_non_nullable
              as NotificationTextRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddToToastActionItemImpl implements _AddToToastActionItem {
  const _$AddToToastActionItemImpl({this.notificationTextRenderer});

  factory _$AddToToastActionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddToToastActionItemImplFromJson(json);

  @override
  final NotificationTextRenderer? notificationTextRenderer;

  @override
  String toString() {
    return 'AddToToastActionItem(notificationTextRenderer: $notificationTextRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToToastActionItemImpl &&
            (identical(
                    other.notificationTextRenderer, notificationTextRenderer) ||
                other.notificationTextRenderer == notificationTextRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationTextRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToToastActionItemImplCopyWith<_$AddToToastActionItemImpl>
      get copyWith =>
          __$$AddToToastActionItemImplCopyWithImpl<_$AddToToastActionItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddToToastActionItemImplToJson(
      this,
    );
  }
}

abstract class _AddToToastActionItem implements AddToToastActionItem {
  const factory _AddToToastActionItem(
          {final NotificationTextRenderer? notificationTextRenderer}) =
      _$AddToToastActionItemImpl;

  factory _AddToToastActionItem.fromJson(Map<String, dynamic> json) =
      _$AddToToastActionItemImpl.fromJson;

  @override
  NotificationTextRenderer? get notificationTextRenderer;
  @override
  @JsonKey(ignore: true)
  _$$AddToToastActionItemImplCopyWith<_$AddToToastActionItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationTextRenderer _$NotificationTextRendererFromJson(
    Map<String, dynamic> json) {
  return _NotificationTextRenderer.fromJson(json);
}

/// @nodoc
mixin _$NotificationTextRenderer {
  Title? get successResponseText => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTextRendererCopyWith<NotificationTextRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTextRendererCopyWith<$Res> {
  factory $NotificationTextRendererCopyWith(NotificationTextRenderer value,
          $Res Function(NotificationTextRenderer) then) =
      _$NotificationTextRendererCopyWithImpl<$Res, NotificationTextRenderer>;
  @useResult
  $Res call({Title? successResponseText, String? trackingParams});

  $TitleCopyWith<$Res>? get successResponseText;
}

/// @nodoc
class _$NotificationTextRendererCopyWithImpl<$Res,
        $Val extends NotificationTextRenderer>
    implements $NotificationTextRendererCopyWith<$Res> {
  _$NotificationTextRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successResponseText = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      successResponseText: freezed == successResponseText
          ? _value.successResponseText
          : successResponseText // ignore: cast_nullable_to_non_nullable
              as Title?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get successResponseText {
    if (_value.successResponseText == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.successResponseText!, (value) {
      return _then(_value.copyWith(successResponseText: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationTextRendererImplCopyWith<$Res>
    implements $NotificationTextRendererCopyWith<$Res> {
  factory _$$NotificationTextRendererImplCopyWith(
          _$NotificationTextRendererImpl value,
          $Res Function(_$NotificationTextRendererImpl) then) =
      __$$NotificationTextRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Title? successResponseText, String? trackingParams});

  @override
  $TitleCopyWith<$Res>? get successResponseText;
}

/// @nodoc
class __$$NotificationTextRendererImplCopyWithImpl<$Res>
    extends _$NotificationTextRendererCopyWithImpl<$Res,
        _$NotificationTextRendererImpl>
    implements _$$NotificationTextRendererImplCopyWith<$Res> {
  __$$NotificationTextRendererImplCopyWithImpl(
      _$NotificationTextRendererImpl _value,
      $Res Function(_$NotificationTextRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successResponseText = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$NotificationTextRendererImpl(
      successResponseText: freezed == successResponseText
          ? _value.successResponseText
          : successResponseText // ignore: cast_nullable_to_non_nullable
              as Title?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationTextRendererImpl implements _NotificationTextRenderer {
  const _$NotificationTextRendererImpl(
      {this.successResponseText, this.trackingParams});

  factory _$NotificationTextRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTextRendererImplFromJson(json);

  @override
  final Title? successResponseText;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'NotificationTextRenderer(successResponseText: $successResponseText, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTextRendererImpl &&
            (identical(other.successResponseText, successResponseText) ||
                other.successResponseText == successResponseText) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, successResponseText, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTextRendererImplCopyWith<_$NotificationTextRendererImpl>
      get copyWith => __$$NotificationTextRendererImplCopyWithImpl<
          _$NotificationTextRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTextRendererImplToJson(
      this,
    );
  }
}

abstract class _NotificationTextRenderer implements NotificationTextRenderer {
  const factory _NotificationTextRenderer(
      {final Title? successResponseText,
      final String? trackingParams}) = _$NotificationTextRendererImpl;

  factory _NotificationTextRenderer.fromJson(Map<String, dynamic> json) =
      _$NotificationTextRendererImpl.fromJson;

  @override
  Title? get successResponseText;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTextRendererImplCopyWith<_$NotificationTextRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QueueTarget _$QueueTargetFromJson(Map<String, dynamic> json) {
  return _QueueTarget.fromJson(json);
}

/// @nodoc
mixin _$QueueTarget {
  String? get videoId => throw _privateConstructorUsedError;
  OnEmptyQueue? get onEmptyQueue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueueTargetCopyWith<QueueTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueTargetCopyWith<$Res> {
  factory $QueueTargetCopyWith(
          QueueTarget value, $Res Function(QueueTarget) then) =
      _$QueueTargetCopyWithImpl<$Res, QueueTarget>;
  @useResult
  $Res call({String? videoId, OnEmptyQueue? onEmptyQueue});

  $OnEmptyQueueCopyWith<$Res>? get onEmptyQueue;
}

/// @nodoc
class _$QueueTargetCopyWithImpl<$Res, $Val extends QueueTarget>
    implements $QueueTargetCopyWith<$Res> {
  _$QueueTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? onEmptyQueue = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      onEmptyQueue: freezed == onEmptyQueue
          ? _value.onEmptyQueue
          : onEmptyQueue // ignore: cast_nullable_to_non_nullable
              as OnEmptyQueue?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OnEmptyQueueCopyWith<$Res>? get onEmptyQueue {
    if (_value.onEmptyQueue == null) {
      return null;
    }

    return $OnEmptyQueueCopyWith<$Res>(_value.onEmptyQueue!, (value) {
      return _then(_value.copyWith(onEmptyQueue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueueTargetImplCopyWith<$Res>
    implements $QueueTargetCopyWith<$Res> {
  factory _$$QueueTargetImplCopyWith(
          _$QueueTargetImpl value, $Res Function(_$QueueTargetImpl) then) =
      __$$QueueTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? videoId, OnEmptyQueue? onEmptyQueue});

  @override
  $OnEmptyQueueCopyWith<$Res>? get onEmptyQueue;
}

/// @nodoc
class __$$QueueTargetImplCopyWithImpl<$Res>
    extends _$QueueTargetCopyWithImpl<$Res, _$QueueTargetImpl>
    implements _$$QueueTargetImplCopyWith<$Res> {
  __$$QueueTargetImplCopyWithImpl(
      _$QueueTargetImpl _value, $Res Function(_$QueueTargetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? onEmptyQueue = freezed,
  }) {
    return _then(_$QueueTargetImpl(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      onEmptyQueue: freezed == onEmptyQueue
          ? _value.onEmptyQueue
          : onEmptyQueue // ignore: cast_nullable_to_non_nullable
              as OnEmptyQueue?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueTargetImpl implements _QueueTarget {
  const _$QueueTargetImpl({this.videoId, this.onEmptyQueue});

  factory _$QueueTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueTargetImplFromJson(json);

  @override
  final String? videoId;
  @override
  final OnEmptyQueue? onEmptyQueue;

  @override
  String toString() {
    return 'QueueTarget(videoId: $videoId, onEmptyQueue: $onEmptyQueue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueTargetImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.onEmptyQueue, onEmptyQueue) ||
                other.onEmptyQueue == onEmptyQueue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, videoId, onEmptyQueue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueTargetImplCopyWith<_$QueueTargetImpl> get copyWith =>
      __$$QueueTargetImplCopyWithImpl<_$QueueTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueTargetImplToJson(
      this,
    );
  }
}

abstract class _QueueTarget implements QueueTarget {
  const factory _QueueTarget(
      {final String? videoId,
      final OnEmptyQueue? onEmptyQueue}) = _$QueueTargetImpl;

  factory _QueueTarget.fromJson(Map<String, dynamic> json) =
      _$QueueTargetImpl.fromJson;

  @override
  String? get videoId;
  @override
  OnEmptyQueue? get onEmptyQueue;
  @override
  @JsonKey(ignore: true)
  _$$QueueTargetImplCopyWith<_$QueueTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnEmptyQueue _$OnEmptyQueueFromJson(Map<String, dynamic> json) {
  return _OnEmptyQueue.fromJson(json);
}

/// @nodoc
mixin _$OnEmptyQueue {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  PlaylistItemData? get watchEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnEmptyQueueCopyWith<OnEmptyQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnEmptyQueueCopyWith<$Res> {
  factory $OnEmptyQueueCopyWith(
          OnEmptyQueue value, $Res Function(OnEmptyQueue) then) =
      _$OnEmptyQueueCopyWithImpl<$Res, OnEmptyQueue>;
  @useResult
  $Res call({String? clickTrackingParams, PlaylistItemData? watchEndpoint});

  $PlaylistItemDataCopyWith<$Res>? get watchEndpoint;
}

/// @nodoc
class _$OnEmptyQueueCopyWithImpl<$Res, $Val extends OnEmptyQueue>
    implements $OnEmptyQueueCopyWith<$Res> {
  _$OnEmptyQueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlaylistItemData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaylistItemDataCopyWith<$Res>? get watchEndpoint {
    if (_value.watchEndpoint == null) {
      return null;
    }

    return $PlaylistItemDataCopyWith<$Res>(_value.watchEndpoint!, (value) {
      return _then(_value.copyWith(watchEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnEmptyQueueImplCopyWith<$Res>
    implements $OnEmptyQueueCopyWith<$Res> {
  factory _$$OnEmptyQueueImplCopyWith(
          _$OnEmptyQueueImpl value, $Res Function(_$OnEmptyQueueImpl) then) =
      __$$OnEmptyQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, PlaylistItemData? watchEndpoint});

  @override
  $PlaylistItemDataCopyWith<$Res>? get watchEndpoint;
}

/// @nodoc
class __$$OnEmptyQueueImplCopyWithImpl<$Res>
    extends _$OnEmptyQueueCopyWithImpl<$Res, _$OnEmptyQueueImpl>
    implements _$$OnEmptyQueueImplCopyWith<$Res> {
  __$$OnEmptyQueueImplCopyWithImpl(
      _$OnEmptyQueueImpl _value, $Res Function(_$OnEmptyQueueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
  }) {
    return _then(_$OnEmptyQueueImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlaylistItemData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnEmptyQueueImpl implements _OnEmptyQueue {
  const _$OnEmptyQueueImpl({this.clickTrackingParams, this.watchEndpoint});

  factory _$OnEmptyQueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnEmptyQueueImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final PlaylistItemData? watchEndpoint;

  @override
  String toString() {
    return 'OnEmptyQueue(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEmptyQueueImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.watchEndpoint, watchEndpoint) ||
                other.watchEndpoint == watchEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, watchEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEmptyQueueImplCopyWith<_$OnEmptyQueueImpl> get copyWith =>
      __$$OnEmptyQueueImplCopyWithImpl<_$OnEmptyQueueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnEmptyQueueImplToJson(
      this,
    );
  }
}

abstract class _OnEmptyQueue implements OnEmptyQueue {
  const factory _OnEmptyQueue(
      {final String? clickTrackingParams,
      final PlaylistItemData? watchEndpoint}) = _$OnEmptyQueueImpl;

  factory _OnEmptyQueue.fromJson(Map<String, dynamic> json) =
      _$OnEmptyQueueImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  PlaylistItemData? get watchEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$OnEmptyQueueImplCopyWith<_$OnEmptyQueueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaylistItemData _$PlaylistItemDataFromJson(Map<String, dynamic> json) {
  return _PlaylistItemData.fromJson(json);
}

/// @nodoc
mixin _$PlaylistItemData {
  String? get videoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistItemDataCopyWith<PlaylistItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistItemDataCopyWith<$Res> {
  factory $PlaylistItemDataCopyWith(
          PlaylistItemData value, $Res Function(PlaylistItemData) then) =
      _$PlaylistItemDataCopyWithImpl<$Res, PlaylistItemData>;
  @useResult
  $Res call({String? videoId});
}

/// @nodoc
class _$PlaylistItemDataCopyWithImpl<$Res, $Val extends PlaylistItemData>
    implements $PlaylistItemDataCopyWith<$Res> {
  _$PlaylistItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistItemDataImplCopyWith<$Res>
    implements $PlaylistItemDataCopyWith<$Res> {
  factory _$$PlaylistItemDataImplCopyWith(_$PlaylistItemDataImpl value,
          $Res Function(_$PlaylistItemDataImpl) then) =
      __$$PlaylistItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? videoId});
}

/// @nodoc
class __$$PlaylistItemDataImplCopyWithImpl<$Res>
    extends _$PlaylistItemDataCopyWithImpl<$Res, _$PlaylistItemDataImpl>
    implements _$$PlaylistItemDataImplCopyWith<$Res> {
  __$$PlaylistItemDataImplCopyWithImpl(_$PlaylistItemDataImpl _value,
      $Res Function(_$PlaylistItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
  }) {
    return _then(_$PlaylistItemDataImpl(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistItemDataImpl implements _PlaylistItemData {
  const _$PlaylistItemDataImpl({this.videoId});

  factory _$PlaylistItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistItemDataImplFromJson(json);

  @override
  final String? videoId;

  @override
  String toString() {
    return 'PlaylistItemData(videoId: $videoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistItemDataImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, videoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistItemDataImplCopyWith<_$PlaylistItemDataImpl> get copyWith =>
      __$$PlaylistItemDataImplCopyWithImpl<_$PlaylistItemDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistItemDataImplToJson(
      this,
    );
  }
}

abstract class _PlaylistItemData implements PlaylistItemData {
  const factory _PlaylistItemData({final String? videoId}) =
      _$PlaylistItemDataImpl;

  factory _PlaylistItemData.fromJson(Map<String, dynamic> json) =
      _$PlaylistItemDataImpl.fromJson;

  @override
  String? get videoId;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistItemDataImplCopyWith<_$PlaylistItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToggleMenuServiceItemRenderer _$ToggleMenuServiceItemRendererFromJson(
    Map<String, dynamic> json) {
  return _ToggleMenuServiceItemRenderer.fromJson(json);
}

/// @nodoc
mixin _$ToggleMenuServiceItemRenderer {
  Title? get defaultText => throw _privateConstructorUsedError;
  Icon? get defaultIcon => throw _privateConstructorUsedError;
  DefaultServiceEndpoint? get defaultServiceEndpoint =>
      throw _privateConstructorUsedError;
  Title? get toggledText => throw _privateConstructorUsedError;
  Icon? get toggledIcon => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleMenuServiceItemRendererCopyWith<ToggleMenuServiceItemRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleMenuServiceItemRendererCopyWith<$Res> {
  factory $ToggleMenuServiceItemRendererCopyWith(
          ToggleMenuServiceItemRenderer value,
          $Res Function(ToggleMenuServiceItemRenderer) then) =
      _$ToggleMenuServiceItemRendererCopyWithImpl<$Res,
          ToggleMenuServiceItemRenderer>;
  @useResult
  $Res call(
      {Title? defaultText,
      Icon? defaultIcon,
      DefaultServiceEndpoint? defaultServiceEndpoint,
      Title? toggledText,
      Icon? toggledIcon,
      String? trackingParams});

  $TitleCopyWith<$Res>? get defaultText;
  $IconCopyWith<$Res>? get defaultIcon;
  $DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint;
  $TitleCopyWith<$Res>? get toggledText;
  $IconCopyWith<$Res>? get toggledIcon;
}

/// @nodoc
class _$ToggleMenuServiceItemRendererCopyWithImpl<$Res,
        $Val extends ToggleMenuServiceItemRenderer>
    implements $ToggleMenuServiceItemRendererCopyWith<$Res> {
  _$ToggleMenuServiceItemRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultText = freezed,
    Object? defaultIcon = freezed,
    Object? defaultServiceEndpoint = freezed,
    Object? toggledText = freezed,
    Object? toggledIcon = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      defaultText: freezed == defaultText
          ? _value.defaultText
          : defaultText // ignore: cast_nullable_to_non_nullable
              as Title?,
      defaultIcon: freezed == defaultIcon
          ? _value.defaultIcon
          : defaultIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      defaultServiceEndpoint: freezed == defaultServiceEndpoint
          ? _value.defaultServiceEndpoint
          : defaultServiceEndpoint // ignore: cast_nullable_to_non_nullable
              as DefaultServiceEndpoint?,
      toggledText: freezed == toggledText
          ? _value.toggledText
          : toggledText // ignore: cast_nullable_to_non_nullable
              as Title?,
      toggledIcon: freezed == toggledIcon
          ? _value.toggledIcon
          : toggledIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get defaultText {
    if (_value.defaultText == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.defaultText!, (value) {
      return _then(_value.copyWith(defaultText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get defaultIcon {
    if (_value.defaultIcon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.defaultIcon!, (value) {
      return _then(_value.copyWith(defaultIcon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint {
    if (_value.defaultServiceEndpoint == null) {
      return null;
    }

    return $DefaultServiceEndpointCopyWith<$Res>(_value.defaultServiceEndpoint!,
        (value) {
      return _then(_value.copyWith(defaultServiceEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get toggledText {
    if (_value.toggledText == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.toggledText!, (value) {
      return _then(_value.copyWith(toggledText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get toggledIcon {
    if (_value.toggledIcon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.toggledIcon!, (value) {
      return _then(_value.copyWith(toggledIcon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ToggleMenuServiceItemRendererImplCopyWith<$Res>
    implements $ToggleMenuServiceItemRendererCopyWith<$Res> {
  factory _$$ToggleMenuServiceItemRendererImplCopyWith(
          _$ToggleMenuServiceItemRendererImpl value,
          $Res Function(_$ToggleMenuServiceItemRendererImpl) then) =
      __$$ToggleMenuServiceItemRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Title? defaultText,
      Icon? defaultIcon,
      DefaultServiceEndpoint? defaultServiceEndpoint,
      Title? toggledText,
      Icon? toggledIcon,
      String? trackingParams});

  @override
  $TitleCopyWith<$Res>? get defaultText;
  @override
  $IconCopyWith<$Res>? get defaultIcon;
  @override
  $DefaultServiceEndpointCopyWith<$Res>? get defaultServiceEndpoint;
  @override
  $TitleCopyWith<$Res>? get toggledText;
  @override
  $IconCopyWith<$Res>? get toggledIcon;
}

/// @nodoc
class __$$ToggleMenuServiceItemRendererImplCopyWithImpl<$Res>
    extends _$ToggleMenuServiceItemRendererCopyWithImpl<$Res,
        _$ToggleMenuServiceItemRendererImpl>
    implements _$$ToggleMenuServiceItemRendererImplCopyWith<$Res> {
  __$$ToggleMenuServiceItemRendererImplCopyWithImpl(
      _$ToggleMenuServiceItemRendererImpl _value,
      $Res Function(_$ToggleMenuServiceItemRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultText = freezed,
    Object? defaultIcon = freezed,
    Object? defaultServiceEndpoint = freezed,
    Object? toggledText = freezed,
    Object? toggledIcon = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$ToggleMenuServiceItemRendererImpl(
      defaultText: freezed == defaultText
          ? _value.defaultText
          : defaultText // ignore: cast_nullable_to_non_nullable
              as Title?,
      defaultIcon: freezed == defaultIcon
          ? _value.defaultIcon
          : defaultIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      defaultServiceEndpoint: freezed == defaultServiceEndpoint
          ? _value.defaultServiceEndpoint
          : defaultServiceEndpoint // ignore: cast_nullable_to_non_nullable
              as DefaultServiceEndpoint?,
      toggledText: freezed == toggledText
          ? _value.toggledText
          : toggledText // ignore: cast_nullable_to_non_nullable
              as Title?,
      toggledIcon: freezed == toggledIcon
          ? _value.toggledIcon
          : toggledIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToggleMenuServiceItemRendererImpl
    implements _ToggleMenuServiceItemRenderer {
  const _$ToggleMenuServiceItemRendererImpl(
      {this.defaultText,
      this.defaultIcon,
      this.defaultServiceEndpoint,
      this.toggledText,
      this.toggledIcon,
      this.trackingParams});

  factory _$ToggleMenuServiceItemRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ToggleMenuServiceItemRendererImplFromJson(json);

  @override
  final Title? defaultText;
  @override
  final Icon? defaultIcon;
  @override
  final DefaultServiceEndpoint? defaultServiceEndpoint;
  @override
  final Title? toggledText;
  @override
  final Icon? toggledIcon;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'ToggleMenuServiceItemRenderer(defaultText: $defaultText, defaultIcon: $defaultIcon, defaultServiceEndpoint: $defaultServiceEndpoint, toggledText: $toggledText, toggledIcon: $toggledIcon, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleMenuServiceItemRendererImpl &&
            (identical(other.defaultText, defaultText) ||
                other.defaultText == defaultText) &&
            (identical(other.defaultIcon, defaultIcon) ||
                other.defaultIcon == defaultIcon) &&
            (identical(other.defaultServiceEndpoint, defaultServiceEndpoint) ||
                other.defaultServiceEndpoint == defaultServiceEndpoint) &&
            (identical(other.toggledText, toggledText) ||
                other.toggledText == toggledText) &&
            (identical(other.toggledIcon, toggledIcon) ||
                other.toggledIcon == toggledIcon) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defaultText, defaultIcon,
      defaultServiceEndpoint, toggledText, toggledIcon, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleMenuServiceItemRendererImplCopyWith<
          _$ToggleMenuServiceItemRendererImpl>
      get copyWith => __$$ToggleMenuServiceItemRendererImplCopyWithImpl<
          _$ToggleMenuServiceItemRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToggleMenuServiceItemRendererImplToJson(
      this,
    );
  }
}

abstract class _ToggleMenuServiceItemRenderer
    implements ToggleMenuServiceItemRenderer {
  const factory _ToggleMenuServiceItemRenderer(
      {final Title? defaultText,
      final Icon? defaultIcon,
      final DefaultServiceEndpoint? defaultServiceEndpoint,
      final Title? toggledText,
      final Icon? toggledIcon,
      final String? trackingParams}) = _$ToggleMenuServiceItemRendererImpl;

  factory _ToggleMenuServiceItemRenderer.fromJson(Map<String, dynamic> json) =
      _$ToggleMenuServiceItemRendererImpl.fromJson;

  @override
  Title? get defaultText;
  @override
  Icon? get defaultIcon;
  @override
  DefaultServiceEndpoint? get defaultServiceEndpoint;
  @override
  Title? get toggledText;
  @override
  Icon? get toggledIcon;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$ToggleMenuServiceItemRendererImplCopyWith<
          _$ToggleMenuServiceItemRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DefaultServiceEndpoint _$DefaultServiceEndpointFromJson(
    Map<String, dynamic> json) {
  return _DefaultServiceEndpoint.fromJson(json);
}

/// @nodoc
mixin _$DefaultServiceEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  ModalEndpoint? get modalEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultServiceEndpointCopyWith<DefaultServiceEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultServiceEndpointCopyWith<$Res> {
  factory $DefaultServiceEndpointCopyWith(DefaultServiceEndpoint value,
          $Res Function(DefaultServiceEndpoint) then) =
      _$DefaultServiceEndpointCopyWithImpl<$Res, DefaultServiceEndpoint>;
  @useResult
  $Res call({String? clickTrackingParams, ModalEndpoint? modalEndpoint});

  $ModalEndpointCopyWith<$Res>? get modalEndpoint;
}

/// @nodoc
class _$DefaultServiceEndpointCopyWithImpl<$Res,
        $Val extends DefaultServiceEndpoint>
    implements $DefaultServiceEndpointCopyWith<$Res> {
  _$DefaultServiceEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? modalEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      modalEndpoint: freezed == modalEndpoint
          ? _value.modalEndpoint
          : modalEndpoint // ignore: cast_nullable_to_non_nullable
              as ModalEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModalEndpointCopyWith<$Res>? get modalEndpoint {
    if (_value.modalEndpoint == null) {
      return null;
    }

    return $ModalEndpointCopyWith<$Res>(_value.modalEndpoint!, (value) {
      return _then(_value.copyWith(modalEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DefaultServiceEndpointImplCopyWith<$Res>
    implements $DefaultServiceEndpointCopyWith<$Res> {
  factory _$$DefaultServiceEndpointImplCopyWith(
          _$DefaultServiceEndpointImpl value,
          $Res Function(_$DefaultServiceEndpointImpl) then) =
      __$$DefaultServiceEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, ModalEndpoint? modalEndpoint});

  @override
  $ModalEndpointCopyWith<$Res>? get modalEndpoint;
}

/// @nodoc
class __$$DefaultServiceEndpointImplCopyWithImpl<$Res>
    extends _$DefaultServiceEndpointCopyWithImpl<$Res,
        _$DefaultServiceEndpointImpl>
    implements _$$DefaultServiceEndpointImplCopyWith<$Res> {
  __$$DefaultServiceEndpointImplCopyWithImpl(
      _$DefaultServiceEndpointImpl _value,
      $Res Function(_$DefaultServiceEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? modalEndpoint = freezed,
  }) {
    return _then(_$DefaultServiceEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      modalEndpoint: freezed == modalEndpoint
          ? _value.modalEndpoint
          : modalEndpoint // ignore: cast_nullable_to_non_nullable
              as ModalEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultServiceEndpointImpl implements _DefaultServiceEndpoint {
  const _$DefaultServiceEndpointImpl(
      {this.clickTrackingParams, this.modalEndpoint});

  factory _$DefaultServiceEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultServiceEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final ModalEndpoint? modalEndpoint;

  @override
  String toString() {
    return 'DefaultServiceEndpoint(clickTrackingParams: $clickTrackingParams, modalEndpoint: $modalEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultServiceEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.modalEndpoint, modalEndpoint) ||
                other.modalEndpoint == modalEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, modalEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultServiceEndpointImplCopyWith<_$DefaultServiceEndpointImpl>
      get copyWith => __$$DefaultServiceEndpointImplCopyWithImpl<
          _$DefaultServiceEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultServiceEndpointImplToJson(
      this,
    );
  }
}

abstract class _DefaultServiceEndpoint implements DefaultServiceEndpoint {
  const factory _DefaultServiceEndpoint(
      {final String? clickTrackingParams,
      final ModalEndpoint? modalEndpoint}) = _$DefaultServiceEndpointImpl;

  factory _DefaultServiceEndpoint.fromJson(Map<String, dynamic> json) =
      _$DefaultServiceEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  ModalEndpoint? get modalEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$DefaultServiceEndpointImplCopyWith<_$DefaultServiceEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Overlay _$OverlayFromJson(Map<String, dynamic> json) {
  return _Overlay.fromJson(json);
}

/// @nodoc
mixin _$Overlay {
  MusicItemThumbnailOverlayRenderer? get musicItemThumbnailOverlayRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverlayCopyWith<Overlay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverlayCopyWith<$Res> {
  factory $OverlayCopyWith(Overlay value, $Res Function(Overlay) then) =
      _$OverlayCopyWithImpl<$Res, Overlay>;
  @useResult
  $Res call(
      {MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer});

  $MusicItemThumbnailOverlayRendererCopyWith<$Res>?
      get musicItemThumbnailOverlayRenderer;
}

/// @nodoc
class _$OverlayCopyWithImpl<$Res, $Val extends Overlay>
    implements $OverlayCopyWith<$Res> {
  _$OverlayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicItemThumbnailOverlayRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicItemThumbnailOverlayRenderer: freezed ==
              musicItemThumbnailOverlayRenderer
          ? _value.musicItemThumbnailOverlayRenderer
          : musicItemThumbnailOverlayRenderer // ignore: cast_nullable_to_non_nullable
              as MusicItemThumbnailOverlayRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicItemThumbnailOverlayRendererCopyWith<$Res>?
      get musicItemThumbnailOverlayRenderer {
    if (_value.musicItemThumbnailOverlayRenderer == null) {
      return null;
    }

    return $MusicItemThumbnailOverlayRendererCopyWith<$Res>(
        _value.musicItemThumbnailOverlayRenderer!, (value) {
      return _then(
          _value.copyWith(musicItemThumbnailOverlayRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OverlayImplCopyWith<$Res> implements $OverlayCopyWith<$Res> {
  factory _$$OverlayImplCopyWith(
          _$OverlayImpl value, $Res Function(_$OverlayImpl) then) =
      __$$OverlayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer});

  @override
  $MusicItemThumbnailOverlayRendererCopyWith<$Res>?
      get musicItemThumbnailOverlayRenderer;
}

/// @nodoc
class __$$OverlayImplCopyWithImpl<$Res>
    extends _$OverlayCopyWithImpl<$Res, _$OverlayImpl>
    implements _$$OverlayImplCopyWith<$Res> {
  __$$OverlayImplCopyWithImpl(
      _$OverlayImpl _value, $Res Function(_$OverlayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicItemThumbnailOverlayRenderer = freezed,
  }) {
    return _then(_$OverlayImpl(
      musicItemThumbnailOverlayRenderer: freezed ==
              musicItemThumbnailOverlayRenderer
          ? _value.musicItemThumbnailOverlayRenderer
          : musicItemThumbnailOverlayRenderer // ignore: cast_nullable_to_non_nullable
              as MusicItemThumbnailOverlayRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OverlayImpl implements _Overlay {
  const _$OverlayImpl({this.musicItemThumbnailOverlayRenderer});

  factory _$OverlayImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverlayImplFromJson(json);

  @override
  final MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer;

  @override
  String toString() {
    return 'Overlay(musicItemThumbnailOverlayRenderer: $musicItemThumbnailOverlayRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverlayImpl &&
            (identical(other.musicItemThumbnailOverlayRenderer,
                    musicItemThumbnailOverlayRenderer) ||
                other.musicItemThumbnailOverlayRenderer ==
                    musicItemThumbnailOverlayRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, musicItemThumbnailOverlayRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OverlayImplCopyWith<_$OverlayImpl> get copyWith =>
      __$$OverlayImplCopyWithImpl<_$OverlayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverlayImplToJson(
      this,
    );
  }
}

abstract class _Overlay implements Overlay {
  const factory _Overlay(
      {final MusicItemThumbnailOverlayRenderer?
          musicItemThumbnailOverlayRenderer}) = _$OverlayImpl;

  factory _Overlay.fromJson(Map<String, dynamic> json) = _$OverlayImpl.fromJson;

  @override
  MusicItemThumbnailOverlayRenderer? get musicItemThumbnailOverlayRenderer;
  @override
  @JsonKey(ignore: true)
  _$$OverlayImplCopyWith<_$OverlayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicItemThumbnailOverlayRenderer _$MusicItemThumbnailOverlayRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicItemThumbnailOverlayRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicItemThumbnailOverlayRenderer {
  Background? get background => throw _privateConstructorUsedError;
  MusicItemThumbnailOverlayRendererContent? get content =>
      throw _privateConstructorUsedError;
  String? get contentPosition => throw _privateConstructorUsedError;
  String? get displayStyle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicItemThumbnailOverlayRendererCopyWith<MusicItemThumbnailOverlayRenderer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  factory $MusicItemThumbnailOverlayRendererCopyWith(
          MusicItemThumbnailOverlayRenderer value,
          $Res Function(MusicItemThumbnailOverlayRenderer) then) =
      _$MusicItemThumbnailOverlayRendererCopyWithImpl<$Res,
          MusicItemThumbnailOverlayRenderer>;
  @useResult
  $Res call(
      {Background? background,
      MusicItemThumbnailOverlayRendererContent? content,
      String? contentPosition,
      String? displayStyle});

  $BackgroundCopyWith<$Res>? get background;
  $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$MusicItemThumbnailOverlayRendererCopyWithImpl<$Res,
        $Val extends MusicItemThumbnailOverlayRenderer>
    implements $MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  _$MusicItemThumbnailOverlayRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = freezed,
    Object? content = freezed,
    Object? contentPosition = freezed,
    Object? displayStyle = freezed,
  }) {
    return _then(_value.copyWith(
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MusicItemThumbnailOverlayRendererContent?,
      contentPosition: freezed == contentPosition
          ? _value.contentPosition
          : contentPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      displayStyle: freezed == displayStyle
          ? _value.displayStyle
          : displayStyle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BackgroundCopyWith<$Res>? get background {
    if (_value.background == null) {
      return null;
    }

    return $BackgroundCopyWith<$Res>(_value.background!, (value) {
      return _then(_value.copyWith(background: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>(
        _value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicItemThumbnailOverlayRendererImplCopyWith<$Res>
    implements $MusicItemThumbnailOverlayRendererCopyWith<$Res> {
  factory _$$MusicItemThumbnailOverlayRendererImplCopyWith(
          _$MusicItemThumbnailOverlayRendererImpl value,
          $Res Function(_$MusicItemThumbnailOverlayRendererImpl) then) =
      __$$MusicItemThumbnailOverlayRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Background? background,
      MusicItemThumbnailOverlayRendererContent? content,
      String? contentPosition,
      String? displayStyle});

  @override
  $BackgroundCopyWith<$Res>? get background;
  @override
  $MusicItemThumbnailOverlayRendererContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$MusicItemThumbnailOverlayRendererImplCopyWithImpl<$Res>
    extends _$MusicItemThumbnailOverlayRendererCopyWithImpl<$Res,
        _$MusicItemThumbnailOverlayRendererImpl>
    implements _$$MusicItemThumbnailOverlayRendererImplCopyWith<$Res> {
  __$$MusicItemThumbnailOverlayRendererImplCopyWithImpl(
      _$MusicItemThumbnailOverlayRendererImpl _value,
      $Res Function(_$MusicItemThumbnailOverlayRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = freezed,
    Object? content = freezed,
    Object? contentPosition = freezed,
    Object? displayStyle = freezed,
  }) {
    return _then(_$MusicItemThumbnailOverlayRendererImpl(
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Background?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MusicItemThumbnailOverlayRendererContent?,
      contentPosition: freezed == contentPosition
          ? _value.contentPosition
          : contentPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      displayStyle: freezed == displayStyle
          ? _value.displayStyle
          : displayStyle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicItemThumbnailOverlayRendererImpl
    implements _MusicItemThumbnailOverlayRenderer {
  const _$MusicItemThumbnailOverlayRendererImpl(
      {this.background, this.content, this.contentPosition, this.displayStyle});

  factory _$MusicItemThumbnailOverlayRendererImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicItemThumbnailOverlayRendererImplFromJson(json);

  @override
  final Background? background;
  @override
  final MusicItemThumbnailOverlayRendererContent? content;
  @override
  final String? contentPosition;
  @override
  final String? displayStyle;

  @override
  String toString() {
    return 'MusicItemThumbnailOverlayRenderer(background: $background, content: $content, contentPosition: $contentPosition, displayStyle: $displayStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicItemThumbnailOverlayRendererImpl &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentPosition, contentPosition) ||
                other.contentPosition == contentPosition) &&
            (identical(other.displayStyle, displayStyle) ||
                other.displayStyle == displayStyle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, background, content, contentPosition, displayStyle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicItemThumbnailOverlayRendererImplCopyWith<
          _$MusicItemThumbnailOverlayRendererImpl>
      get copyWith => __$$MusicItemThumbnailOverlayRendererImplCopyWithImpl<
          _$MusicItemThumbnailOverlayRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicItemThumbnailOverlayRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicItemThumbnailOverlayRenderer
    implements MusicItemThumbnailOverlayRenderer {
  const factory _MusicItemThumbnailOverlayRenderer(
      {final Background? background,
      final MusicItemThumbnailOverlayRendererContent? content,
      final String? contentPosition,
      final String? displayStyle}) = _$MusicItemThumbnailOverlayRendererImpl;

  factory _MusicItemThumbnailOverlayRenderer.fromJson(
          Map<String, dynamic> json) =
      _$MusicItemThumbnailOverlayRendererImpl.fromJson;

  @override
  Background? get background;
  @override
  MusicItemThumbnailOverlayRendererContent? get content;
  @override
  String? get contentPosition;
  @override
  String? get displayStyle;
  @override
  @JsonKey(ignore: true)
  _$$MusicItemThumbnailOverlayRendererImplCopyWith<
          _$MusicItemThumbnailOverlayRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Background _$BackgroundFromJson(Map<String, dynamic> json) {
  return _Background.fromJson(json);
}

/// @nodoc
mixin _$Background {
  VerticalGradient? get verticalGradient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackgroundCopyWith<Background> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundCopyWith<$Res> {
  factory $BackgroundCopyWith(
          Background value, $Res Function(Background) then) =
      _$BackgroundCopyWithImpl<$Res, Background>;
  @useResult
  $Res call({VerticalGradient? verticalGradient});

  $VerticalGradientCopyWith<$Res>? get verticalGradient;
}

/// @nodoc
class _$BackgroundCopyWithImpl<$Res, $Val extends Background>
    implements $BackgroundCopyWith<$Res> {
  _$BackgroundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verticalGradient = freezed,
  }) {
    return _then(_value.copyWith(
      verticalGradient: freezed == verticalGradient
          ? _value.verticalGradient
          : verticalGradient // ignore: cast_nullable_to_non_nullable
              as VerticalGradient?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerticalGradientCopyWith<$Res>? get verticalGradient {
    if (_value.verticalGradient == null) {
      return null;
    }

    return $VerticalGradientCopyWith<$Res>(_value.verticalGradient!, (value) {
      return _then(_value.copyWith(verticalGradient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackgroundImplCopyWith<$Res>
    implements $BackgroundCopyWith<$Res> {
  factory _$$BackgroundImplCopyWith(
          _$BackgroundImpl value, $Res Function(_$BackgroundImpl) then) =
      __$$BackgroundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VerticalGradient? verticalGradient});

  @override
  $VerticalGradientCopyWith<$Res>? get verticalGradient;
}

/// @nodoc
class __$$BackgroundImplCopyWithImpl<$Res>
    extends _$BackgroundCopyWithImpl<$Res, _$BackgroundImpl>
    implements _$$BackgroundImplCopyWith<$Res> {
  __$$BackgroundImplCopyWithImpl(
      _$BackgroundImpl _value, $Res Function(_$BackgroundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verticalGradient = freezed,
  }) {
    return _then(_$BackgroundImpl(
      verticalGradient: freezed == verticalGradient
          ? _value.verticalGradient
          : verticalGradient // ignore: cast_nullable_to_non_nullable
              as VerticalGradient?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackgroundImpl implements _Background {
  const _$BackgroundImpl({this.verticalGradient});

  factory _$BackgroundImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackgroundImplFromJson(json);

  @override
  final VerticalGradient? verticalGradient;

  @override
  String toString() {
    return 'Background(verticalGradient: $verticalGradient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundImpl &&
            (identical(other.verticalGradient, verticalGradient) ||
                other.verticalGradient == verticalGradient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verticalGradient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackgroundImplCopyWith<_$BackgroundImpl> get copyWith =>
      __$$BackgroundImplCopyWithImpl<_$BackgroundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackgroundImplToJson(
      this,
    );
  }
}

abstract class _Background implements Background {
  const factory _Background({final VerticalGradient? verticalGradient}) =
      _$BackgroundImpl;

  factory _Background.fromJson(Map<String, dynamic> json) =
      _$BackgroundImpl.fromJson;

  @override
  VerticalGradient? get verticalGradient;
  @override
  @JsonKey(ignore: true)
  _$$BackgroundImplCopyWith<_$BackgroundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerticalGradient _$VerticalGradientFromJson(Map<String, dynamic> json) {
  return _VerticalGradient.fromJson(json);
}

/// @nodoc
mixin _$VerticalGradient {
  List<String>? get gradientLayerColors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerticalGradientCopyWith<VerticalGradient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerticalGradientCopyWith<$Res> {
  factory $VerticalGradientCopyWith(
          VerticalGradient value, $Res Function(VerticalGradient) then) =
      _$VerticalGradientCopyWithImpl<$Res, VerticalGradient>;
  @useResult
  $Res call({List<String>? gradientLayerColors});
}

/// @nodoc
class _$VerticalGradientCopyWithImpl<$Res, $Val extends VerticalGradient>
    implements $VerticalGradientCopyWith<$Res> {
  _$VerticalGradientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradientLayerColors = freezed,
  }) {
    return _then(_value.copyWith(
      gradientLayerColors: freezed == gradientLayerColors
          ? _value.gradientLayerColors
          : gradientLayerColors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerticalGradientImplCopyWith<$Res>
    implements $VerticalGradientCopyWith<$Res> {
  factory _$$VerticalGradientImplCopyWith(_$VerticalGradientImpl value,
          $Res Function(_$VerticalGradientImpl) then) =
      __$$VerticalGradientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? gradientLayerColors});
}

/// @nodoc
class __$$VerticalGradientImplCopyWithImpl<$Res>
    extends _$VerticalGradientCopyWithImpl<$Res, _$VerticalGradientImpl>
    implements _$$VerticalGradientImplCopyWith<$Res> {
  __$$VerticalGradientImplCopyWithImpl(_$VerticalGradientImpl _value,
      $Res Function(_$VerticalGradientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradientLayerColors = freezed,
  }) {
    return _then(_$VerticalGradientImpl(
      gradientLayerColors: freezed == gradientLayerColors
          ? _value._gradientLayerColors
          : gradientLayerColors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerticalGradientImpl implements _VerticalGradient {
  const _$VerticalGradientImpl({final List<String>? gradientLayerColors})
      : _gradientLayerColors = gradientLayerColors;

  factory _$VerticalGradientImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerticalGradientImplFromJson(json);

  final List<String>? _gradientLayerColors;
  @override
  List<String>? get gradientLayerColors {
    final value = _gradientLayerColors;
    if (value == null) return null;
    if (_gradientLayerColors is EqualUnmodifiableListView)
      return _gradientLayerColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VerticalGradient(gradientLayerColors: $gradientLayerColors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerticalGradientImpl &&
            const DeepCollectionEquality()
                .equals(other._gradientLayerColors, _gradientLayerColors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_gradientLayerColors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerticalGradientImplCopyWith<_$VerticalGradientImpl> get copyWith =>
      __$$VerticalGradientImplCopyWithImpl<_$VerticalGradientImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerticalGradientImplToJson(
      this,
    );
  }
}

abstract class _VerticalGradient implements VerticalGradient {
  const factory _VerticalGradient({final List<String>? gradientLayerColors}) =
      _$VerticalGradientImpl;

  factory _VerticalGradient.fromJson(Map<String, dynamic> json) =
      _$VerticalGradientImpl.fromJson;

  @override
  List<String>? get gradientLayerColors;
  @override
  @JsonKey(ignore: true)
  _$$VerticalGradientImplCopyWith<_$VerticalGradientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicItemThumbnailOverlayRendererContent
    _$MusicItemThumbnailOverlayRendererContentFromJson(
        Map<String, dynamic> json) {
  return _MusicItemThumbnailOverlayRendererContent.fromJson(json);
}

/// @nodoc
mixin _$MusicItemThumbnailOverlayRendererContent {
  MusicPlayButtonRenderer? get musicPlayButtonRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicItemThumbnailOverlayRendererContentCopyWith<
          MusicItemThumbnailOverlayRendererContent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  factory $MusicItemThumbnailOverlayRendererContentCopyWith(
          MusicItemThumbnailOverlayRendererContent value,
          $Res Function(MusicItemThumbnailOverlayRendererContent) then) =
      _$MusicItemThumbnailOverlayRendererContentCopyWithImpl<$Res,
          MusicItemThumbnailOverlayRendererContent>;
  @useResult
  $Res call({MusicPlayButtonRenderer? musicPlayButtonRenderer});

  $MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer;
}

/// @nodoc
class _$MusicItemThumbnailOverlayRendererContentCopyWithImpl<$Res,
        $Val extends MusicItemThumbnailOverlayRendererContent>
    implements $MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  _$MusicItemThumbnailOverlayRendererContentCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicPlayButtonRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicPlayButtonRenderer: freezed == musicPlayButtonRenderer
          ? _value.musicPlayButtonRenderer
          : musicPlayButtonRenderer // ignore: cast_nullable_to_non_nullable
              as MusicPlayButtonRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer {
    if (_value.musicPlayButtonRenderer == null) {
      return null;
    }

    return $MusicPlayButtonRendererCopyWith<$Res>(
        _value.musicPlayButtonRenderer!, (value) {
      return _then(_value.copyWith(musicPlayButtonRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicItemThumbnailOverlayRendererContentImplCopyWith<$Res>
    implements $MusicItemThumbnailOverlayRendererContentCopyWith<$Res> {
  factory _$$MusicItemThumbnailOverlayRendererContentImplCopyWith(
          _$MusicItemThumbnailOverlayRendererContentImpl value,
          $Res Function(_$MusicItemThumbnailOverlayRendererContentImpl) then) =
      __$$MusicItemThumbnailOverlayRendererContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MusicPlayButtonRenderer? musicPlayButtonRenderer});

  @override
  $MusicPlayButtonRendererCopyWith<$Res>? get musicPlayButtonRenderer;
}

/// @nodoc
class __$$MusicItemThumbnailOverlayRendererContentImplCopyWithImpl<$Res>
    extends _$MusicItemThumbnailOverlayRendererContentCopyWithImpl<$Res,
        _$MusicItemThumbnailOverlayRendererContentImpl>
    implements _$$MusicItemThumbnailOverlayRendererContentImplCopyWith<$Res> {
  __$$MusicItemThumbnailOverlayRendererContentImplCopyWithImpl(
      _$MusicItemThumbnailOverlayRendererContentImpl _value,
      $Res Function(_$MusicItemThumbnailOverlayRendererContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicPlayButtonRenderer = freezed,
  }) {
    return _then(_$MusicItemThumbnailOverlayRendererContentImpl(
      musicPlayButtonRenderer: freezed == musicPlayButtonRenderer
          ? _value.musicPlayButtonRenderer
          : musicPlayButtonRenderer // ignore: cast_nullable_to_non_nullable
              as MusicPlayButtonRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicItemThumbnailOverlayRendererContentImpl
    implements _MusicItemThumbnailOverlayRendererContent {
  const _$MusicItemThumbnailOverlayRendererContentImpl(
      {this.musicPlayButtonRenderer});

  factory _$MusicItemThumbnailOverlayRendererContentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicItemThumbnailOverlayRendererContentImplFromJson(json);

  @override
  final MusicPlayButtonRenderer? musicPlayButtonRenderer;

  @override
  String toString() {
    return 'MusicItemThumbnailOverlayRendererContent(musicPlayButtonRenderer: $musicPlayButtonRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicItemThumbnailOverlayRendererContentImpl &&
            (identical(
                    other.musicPlayButtonRenderer, musicPlayButtonRenderer) ||
                other.musicPlayButtonRenderer == musicPlayButtonRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicPlayButtonRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicItemThumbnailOverlayRendererContentImplCopyWith<
          _$MusicItemThumbnailOverlayRendererContentImpl>
      get copyWith =>
          __$$MusicItemThumbnailOverlayRendererContentImplCopyWithImpl<
              _$MusicItemThumbnailOverlayRendererContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicItemThumbnailOverlayRendererContentImplToJson(
      this,
    );
  }
}

abstract class _MusicItemThumbnailOverlayRendererContent
    implements MusicItemThumbnailOverlayRendererContent {
  const factory _MusicItemThumbnailOverlayRendererContent(
          {final MusicPlayButtonRenderer? musicPlayButtonRenderer}) =
      _$MusicItemThumbnailOverlayRendererContentImpl;

  factory _MusicItemThumbnailOverlayRendererContent.fromJson(
          Map<String, dynamic> json) =
      _$MusicItemThumbnailOverlayRendererContentImpl.fromJson;

  @override
  MusicPlayButtonRenderer? get musicPlayButtonRenderer;
  @override
  @JsonKey(ignore: true)
  _$$MusicItemThumbnailOverlayRendererContentImplCopyWith<
          _$MusicItemThumbnailOverlayRendererContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MusicPlayButtonRenderer _$MusicPlayButtonRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicPlayButtonRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicPlayButtonRenderer {
  PlayNavigationEndpoint? get playNavigationEndpoint =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  Icon? get playIcon => throw _privateConstructorUsedError;
  Icon? get pauseIcon => throw _privateConstructorUsedError;
  int? get iconColor => throw _privateConstructorUsedError;
  int? get backgroundColor => throw _privateConstructorUsedError;
  int? get activeBackgroundColor => throw _privateConstructorUsedError;
  int? get loadingIndicatorColor => throw _privateConstructorUsedError;
  Icon? get playingIcon => throw _privateConstructorUsedError;
  int? get iconLoadingColor => throw _privateConstructorUsedError;
  int? get activeScaleFactor => throw _privateConstructorUsedError;
  String? get buttonSize => throw _privateConstructorUsedError;
  String? get rippleTarget => throw _privateConstructorUsedError;
  Accessibility? get accessibilityPlayData =>
      throw _privateConstructorUsedError;
  Accessibility? get accessibilityPauseData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicPlayButtonRendererCopyWith<MusicPlayButtonRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicPlayButtonRendererCopyWith<$Res> {
  factory $MusicPlayButtonRendererCopyWith(MusicPlayButtonRenderer value,
          $Res Function(MusicPlayButtonRenderer) then) =
      _$MusicPlayButtonRendererCopyWithImpl<$Res, MusicPlayButtonRenderer>;
  @useResult
  $Res call(
      {PlayNavigationEndpoint? playNavigationEndpoint,
      String? trackingParams,
      Icon? playIcon,
      Icon? pauseIcon,
      int? iconColor,
      int? backgroundColor,
      int? activeBackgroundColor,
      int? loadingIndicatorColor,
      Icon? playingIcon,
      int? iconLoadingColor,
      int? activeScaleFactor,
      String? buttonSize,
      String? rippleTarget,
      Accessibility? accessibilityPlayData,
      Accessibility? accessibilityPauseData});

  $PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint;
  $IconCopyWith<$Res>? get playIcon;
  $IconCopyWith<$Res>? get pauseIcon;
  $IconCopyWith<$Res>? get playingIcon;
  $AccessibilityCopyWith<$Res>? get accessibilityPlayData;
  $AccessibilityCopyWith<$Res>? get accessibilityPauseData;
}

/// @nodoc
class _$MusicPlayButtonRendererCopyWithImpl<$Res,
        $Val extends MusicPlayButtonRenderer>
    implements $MusicPlayButtonRendererCopyWith<$Res> {
  _$MusicPlayButtonRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playNavigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? playIcon = freezed,
    Object? pauseIcon = freezed,
    Object? iconColor = freezed,
    Object? backgroundColor = freezed,
    Object? activeBackgroundColor = freezed,
    Object? loadingIndicatorColor = freezed,
    Object? playingIcon = freezed,
    Object? iconLoadingColor = freezed,
    Object? activeScaleFactor = freezed,
    Object? buttonSize = freezed,
    Object? rippleTarget = freezed,
    Object? accessibilityPlayData = freezed,
    Object? accessibilityPauseData = freezed,
  }) {
    return _then(_value.copyWith(
      playNavigationEndpoint: freezed == playNavigationEndpoint
          ? _value.playNavigationEndpoint
          : playNavigationEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      playIcon: freezed == playIcon
          ? _value.playIcon
          : playIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      pauseIcon: freezed == pauseIcon
          ? _value.pauseIcon
          : pauseIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      iconColor: freezed == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      activeBackgroundColor: freezed == activeBackgroundColor
          ? _value.activeBackgroundColor
          : activeBackgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingIndicatorColor: freezed == loadingIndicatorColor
          ? _value.loadingIndicatorColor
          : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
              as int?,
      playingIcon: freezed == playingIcon
          ? _value.playingIcon
          : playingIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      iconLoadingColor: freezed == iconLoadingColor
          ? _value.iconLoadingColor
          : iconLoadingColor // ignore: cast_nullable_to_non_nullable
              as int?,
      activeScaleFactor: freezed == activeScaleFactor
          ? _value.activeScaleFactor
          : activeScaleFactor // ignore: cast_nullable_to_non_nullable
              as int?,
      buttonSize: freezed == buttonSize
          ? _value.buttonSize
          : buttonSize // ignore: cast_nullable_to_non_nullable
              as String?,
      rippleTarget: freezed == rippleTarget
          ? _value.rippleTarget
          : rippleTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      accessibilityPlayData: freezed == accessibilityPlayData
          ? _value.accessibilityPlayData
          : accessibilityPlayData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
      accessibilityPauseData: freezed == accessibilityPauseData
          ? _value.accessibilityPauseData
          : accessibilityPauseData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint {
    if (_value.playNavigationEndpoint == null) {
      return null;
    }

    return $PlayNavigationEndpointCopyWith<$Res>(_value.playNavigationEndpoint!,
        (value) {
      return _then(_value.copyWith(playNavigationEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get playIcon {
    if (_value.playIcon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.playIcon!, (value) {
      return _then(_value.copyWith(playIcon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get pauseIcon {
    if (_value.pauseIcon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.pauseIcon!, (value) {
      return _then(_value.copyWith(pauseIcon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get playingIcon {
    if (_value.playingIcon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.playingIcon!, (value) {
      return _then(_value.copyWith(playingIcon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityCopyWith<$Res>? get accessibilityPlayData {
    if (_value.accessibilityPlayData == null) {
      return null;
    }

    return $AccessibilityCopyWith<$Res>(_value.accessibilityPlayData!, (value) {
      return _then(_value.copyWith(accessibilityPlayData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityCopyWith<$Res>? get accessibilityPauseData {
    if (_value.accessibilityPauseData == null) {
      return null;
    }

    return $AccessibilityCopyWith<$Res>(_value.accessibilityPauseData!,
        (value) {
      return _then(_value.copyWith(accessibilityPauseData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicPlayButtonRendererImplCopyWith<$Res>
    implements $MusicPlayButtonRendererCopyWith<$Res> {
  factory _$$MusicPlayButtonRendererImplCopyWith(
          _$MusicPlayButtonRendererImpl value,
          $Res Function(_$MusicPlayButtonRendererImpl) then) =
      __$$MusicPlayButtonRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlayNavigationEndpoint? playNavigationEndpoint,
      String? trackingParams,
      Icon? playIcon,
      Icon? pauseIcon,
      int? iconColor,
      int? backgroundColor,
      int? activeBackgroundColor,
      int? loadingIndicatorColor,
      Icon? playingIcon,
      int? iconLoadingColor,
      int? activeScaleFactor,
      String? buttonSize,
      String? rippleTarget,
      Accessibility? accessibilityPlayData,
      Accessibility? accessibilityPauseData});

  @override
  $PlayNavigationEndpointCopyWith<$Res>? get playNavigationEndpoint;
  @override
  $IconCopyWith<$Res>? get playIcon;
  @override
  $IconCopyWith<$Res>? get pauseIcon;
  @override
  $IconCopyWith<$Res>? get playingIcon;
  @override
  $AccessibilityCopyWith<$Res>? get accessibilityPlayData;
  @override
  $AccessibilityCopyWith<$Res>? get accessibilityPauseData;
}

/// @nodoc
class __$$MusicPlayButtonRendererImplCopyWithImpl<$Res>
    extends _$MusicPlayButtonRendererCopyWithImpl<$Res,
        _$MusicPlayButtonRendererImpl>
    implements _$$MusicPlayButtonRendererImplCopyWith<$Res> {
  __$$MusicPlayButtonRendererImplCopyWithImpl(
      _$MusicPlayButtonRendererImpl _value,
      $Res Function(_$MusicPlayButtonRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playNavigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? playIcon = freezed,
    Object? pauseIcon = freezed,
    Object? iconColor = freezed,
    Object? backgroundColor = freezed,
    Object? activeBackgroundColor = freezed,
    Object? loadingIndicatorColor = freezed,
    Object? playingIcon = freezed,
    Object? iconLoadingColor = freezed,
    Object? activeScaleFactor = freezed,
    Object? buttonSize = freezed,
    Object? rippleTarget = freezed,
    Object? accessibilityPlayData = freezed,
    Object? accessibilityPauseData = freezed,
  }) {
    return _then(_$MusicPlayButtonRendererImpl(
      playNavigationEndpoint: freezed == playNavigationEndpoint
          ? _value.playNavigationEndpoint
          : playNavigationEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      playIcon: freezed == playIcon
          ? _value.playIcon
          : playIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      pauseIcon: freezed == pauseIcon
          ? _value.pauseIcon
          : pauseIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      iconColor: freezed == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      activeBackgroundColor: freezed == activeBackgroundColor
          ? _value.activeBackgroundColor
          : activeBackgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingIndicatorColor: freezed == loadingIndicatorColor
          ? _value.loadingIndicatorColor
          : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
              as int?,
      playingIcon: freezed == playingIcon
          ? _value.playingIcon
          : playingIcon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      iconLoadingColor: freezed == iconLoadingColor
          ? _value.iconLoadingColor
          : iconLoadingColor // ignore: cast_nullable_to_non_nullable
              as int?,
      activeScaleFactor: freezed == activeScaleFactor
          ? _value.activeScaleFactor
          : activeScaleFactor // ignore: cast_nullable_to_non_nullable
              as int?,
      buttonSize: freezed == buttonSize
          ? _value.buttonSize
          : buttonSize // ignore: cast_nullable_to_non_nullable
              as String?,
      rippleTarget: freezed == rippleTarget
          ? _value.rippleTarget
          : rippleTarget // ignore: cast_nullable_to_non_nullable
              as String?,
      accessibilityPlayData: freezed == accessibilityPlayData
          ? _value.accessibilityPlayData
          : accessibilityPlayData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
      accessibilityPauseData: freezed == accessibilityPauseData
          ? _value.accessibilityPauseData
          : accessibilityPauseData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicPlayButtonRendererImpl implements _MusicPlayButtonRenderer {
  const _$MusicPlayButtonRendererImpl(
      {this.playNavigationEndpoint,
      this.trackingParams,
      this.playIcon,
      this.pauseIcon,
      this.iconColor,
      this.backgroundColor,
      this.activeBackgroundColor,
      this.loadingIndicatorColor,
      this.playingIcon,
      this.iconLoadingColor,
      this.activeScaleFactor,
      this.buttonSize,
      this.rippleTarget,
      this.accessibilityPlayData,
      this.accessibilityPauseData});

  factory _$MusicPlayButtonRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicPlayButtonRendererImplFromJson(json);

  @override
  final PlayNavigationEndpoint? playNavigationEndpoint;
  @override
  final String? trackingParams;
  @override
  final Icon? playIcon;
  @override
  final Icon? pauseIcon;
  @override
  final int? iconColor;
  @override
  final int? backgroundColor;
  @override
  final int? activeBackgroundColor;
  @override
  final int? loadingIndicatorColor;
  @override
  final Icon? playingIcon;
  @override
  final int? iconLoadingColor;
  @override
  final int? activeScaleFactor;
  @override
  final String? buttonSize;
  @override
  final String? rippleTarget;
  @override
  final Accessibility? accessibilityPlayData;
  @override
  final Accessibility? accessibilityPauseData;

  @override
  String toString() {
    return 'MusicPlayButtonRenderer(playNavigationEndpoint: $playNavigationEndpoint, trackingParams: $trackingParams, playIcon: $playIcon, pauseIcon: $pauseIcon, iconColor: $iconColor, backgroundColor: $backgroundColor, activeBackgroundColor: $activeBackgroundColor, loadingIndicatorColor: $loadingIndicatorColor, playingIcon: $playingIcon, iconLoadingColor: $iconLoadingColor, activeScaleFactor: $activeScaleFactor, buttonSize: $buttonSize, rippleTarget: $rippleTarget, accessibilityPlayData: $accessibilityPlayData, accessibilityPauseData: $accessibilityPauseData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicPlayButtonRendererImpl &&
            (identical(other.playNavigationEndpoint, playNavigationEndpoint) ||
                other.playNavigationEndpoint == playNavigationEndpoint) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.playIcon, playIcon) ||
                other.playIcon == playIcon) &&
            (identical(other.pauseIcon, pauseIcon) ||
                other.pauseIcon == pauseIcon) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.activeBackgroundColor, activeBackgroundColor) ||
                other.activeBackgroundColor == activeBackgroundColor) &&
            (identical(other.loadingIndicatorColor, loadingIndicatorColor) ||
                other.loadingIndicatorColor == loadingIndicatorColor) &&
            (identical(other.playingIcon, playingIcon) ||
                other.playingIcon == playingIcon) &&
            (identical(other.iconLoadingColor, iconLoadingColor) ||
                other.iconLoadingColor == iconLoadingColor) &&
            (identical(other.activeScaleFactor, activeScaleFactor) ||
                other.activeScaleFactor == activeScaleFactor) &&
            (identical(other.buttonSize, buttonSize) ||
                other.buttonSize == buttonSize) &&
            (identical(other.rippleTarget, rippleTarget) ||
                other.rippleTarget == rippleTarget) &&
            (identical(other.accessibilityPlayData, accessibilityPlayData) ||
                other.accessibilityPlayData == accessibilityPlayData) &&
            (identical(other.accessibilityPauseData, accessibilityPauseData) ||
                other.accessibilityPauseData == accessibilityPauseData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      playNavigationEndpoint,
      trackingParams,
      playIcon,
      pauseIcon,
      iconColor,
      backgroundColor,
      activeBackgroundColor,
      loadingIndicatorColor,
      playingIcon,
      iconLoadingColor,
      activeScaleFactor,
      buttonSize,
      rippleTarget,
      accessibilityPlayData,
      accessibilityPauseData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicPlayButtonRendererImplCopyWith<_$MusicPlayButtonRendererImpl>
      get copyWith => __$$MusicPlayButtonRendererImplCopyWithImpl<
          _$MusicPlayButtonRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicPlayButtonRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicPlayButtonRenderer implements MusicPlayButtonRenderer {
  const factory _MusicPlayButtonRenderer(
          {final PlayNavigationEndpoint? playNavigationEndpoint,
          final String? trackingParams,
          final Icon? playIcon,
          final Icon? pauseIcon,
          final int? iconColor,
          final int? backgroundColor,
          final int? activeBackgroundColor,
          final int? loadingIndicatorColor,
          final Icon? playingIcon,
          final int? iconLoadingColor,
          final int? activeScaleFactor,
          final String? buttonSize,
          final String? rippleTarget,
          final Accessibility? accessibilityPlayData,
          final Accessibility? accessibilityPauseData}) =
      _$MusicPlayButtonRendererImpl;

  factory _MusicPlayButtonRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicPlayButtonRendererImpl.fromJson;

  @override
  PlayNavigationEndpoint? get playNavigationEndpoint;
  @override
  String? get trackingParams;
  @override
  Icon? get playIcon;
  @override
  Icon? get pauseIcon;
  @override
  int? get iconColor;
  @override
  int? get backgroundColor;
  @override
  int? get activeBackgroundColor;
  @override
  int? get loadingIndicatorColor;
  @override
  Icon? get playingIcon;
  @override
  int? get iconLoadingColor;
  @override
  int? get activeScaleFactor;
  @override
  String? get buttonSize;
  @override
  String? get rippleTarget;
  @override
  Accessibility? get accessibilityPlayData;
  @override
  Accessibility? get accessibilityPauseData;
  @override
  @JsonKey(ignore: true)
  _$$MusicPlayButtonRendererImplCopyWith<_$MusicPlayButtonRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlayNavigationEndpoint _$PlayNavigationEndpointFromJson(
    Map<String, dynamic> json) {
  return _PlayNavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$PlayNavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  PlayNavigationEndpointWatchEndpoint? get watchEndpoint =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayNavigationEndpointCopyWith<PlayNavigationEndpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayNavigationEndpointCopyWith<$Res> {
  factory $PlayNavigationEndpointCopyWith(PlayNavigationEndpoint value,
          $Res Function(PlayNavigationEndpoint) then) =
      _$PlayNavigationEndpointCopyWithImpl<$Res, PlayNavigationEndpoint>;
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PlayNavigationEndpointWatchEndpoint? watchEndpoint});

  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;
}

/// @nodoc
class _$PlayNavigationEndpointCopyWithImpl<$Res,
        $Val extends PlayNavigationEndpoint>
    implements $PlayNavigationEndpointCopyWith<$Res> {
  _$PlayNavigationEndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpointWatchEndpoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint {
    if (_value.watchEndpoint == null) {
      return null;
    }

    return $PlayNavigationEndpointWatchEndpointCopyWith<$Res>(
        _value.watchEndpoint!, (value) {
      return _then(_value.copyWith(watchEndpoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayNavigationEndpointImplCopyWith<$Res>
    implements $PlayNavigationEndpointCopyWith<$Res> {
  factory _$$PlayNavigationEndpointImplCopyWith(
          _$PlayNavigationEndpointImpl value,
          $Res Function(_$PlayNavigationEndpointImpl) then) =
      __$$PlayNavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clickTrackingParams,
      PlayNavigationEndpointWatchEndpoint? watchEndpoint});

  @override
  $PlayNavigationEndpointWatchEndpointCopyWith<$Res>? get watchEndpoint;
}

/// @nodoc
class __$$PlayNavigationEndpointImplCopyWithImpl<$Res>
    extends _$PlayNavigationEndpointCopyWithImpl<$Res,
        _$PlayNavigationEndpointImpl>
    implements _$$PlayNavigationEndpointImplCopyWith<$Res> {
  __$$PlayNavigationEndpointImplCopyWithImpl(
      _$PlayNavigationEndpointImpl _value,
      $Res Function(_$PlayNavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? watchEndpoint = freezed,
  }) {
    return _then(_$PlayNavigationEndpointImpl(
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      watchEndpoint: freezed == watchEndpoint
          ? _value.watchEndpoint
          : watchEndpoint // ignore: cast_nullable_to_non_nullable
              as PlayNavigationEndpointWatchEndpoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayNavigationEndpointImpl implements _PlayNavigationEndpoint {
  const _$PlayNavigationEndpointImpl(
      {this.clickTrackingParams, this.watchEndpoint});

  factory _$PlayNavigationEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayNavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final PlayNavigationEndpointWatchEndpoint? watchEndpoint;

  @override
  String toString() {
    return 'PlayNavigationEndpoint(clickTrackingParams: $clickTrackingParams, watchEndpoint: $watchEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayNavigationEndpointImpl &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams) &&
            (identical(other.watchEndpoint, watchEndpoint) ||
                other.watchEndpoint == watchEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clickTrackingParams, watchEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayNavigationEndpointImplCopyWith<_$PlayNavigationEndpointImpl>
      get copyWith => __$$PlayNavigationEndpointImplCopyWithImpl<
          _$PlayNavigationEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayNavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _PlayNavigationEndpoint implements PlayNavigationEndpoint {
  const factory _PlayNavigationEndpoint(
          {final String? clickTrackingParams,
          final PlayNavigationEndpointWatchEndpoint? watchEndpoint}) =
      _$PlayNavigationEndpointImpl;

  factory _PlayNavigationEndpoint.fromJson(Map<String, dynamic> json) =
      _$PlayNavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  PlayNavigationEndpointWatchEndpoint? get watchEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$PlayNavigationEndpointImplCopyWith<_$PlayNavigationEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MusicResponsiveListItemRendererThumbnail
    _$MusicResponsiveListItemRendererThumbnailFromJson(
        Map<String, dynamic> json) {
  return _MusicResponsiveListItemRendererThumbnail.fromJson(json);
}

/// @nodoc
mixin _$MusicResponsiveListItemRendererThumbnail {
  MusicThumbnailRenderer? get musicThumbnailRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicResponsiveListItemRendererThumbnailCopyWith<
          MusicResponsiveListItemRendererThumbnail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  factory $MusicResponsiveListItemRendererThumbnailCopyWith(
          MusicResponsiveListItemRendererThumbnail value,
          $Res Function(MusicResponsiveListItemRendererThumbnail) then) =
      _$MusicResponsiveListItemRendererThumbnailCopyWithImpl<$Res,
          MusicResponsiveListItemRendererThumbnail>;
  @useResult
  $Res call({MusicThumbnailRenderer? musicThumbnailRenderer});

  $MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer;
}

/// @nodoc
class _$MusicResponsiveListItemRendererThumbnailCopyWithImpl<$Res,
        $Val extends MusicResponsiveListItemRendererThumbnail>
    implements $MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  _$MusicResponsiveListItemRendererThumbnailCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicThumbnailRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicThumbnailRenderer: freezed == musicThumbnailRenderer
          ? _value.musicThumbnailRenderer
          : musicThumbnailRenderer // ignore: cast_nullable_to_non_nullable
              as MusicThumbnailRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer {
    if (_value.musicThumbnailRenderer == null) {
      return null;
    }

    return $MusicThumbnailRendererCopyWith<$Res>(_value.musicThumbnailRenderer!,
        (value) {
      return _then(_value.copyWith(musicThumbnailRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicResponsiveListItemRendererThumbnailImplCopyWith<$Res>
    implements $MusicResponsiveListItemRendererThumbnailCopyWith<$Res> {
  factory _$$MusicResponsiveListItemRendererThumbnailImplCopyWith(
          _$MusicResponsiveListItemRendererThumbnailImpl value,
          $Res Function(_$MusicResponsiveListItemRendererThumbnailImpl) then) =
      __$$MusicResponsiveListItemRendererThumbnailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MusicThumbnailRenderer? musicThumbnailRenderer});

  @override
  $MusicThumbnailRendererCopyWith<$Res>? get musicThumbnailRenderer;
}

/// @nodoc
class __$$MusicResponsiveListItemRendererThumbnailImplCopyWithImpl<$Res>
    extends _$MusicResponsiveListItemRendererThumbnailCopyWithImpl<$Res,
        _$MusicResponsiveListItemRendererThumbnailImpl>
    implements _$$MusicResponsiveListItemRendererThumbnailImplCopyWith<$Res> {
  __$$MusicResponsiveListItemRendererThumbnailImplCopyWithImpl(
      _$MusicResponsiveListItemRendererThumbnailImpl _value,
      $Res Function(_$MusicResponsiveListItemRendererThumbnailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicThumbnailRenderer = freezed,
  }) {
    return _then(_$MusicResponsiveListItemRendererThumbnailImpl(
      musicThumbnailRenderer: freezed == musicThumbnailRenderer
          ? _value.musicThumbnailRenderer
          : musicThumbnailRenderer // ignore: cast_nullable_to_non_nullable
              as MusicThumbnailRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicResponsiveListItemRendererThumbnailImpl
    implements _MusicResponsiveListItemRendererThumbnail {
  const _$MusicResponsiveListItemRendererThumbnailImpl(
      {this.musicThumbnailRenderer});

  factory _$MusicResponsiveListItemRendererThumbnailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicResponsiveListItemRendererThumbnailImplFromJson(json);

  @override
  final MusicThumbnailRenderer? musicThumbnailRenderer;

  @override
  String toString() {
    return 'MusicResponsiveListItemRendererThumbnail(musicThumbnailRenderer: $musicThumbnailRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicResponsiveListItemRendererThumbnailImpl &&
            (identical(other.musicThumbnailRenderer, musicThumbnailRenderer) ||
                other.musicThumbnailRenderer == musicThumbnailRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicThumbnailRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicResponsiveListItemRendererThumbnailImplCopyWith<
          _$MusicResponsiveListItemRendererThumbnailImpl>
      get copyWith =>
          __$$MusicResponsiveListItemRendererThumbnailImplCopyWithImpl<
              _$MusicResponsiveListItemRendererThumbnailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicResponsiveListItemRendererThumbnailImplToJson(
      this,
    );
  }
}

abstract class _MusicResponsiveListItemRendererThumbnail
    implements MusicResponsiveListItemRendererThumbnail {
  const factory _MusicResponsiveListItemRendererThumbnail(
          {final MusicThumbnailRenderer? musicThumbnailRenderer}) =
      _$MusicResponsiveListItemRendererThumbnailImpl;

  factory _MusicResponsiveListItemRendererThumbnail.fromJson(
          Map<String, dynamic> json) =
      _$MusicResponsiveListItemRendererThumbnailImpl.fromJson;

  @override
  MusicThumbnailRenderer? get musicThumbnailRenderer;
  @override
  @JsonKey(ignore: true)
  _$$MusicResponsiveListItemRendererThumbnailImplCopyWith<
          _$MusicResponsiveListItemRendererThumbnailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MusicThumbnailRenderer _$MusicThumbnailRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicThumbnailRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicThumbnailRenderer {
  MusicThumbnailRendererThumbnail? get thumbnail =>
      throw _privateConstructorUsedError;
  String? get thumbnailCrop => throw _privateConstructorUsedError;
  String? get thumbnailScale => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicThumbnailRendererCopyWith<MusicThumbnailRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicThumbnailRendererCopyWith<$Res> {
  factory $MusicThumbnailRendererCopyWith(MusicThumbnailRenderer value,
          $Res Function(MusicThumbnailRenderer) then) =
      _$MusicThumbnailRendererCopyWithImpl<$Res, MusicThumbnailRenderer>;
  @useResult
  $Res call(
      {MusicThumbnailRendererThumbnail? thumbnail,
      String? thumbnailCrop,
      String? thumbnailScale,
      String? trackingParams});

  $MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class _$MusicThumbnailRendererCopyWithImpl<$Res,
        $Val extends MusicThumbnailRenderer>
    implements $MusicThumbnailRendererCopyWith<$Res> {
  _$MusicThumbnailRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = freezed,
    Object? thumbnailCrop = freezed,
    Object? thumbnailScale = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MusicThumbnailRendererThumbnail?,
      thumbnailCrop: freezed == thumbnailCrop
          ? _value.thumbnailCrop
          : thumbnailCrop // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailScale: freezed == thumbnailScale
          ? _value.thumbnailScale
          : thumbnailScale // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail {
    if (_value.thumbnail == null) {
      return null;
    }

    return $MusicThumbnailRendererThumbnailCopyWith<$Res>(_value.thumbnail!,
        (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicThumbnailRendererImplCopyWith<$Res>
    implements $MusicThumbnailRendererCopyWith<$Res> {
  factory _$$MusicThumbnailRendererImplCopyWith(
          _$MusicThumbnailRendererImpl value,
          $Res Function(_$MusicThumbnailRendererImpl) then) =
      __$$MusicThumbnailRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MusicThumbnailRendererThumbnail? thumbnail,
      String? thumbnailCrop,
      String? thumbnailScale,
      String? trackingParams});

  @override
  $MusicThumbnailRendererThumbnailCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class __$$MusicThumbnailRendererImplCopyWithImpl<$Res>
    extends _$MusicThumbnailRendererCopyWithImpl<$Res,
        _$MusicThumbnailRendererImpl>
    implements _$$MusicThumbnailRendererImplCopyWith<$Res> {
  __$$MusicThumbnailRendererImplCopyWithImpl(
      _$MusicThumbnailRendererImpl _value,
      $Res Function(_$MusicThumbnailRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = freezed,
    Object? thumbnailCrop = freezed,
    Object? thumbnailScale = freezed,
    Object? trackingParams = freezed,
  }) {
    return _then(_$MusicThumbnailRendererImpl(
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MusicThumbnailRendererThumbnail?,
      thumbnailCrop: freezed == thumbnailCrop
          ? _value.thumbnailCrop
          : thumbnailCrop // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailScale: freezed == thumbnailScale
          ? _value.thumbnailScale
          : thumbnailScale // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicThumbnailRendererImpl implements _MusicThumbnailRenderer {
  const _$MusicThumbnailRendererImpl(
      {this.thumbnail,
      this.thumbnailCrop,
      this.thumbnailScale,
      this.trackingParams});

  factory _$MusicThumbnailRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicThumbnailRendererImplFromJson(json);

  @override
  final MusicThumbnailRendererThumbnail? thumbnail;
  @override
  final String? thumbnailCrop;
  @override
  final String? thumbnailScale;
  @override
  final String? trackingParams;

  @override
  String toString() {
    return 'MusicThumbnailRenderer(thumbnail: $thumbnail, thumbnailCrop: $thumbnailCrop, thumbnailScale: $thumbnailScale, trackingParams: $trackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicThumbnailRendererImpl &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.thumbnailCrop, thumbnailCrop) ||
                other.thumbnailCrop == thumbnailCrop) &&
            (identical(other.thumbnailScale, thumbnailScale) ||
                other.thumbnailScale == thumbnailScale) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, thumbnail, thumbnailCrop, thumbnailScale, trackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicThumbnailRendererImplCopyWith<_$MusicThumbnailRendererImpl>
      get copyWith => __$$MusicThumbnailRendererImplCopyWithImpl<
          _$MusicThumbnailRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicThumbnailRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicThumbnailRenderer implements MusicThumbnailRenderer {
  const factory _MusicThumbnailRenderer(
      {final MusicThumbnailRendererThumbnail? thumbnail,
      final String? thumbnailCrop,
      final String? thumbnailScale,
      final String? trackingParams}) = _$MusicThumbnailRendererImpl;

  factory _MusicThumbnailRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicThumbnailRendererImpl.fromJson;

  @override
  MusicThumbnailRendererThumbnail? get thumbnail;
  @override
  String? get thumbnailCrop;
  @override
  String? get thumbnailScale;
  @override
  String? get trackingParams;
  @override
  @JsonKey(ignore: true)
  _$$MusicThumbnailRendererImplCopyWith<_$MusicThumbnailRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MusicThumbnailRendererThumbnail _$MusicThumbnailRendererThumbnailFromJson(
    Map<String, dynamic> json) {
  return _MusicThumbnailRendererThumbnail.fromJson(json);
}

/// @nodoc
mixin _$MusicThumbnailRendererThumbnail {
  List<ThumbnailElement>? get thumbnails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicThumbnailRendererThumbnailCopyWith<MusicThumbnailRendererThumbnail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicThumbnailRendererThumbnailCopyWith<$Res> {
  factory $MusicThumbnailRendererThumbnailCopyWith(
          MusicThumbnailRendererThumbnail value,
          $Res Function(MusicThumbnailRendererThumbnail) then) =
      _$MusicThumbnailRendererThumbnailCopyWithImpl<$Res,
          MusicThumbnailRendererThumbnail>;
  @useResult
  $Res call({List<ThumbnailElement>? thumbnails});
}

/// @nodoc
class _$MusicThumbnailRendererThumbnailCopyWithImpl<$Res,
        $Val extends MusicThumbnailRendererThumbnail>
    implements $MusicThumbnailRendererThumbnailCopyWith<$Res> {
  _$MusicThumbnailRendererThumbnailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnails = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<ThumbnailElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicThumbnailRendererThumbnailImplCopyWith<$Res>
    implements $MusicThumbnailRendererThumbnailCopyWith<$Res> {
  factory _$$MusicThumbnailRendererThumbnailImplCopyWith(
          _$MusicThumbnailRendererThumbnailImpl value,
          $Res Function(_$MusicThumbnailRendererThumbnailImpl) then) =
      __$$MusicThumbnailRendererThumbnailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ThumbnailElement>? thumbnails});
}

/// @nodoc
class __$$MusicThumbnailRendererThumbnailImplCopyWithImpl<$Res>
    extends _$MusicThumbnailRendererThumbnailCopyWithImpl<$Res,
        _$MusicThumbnailRendererThumbnailImpl>
    implements _$$MusicThumbnailRendererThumbnailImplCopyWith<$Res> {
  __$$MusicThumbnailRendererThumbnailImplCopyWithImpl(
      _$MusicThumbnailRendererThumbnailImpl _value,
      $Res Function(_$MusicThumbnailRendererThumbnailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnails = freezed,
  }) {
    return _then(_$MusicThumbnailRendererThumbnailImpl(
      thumbnails: freezed == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<ThumbnailElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicThumbnailRendererThumbnailImpl
    implements _MusicThumbnailRendererThumbnail {
  const _$MusicThumbnailRendererThumbnailImpl(
      {final List<ThumbnailElement>? thumbnails})
      : _thumbnails = thumbnails;

  factory _$MusicThumbnailRendererThumbnailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MusicThumbnailRendererThumbnailImplFromJson(json);

  final List<ThumbnailElement>? _thumbnails;
  @override
  List<ThumbnailElement>? get thumbnails {
    final value = _thumbnails;
    if (value == null) return null;
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MusicThumbnailRendererThumbnail(thumbnails: $thumbnails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicThumbnailRendererThumbnailImpl &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_thumbnails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicThumbnailRendererThumbnailImplCopyWith<
          _$MusicThumbnailRendererThumbnailImpl>
      get copyWith => __$$MusicThumbnailRendererThumbnailImplCopyWithImpl<
          _$MusicThumbnailRendererThumbnailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicThumbnailRendererThumbnailImplToJson(
      this,
    );
  }
}

abstract class _MusicThumbnailRendererThumbnail
    implements MusicThumbnailRendererThumbnail {
  const factory _MusicThumbnailRendererThumbnail(
          {final List<ThumbnailElement>? thumbnails}) =
      _$MusicThumbnailRendererThumbnailImpl;

  factory _MusicThumbnailRendererThumbnail.fromJson(Map<String, dynamic> json) =
      _$MusicThumbnailRendererThumbnailImpl.fromJson;

  @override
  List<ThumbnailElement>? get thumbnails;
  @override
  @JsonKey(ignore: true)
  _$$MusicThumbnailRendererThumbnailImplCopyWith<
          _$MusicThumbnailRendererThumbnailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ThumbnailElement _$ThumbnailElementFromJson(Map<String, dynamic> json) {
  return _ThumbnailElement.fromJson(json);
}

/// @nodoc
mixin _$ThumbnailElement {
  String? get url => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbnailElementCopyWith<ThumbnailElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailElementCopyWith<$Res> {
  factory $ThumbnailElementCopyWith(
          ThumbnailElement value, $Res Function(ThumbnailElement) then) =
      _$ThumbnailElementCopyWithImpl<$Res, ThumbnailElement>;
  @useResult
  $Res call({String? url, int? width, int? height});
}

/// @nodoc
class _$ThumbnailElementCopyWithImpl<$Res, $Val extends ThumbnailElement>
    implements $ThumbnailElementCopyWith<$Res> {
  _$ThumbnailElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThumbnailElementImplCopyWith<$Res>
    implements $ThumbnailElementCopyWith<$Res> {
  factory _$$ThumbnailElementImplCopyWith(_$ThumbnailElementImpl value,
          $Res Function(_$ThumbnailElementImpl) then) =
      __$$ThumbnailElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, int? width, int? height});
}

/// @nodoc
class __$$ThumbnailElementImplCopyWithImpl<$Res>
    extends _$ThumbnailElementCopyWithImpl<$Res, _$ThumbnailElementImpl>
    implements _$$ThumbnailElementImplCopyWith<$Res> {
  __$$ThumbnailElementImplCopyWithImpl(_$ThumbnailElementImpl _value,
      $Res Function(_$ThumbnailElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$ThumbnailElementImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThumbnailElementImpl implements _ThumbnailElement {
  const _$ThumbnailElementImpl({this.url, this.width, this.height});

  factory _$ThumbnailElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThumbnailElementImplFromJson(json);

  @override
  final String? url;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'ThumbnailElement(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThumbnailElementImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThumbnailElementImplCopyWith<_$ThumbnailElementImpl> get copyWith =>
      __$$ThumbnailElementImplCopyWithImpl<_$ThumbnailElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThumbnailElementImplToJson(
      this,
    );
  }
}

abstract class _ThumbnailElement implements ThumbnailElement {
  const factory _ThumbnailElement(
      {final String? url,
      final int? width,
      final int? height}) = _$ThumbnailElementImpl;

  factory _ThumbnailElement.fromJson(Map<String, dynamic> json) =
      _$ThumbnailElementImpl.fromJson;

  @override
  String? get url;
  @override
  int? get width;
  @override
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$ThumbnailElementImplCopyWith<_$ThumbnailElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Continuation _$ContinuationFromJson(Map<String, dynamic> json) {
  return _Continuation.fromJson(json);
}

/// @nodoc
mixin _$Continuation {
  NextContinuationData? get nextContinuationData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContinuationCopyWith<Continuation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContinuationCopyWith<$Res> {
  factory $ContinuationCopyWith(
          Continuation value, $Res Function(Continuation) then) =
      _$ContinuationCopyWithImpl<$Res, Continuation>;
  @useResult
  $Res call({NextContinuationData? nextContinuationData});

  $NextContinuationDataCopyWith<$Res>? get nextContinuationData;
}

/// @nodoc
class _$ContinuationCopyWithImpl<$Res, $Val extends Continuation>
    implements $ContinuationCopyWith<$Res> {
  _$ContinuationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextContinuationData = freezed,
  }) {
    return _then(_value.copyWith(
      nextContinuationData: freezed == nextContinuationData
          ? _value.nextContinuationData
          : nextContinuationData // ignore: cast_nullable_to_non_nullable
              as NextContinuationData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NextContinuationDataCopyWith<$Res>? get nextContinuationData {
    if (_value.nextContinuationData == null) {
      return null;
    }

    return $NextContinuationDataCopyWith<$Res>(_value.nextContinuationData!,
        (value) {
      return _then(_value.copyWith(nextContinuationData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContinuationImplCopyWith<$Res>
    implements $ContinuationCopyWith<$Res> {
  factory _$$ContinuationImplCopyWith(
          _$ContinuationImpl value, $Res Function(_$ContinuationImpl) then) =
      __$$ContinuationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NextContinuationData? nextContinuationData});

  @override
  $NextContinuationDataCopyWith<$Res>? get nextContinuationData;
}

/// @nodoc
class __$$ContinuationImplCopyWithImpl<$Res>
    extends _$ContinuationCopyWithImpl<$Res, _$ContinuationImpl>
    implements _$$ContinuationImplCopyWith<$Res> {
  __$$ContinuationImplCopyWithImpl(
      _$ContinuationImpl _value, $Res Function(_$ContinuationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextContinuationData = freezed,
  }) {
    return _then(_$ContinuationImpl(
      nextContinuationData: freezed == nextContinuationData
          ? _value.nextContinuationData
          : nextContinuationData // ignore: cast_nullable_to_non_nullable
              as NextContinuationData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContinuationImpl implements _Continuation {
  const _$ContinuationImpl({this.nextContinuationData});

  factory _$ContinuationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContinuationImplFromJson(json);

  @override
  final NextContinuationData? nextContinuationData;

  @override
  String toString() {
    return 'Continuation(nextContinuationData: $nextContinuationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContinuationImpl &&
            (identical(other.nextContinuationData, nextContinuationData) ||
                other.nextContinuationData == nextContinuationData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nextContinuationData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContinuationImplCopyWith<_$ContinuationImpl> get copyWith =>
      __$$ContinuationImplCopyWithImpl<_$ContinuationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContinuationImplToJson(
      this,
    );
  }
}

abstract class _Continuation implements Continuation {
  const factory _Continuation(
      {final NextContinuationData? nextContinuationData}) = _$ContinuationImpl;

  factory _Continuation.fromJson(Map<String, dynamic> json) =
      _$ContinuationImpl.fromJson;

  @override
  NextContinuationData? get nextContinuationData;
  @override
  @JsonKey(ignore: true)
  _$$ContinuationImplCopyWith<_$ContinuationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NextContinuationData _$NextContinuationDataFromJson(Map<String, dynamic> json) {
  return _NextContinuationData.fromJson(json);
}

/// @nodoc
mixin _$NextContinuationData {
  String? get continuation => throw _privateConstructorUsedError;
  String? get clickTrackingParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextContinuationDataCopyWith<NextContinuationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextContinuationDataCopyWith<$Res> {
  factory $NextContinuationDataCopyWith(NextContinuationData value,
          $Res Function(NextContinuationData) then) =
      _$NextContinuationDataCopyWithImpl<$Res, NextContinuationData>;
  @useResult
  $Res call({String? continuation, String? clickTrackingParams});
}

/// @nodoc
class _$NextContinuationDataCopyWithImpl<$Res,
        $Val extends NextContinuationData>
    implements $NextContinuationDataCopyWith<$Res> {
  _$NextContinuationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? continuation = freezed,
    Object? clickTrackingParams = freezed,
  }) {
    return _then(_value.copyWith(
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextContinuationDataImplCopyWith<$Res>
    implements $NextContinuationDataCopyWith<$Res> {
  factory _$$NextContinuationDataImplCopyWith(_$NextContinuationDataImpl value,
          $Res Function(_$NextContinuationDataImpl) then) =
      __$$NextContinuationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? continuation, String? clickTrackingParams});
}

/// @nodoc
class __$$NextContinuationDataImplCopyWithImpl<$Res>
    extends _$NextContinuationDataCopyWithImpl<$Res, _$NextContinuationDataImpl>
    implements _$$NextContinuationDataImplCopyWith<$Res> {
  __$$NextContinuationDataImplCopyWithImpl(_$NextContinuationDataImpl _value,
      $Res Function(_$NextContinuationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? continuation = freezed,
    Object? clickTrackingParams = freezed,
  }) {
    return _then(_$NextContinuationDataImpl(
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
      clickTrackingParams: freezed == clickTrackingParams
          ? _value.clickTrackingParams
          : clickTrackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextContinuationDataImpl implements _NextContinuationData {
  const _$NextContinuationDataImpl(
      {this.continuation, this.clickTrackingParams});

  factory _$NextContinuationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextContinuationDataImplFromJson(json);

  @override
  final String? continuation;
  @override
  final String? clickTrackingParams;

  @override
  String toString() {
    return 'NextContinuationData(continuation: $continuation, clickTrackingParams: $clickTrackingParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextContinuationDataImpl &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation) &&
            (identical(other.clickTrackingParams, clickTrackingParams) ||
                other.clickTrackingParams == clickTrackingParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, continuation, clickTrackingParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextContinuationDataImplCopyWith<_$NextContinuationDataImpl>
      get copyWith =>
          __$$NextContinuationDataImplCopyWithImpl<_$NextContinuationDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NextContinuationDataImplToJson(
      this,
    );
  }
}

abstract class _NextContinuationData implements NextContinuationData {
  const factory _NextContinuationData(
      {final String? continuation,
      final String? clickTrackingParams}) = _$NextContinuationDataImpl;

  factory _NextContinuationData.fromJson(Map<String, dynamic> json) =
      _$NextContinuationDataImpl.fromJson;

  @override
  String? get continuation;
  @override
  String? get clickTrackingParams;
  @override
  @JsonKey(ignore: true)
  _$$NextContinuationDataImplCopyWith<_$NextContinuationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ShelfDivider _$ShelfDividerFromJson(Map<String, dynamic> json) {
  return _ShelfDivider.fromJson(json);
}

/// @nodoc
mixin _$ShelfDivider {
  MusicShelfDividerRenderer? get musicShelfDividerRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShelfDividerCopyWith<ShelfDivider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfDividerCopyWith<$Res> {
  factory $ShelfDividerCopyWith(
          ShelfDivider value, $Res Function(ShelfDivider) then) =
      _$ShelfDividerCopyWithImpl<$Res, ShelfDivider>;
  @useResult
  $Res call({MusicShelfDividerRenderer? musicShelfDividerRenderer});

  $MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer;
}

/// @nodoc
class _$ShelfDividerCopyWithImpl<$Res, $Val extends ShelfDivider>
    implements $ShelfDividerCopyWith<$Res> {
  _$ShelfDividerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicShelfDividerRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      musicShelfDividerRenderer: freezed == musicShelfDividerRenderer
          ? _value.musicShelfDividerRenderer
          : musicShelfDividerRenderer // ignore: cast_nullable_to_non_nullable
              as MusicShelfDividerRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer {
    if (_value.musicShelfDividerRenderer == null) {
      return null;
    }

    return $MusicShelfDividerRendererCopyWith<$Res>(
        _value.musicShelfDividerRenderer!, (value) {
      return _then(_value.copyWith(musicShelfDividerRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShelfDividerImplCopyWith<$Res>
    implements $ShelfDividerCopyWith<$Res> {
  factory _$$ShelfDividerImplCopyWith(
          _$ShelfDividerImpl value, $Res Function(_$ShelfDividerImpl) then) =
      __$$ShelfDividerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MusicShelfDividerRenderer? musicShelfDividerRenderer});

  @override
  $MusicShelfDividerRendererCopyWith<$Res>? get musicShelfDividerRenderer;
}

/// @nodoc
class __$$ShelfDividerImplCopyWithImpl<$Res>
    extends _$ShelfDividerCopyWithImpl<$Res, _$ShelfDividerImpl>
    implements _$$ShelfDividerImplCopyWith<$Res> {
  __$$ShelfDividerImplCopyWithImpl(
      _$ShelfDividerImpl _value, $Res Function(_$ShelfDividerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicShelfDividerRenderer = freezed,
  }) {
    return _then(_$ShelfDividerImpl(
      musicShelfDividerRenderer: freezed == musicShelfDividerRenderer
          ? _value.musicShelfDividerRenderer
          : musicShelfDividerRenderer // ignore: cast_nullable_to_non_nullable
              as MusicShelfDividerRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShelfDividerImpl implements _ShelfDivider {
  const _$ShelfDividerImpl({this.musicShelfDividerRenderer});

  factory _$ShelfDividerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelfDividerImplFromJson(json);

  @override
  final MusicShelfDividerRenderer? musicShelfDividerRenderer;

  @override
  String toString() {
    return 'ShelfDivider(musicShelfDividerRenderer: $musicShelfDividerRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelfDividerImpl &&
            (identical(other.musicShelfDividerRenderer,
                    musicShelfDividerRenderer) ||
                other.musicShelfDividerRenderer == musicShelfDividerRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, musicShelfDividerRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelfDividerImplCopyWith<_$ShelfDividerImpl> get copyWith =>
      __$$ShelfDividerImplCopyWithImpl<_$ShelfDividerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelfDividerImplToJson(
      this,
    );
  }
}

abstract class _ShelfDivider implements ShelfDivider {
  const factory _ShelfDivider(
          {final MusicShelfDividerRenderer? musicShelfDividerRenderer}) =
      _$ShelfDividerImpl;

  factory _ShelfDivider.fromJson(Map<String, dynamic> json) =
      _$ShelfDividerImpl.fromJson;

  @override
  MusicShelfDividerRenderer? get musicShelfDividerRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ShelfDividerImplCopyWith<_$ShelfDividerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicShelfDividerRenderer _$MusicShelfDividerRendererFromJson(
    Map<String, dynamic> json) {
  return _MusicShelfDividerRenderer.fromJson(json);
}

/// @nodoc
mixin _$MusicShelfDividerRenderer {
  bool? get hidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicShelfDividerRendererCopyWith<MusicShelfDividerRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicShelfDividerRendererCopyWith<$Res> {
  factory $MusicShelfDividerRendererCopyWith(MusicShelfDividerRenderer value,
          $Res Function(MusicShelfDividerRenderer) then) =
      _$MusicShelfDividerRendererCopyWithImpl<$Res, MusicShelfDividerRenderer>;
  @useResult
  $Res call({bool? hidden});
}

/// @nodoc
class _$MusicShelfDividerRendererCopyWithImpl<$Res,
        $Val extends MusicShelfDividerRenderer>
    implements $MusicShelfDividerRendererCopyWith<$Res> {
  _$MusicShelfDividerRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidden = freezed,
  }) {
    return _then(_value.copyWith(
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicShelfDividerRendererImplCopyWith<$Res>
    implements $MusicShelfDividerRendererCopyWith<$Res> {
  factory _$$MusicShelfDividerRendererImplCopyWith(
          _$MusicShelfDividerRendererImpl value,
          $Res Function(_$MusicShelfDividerRendererImpl) then) =
      __$$MusicShelfDividerRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? hidden});
}

/// @nodoc
class __$$MusicShelfDividerRendererImplCopyWithImpl<$Res>
    extends _$MusicShelfDividerRendererCopyWithImpl<$Res,
        _$MusicShelfDividerRendererImpl>
    implements _$$MusicShelfDividerRendererImplCopyWith<$Res> {
  __$$MusicShelfDividerRendererImplCopyWithImpl(
      _$MusicShelfDividerRendererImpl _value,
      $Res Function(_$MusicShelfDividerRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidden = freezed,
  }) {
    return _then(_$MusicShelfDividerRendererImpl(
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicShelfDividerRendererImpl implements _MusicShelfDividerRenderer {
  const _$MusicShelfDividerRendererImpl({this.hidden});

  factory _$MusicShelfDividerRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicShelfDividerRendererImplFromJson(json);

  @override
  final bool? hidden;

  @override
  String toString() {
    return 'MusicShelfDividerRenderer(hidden: $hidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicShelfDividerRendererImpl &&
            (identical(other.hidden, hidden) || other.hidden == hidden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicShelfDividerRendererImplCopyWith<_$MusicShelfDividerRendererImpl>
      get copyWith => __$$MusicShelfDividerRendererImplCopyWithImpl<
          _$MusicShelfDividerRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicShelfDividerRendererImplToJson(
      this,
    );
  }
}

abstract class _MusicShelfDividerRenderer implements MusicShelfDividerRenderer {
  const factory _MusicShelfDividerRenderer({final bool? hidden}) =
      _$MusicShelfDividerRendererImpl;

  factory _MusicShelfDividerRenderer.fromJson(Map<String, dynamic> json) =
      _$MusicShelfDividerRendererImpl.fromJson;

  @override
  bool? get hidden;
  @override
  @JsonKey(ignore: true)
  _$$MusicShelfDividerRendererImplCopyWith<_$MusicShelfDividerRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  ChipCloudRenderer? get chipCloudRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call({ChipCloudRenderer? chipCloudRenderer});

  $ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer;
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chipCloudRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      chipCloudRenderer: freezed == chipCloudRenderer
          ? _value.chipCloudRenderer
          : chipCloudRenderer // ignore: cast_nullable_to_non_nullable
              as ChipCloudRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer {
    if (_value.chipCloudRenderer == null) {
      return null;
    }

    return $ChipCloudRendererCopyWith<$Res>(_value.chipCloudRenderer!, (value) {
      return _then(_value.copyWith(chipCloudRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HeaderImplCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$HeaderImplCopyWith(
          _$HeaderImpl value, $Res Function(_$HeaderImpl) then) =
      __$$HeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChipCloudRenderer? chipCloudRenderer});

  @override
  $ChipCloudRendererCopyWith<$Res>? get chipCloudRenderer;
}

/// @nodoc
class __$$HeaderImplCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$HeaderImpl>
    implements _$$HeaderImplCopyWith<$Res> {
  __$$HeaderImplCopyWithImpl(
      _$HeaderImpl _value, $Res Function(_$HeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chipCloudRenderer = freezed,
  }) {
    return _then(_$HeaderImpl(
      chipCloudRenderer: freezed == chipCloudRenderer
          ? _value.chipCloudRenderer
          : chipCloudRenderer // ignore: cast_nullable_to_non_nullable
              as ChipCloudRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeaderImpl implements _Header {
  const _$HeaderImpl({this.chipCloudRenderer});

  factory _$HeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeaderImplFromJson(json);

  @override
  final ChipCloudRenderer? chipCloudRenderer;

  @override
  String toString() {
    return 'Header(chipCloudRenderer: $chipCloudRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeaderImpl &&
            (identical(other.chipCloudRenderer, chipCloudRenderer) ||
                other.chipCloudRenderer == chipCloudRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chipCloudRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      __$$HeaderImplCopyWithImpl<_$HeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeaderImplToJson(
      this,
    );
  }
}

abstract class _Header implements Header {
  const factory _Header({final ChipCloudRenderer? chipCloudRenderer}) =
      _$HeaderImpl;

  factory _Header.fromJson(Map<String, dynamic> json) = _$HeaderImpl.fromJson;

  @override
  ChipCloudRenderer? get chipCloudRenderer;
  @override
  @JsonKey(ignore: true)
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChipCloudRenderer _$ChipCloudRendererFromJson(Map<String, dynamic> json) {
  return _ChipCloudRenderer.fromJson(json);
}

/// @nodoc
mixin _$ChipCloudRenderer {
  List<Chip>? get chips => throw _privateConstructorUsedError;
  int? get collapsedRowCount => throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  bool? get horizontalScrollable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChipCloudRendererCopyWith<ChipCloudRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChipCloudRendererCopyWith<$Res> {
  factory $ChipCloudRendererCopyWith(
          ChipCloudRenderer value, $Res Function(ChipCloudRenderer) then) =
      _$ChipCloudRendererCopyWithImpl<$Res, ChipCloudRenderer>;
  @useResult
  $Res call(
      {List<Chip>? chips,
      int? collapsedRowCount,
      String? trackingParams,
      bool? horizontalScrollable});
}

/// @nodoc
class _$ChipCloudRendererCopyWithImpl<$Res, $Val extends ChipCloudRenderer>
    implements $ChipCloudRendererCopyWith<$Res> {
  _$ChipCloudRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chips = freezed,
    Object? collapsedRowCount = freezed,
    Object? trackingParams = freezed,
    Object? horizontalScrollable = freezed,
  }) {
    return _then(_value.copyWith(
      chips: freezed == chips
          ? _value.chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<Chip>?,
      collapsedRowCount: freezed == collapsedRowCount
          ? _value.collapsedRowCount
          : collapsedRowCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalScrollable: freezed == horizontalScrollable
          ? _value.horizontalScrollable
          : horizontalScrollable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChipCloudRendererImplCopyWith<$Res>
    implements $ChipCloudRendererCopyWith<$Res> {
  factory _$$ChipCloudRendererImplCopyWith(_$ChipCloudRendererImpl value,
          $Res Function(_$ChipCloudRendererImpl) then) =
      __$$ChipCloudRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Chip>? chips,
      int? collapsedRowCount,
      String? trackingParams,
      bool? horizontalScrollable});
}

/// @nodoc
class __$$ChipCloudRendererImplCopyWithImpl<$Res>
    extends _$ChipCloudRendererCopyWithImpl<$Res, _$ChipCloudRendererImpl>
    implements _$$ChipCloudRendererImplCopyWith<$Res> {
  __$$ChipCloudRendererImplCopyWithImpl(_$ChipCloudRendererImpl _value,
      $Res Function(_$ChipCloudRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chips = freezed,
    Object? collapsedRowCount = freezed,
    Object? trackingParams = freezed,
    Object? horizontalScrollable = freezed,
  }) {
    return _then(_$ChipCloudRendererImpl(
      chips: freezed == chips
          ? _value._chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<Chip>?,
      collapsedRowCount: freezed == collapsedRowCount
          ? _value.collapsedRowCount
          : collapsedRowCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalScrollable: freezed == horizontalScrollable
          ? _value.horizontalScrollable
          : horizontalScrollable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChipCloudRendererImpl implements _ChipCloudRenderer {
  const _$ChipCloudRendererImpl(
      {final List<Chip>? chips,
      this.collapsedRowCount,
      this.trackingParams,
      this.horizontalScrollable})
      : _chips = chips;

  factory _$ChipCloudRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChipCloudRendererImplFromJson(json);

  final List<Chip>? _chips;
  @override
  List<Chip>? get chips {
    final value = _chips;
    if (value == null) return null;
    if (_chips is EqualUnmodifiableListView) return _chips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? collapsedRowCount;
  @override
  final String? trackingParams;
  @override
  final bool? horizontalScrollable;

  @override
  String toString() {
    return 'ChipCloudRenderer(chips: $chips, collapsedRowCount: $collapsedRowCount, trackingParams: $trackingParams, horizontalScrollable: $horizontalScrollable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChipCloudRendererImpl &&
            const DeepCollectionEquality().equals(other._chips, _chips) &&
            (identical(other.collapsedRowCount, collapsedRowCount) ||
                other.collapsedRowCount == collapsedRowCount) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.horizontalScrollable, horizontalScrollable) ||
                other.horizontalScrollable == horizontalScrollable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chips),
      collapsedRowCount,
      trackingParams,
      horizontalScrollable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChipCloudRendererImplCopyWith<_$ChipCloudRendererImpl> get copyWith =>
      __$$ChipCloudRendererImplCopyWithImpl<_$ChipCloudRendererImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChipCloudRendererImplToJson(
      this,
    );
  }
}

abstract class _ChipCloudRenderer implements ChipCloudRenderer {
  const factory _ChipCloudRenderer(
      {final List<Chip>? chips,
      final int? collapsedRowCount,
      final String? trackingParams,
      final bool? horizontalScrollable}) = _$ChipCloudRendererImpl;

  factory _ChipCloudRenderer.fromJson(Map<String, dynamic> json) =
      _$ChipCloudRendererImpl.fromJson;

  @override
  List<Chip>? get chips;
  @override
  int? get collapsedRowCount;
  @override
  String? get trackingParams;
  @override
  bool? get horizontalScrollable;
  @override
  @JsonKey(ignore: true)
  _$$ChipCloudRendererImplCopyWith<_$ChipCloudRendererImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chip _$ChipFromJson(Map<String, dynamic> json) {
  return _Chip.fromJson(json);
}

/// @nodoc
mixin _$Chip {
  ChipCloudChipRenderer? get chipCloudChipRenderer =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChipCopyWith<Chip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChipCopyWith<$Res> {
  factory $ChipCopyWith(Chip value, $Res Function(Chip) then) =
      _$ChipCopyWithImpl<$Res, Chip>;
  @useResult
  $Res call({ChipCloudChipRenderer? chipCloudChipRenderer});

  $ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer;
}

/// @nodoc
class _$ChipCopyWithImpl<$Res, $Val extends Chip>
    implements $ChipCopyWith<$Res> {
  _$ChipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chipCloudChipRenderer = freezed,
  }) {
    return _then(_value.copyWith(
      chipCloudChipRenderer: freezed == chipCloudChipRenderer
          ? _value.chipCloudChipRenderer
          : chipCloudChipRenderer // ignore: cast_nullable_to_non_nullable
              as ChipCloudChipRenderer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer {
    if (_value.chipCloudChipRenderer == null) {
      return null;
    }

    return $ChipCloudChipRendererCopyWith<$Res>(_value.chipCloudChipRenderer!,
        (value) {
      return _then(_value.copyWith(chipCloudChipRenderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChipImplCopyWith<$Res> implements $ChipCopyWith<$Res> {
  factory _$$ChipImplCopyWith(
          _$ChipImpl value, $Res Function(_$ChipImpl) then) =
      __$$ChipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChipCloudChipRenderer? chipCloudChipRenderer});

  @override
  $ChipCloudChipRendererCopyWith<$Res>? get chipCloudChipRenderer;
}

/// @nodoc
class __$$ChipImplCopyWithImpl<$Res>
    extends _$ChipCopyWithImpl<$Res, _$ChipImpl>
    implements _$$ChipImplCopyWith<$Res> {
  __$$ChipImplCopyWithImpl(_$ChipImpl _value, $Res Function(_$ChipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chipCloudChipRenderer = freezed,
  }) {
    return _then(_$ChipImpl(
      chipCloudChipRenderer: freezed == chipCloudChipRenderer
          ? _value.chipCloudChipRenderer
          : chipCloudChipRenderer // ignore: cast_nullable_to_non_nullable
              as ChipCloudChipRenderer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChipImpl implements _Chip {
  const _$ChipImpl({this.chipCloudChipRenderer});

  factory _$ChipImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChipImplFromJson(json);

  @override
  final ChipCloudChipRenderer? chipCloudChipRenderer;

  @override
  String toString() {
    return 'Chip(chipCloudChipRenderer: $chipCloudChipRenderer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChipImpl &&
            (identical(other.chipCloudChipRenderer, chipCloudChipRenderer) ||
                other.chipCloudChipRenderer == chipCloudChipRenderer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chipCloudChipRenderer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChipImplCopyWith<_$ChipImpl> get copyWith =>
      __$$ChipImplCopyWithImpl<_$ChipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChipImplToJson(
      this,
    );
  }
}

abstract class _Chip implements Chip {
  const factory _Chip({final ChipCloudChipRenderer? chipCloudChipRenderer}) =
      _$ChipImpl;

  factory _Chip.fromJson(Map<String, dynamic> json) = _$ChipImpl.fromJson;

  @override
  ChipCloudChipRenderer? get chipCloudChipRenderer;
  @override
  @JsonKey(ignore: true)
  _$$ChipImplCopyWith<_$ChipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChipCloudChipRenderer _$ChipCloudChipRendererFromJson(
    Map<String, dynamic> json) {
  return _ChipCloudChipRenderer.fromJson(json);
}

/// @nodoc
mixin _$ChipCloudChipRenderer {
  StyleClass? get style => throw _privateConstructorUsedError;
  ChipCloudChipRendererNavigationEndpoint? get navigationEndpoint =>
      throw _privateConstructorUsedError;
  String? get trackingParams => throw _privateConstructorUsedError;
  Icon? get icon => throw _privateConstructorUsedError;
  Accessibility? get accessibilityData => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  Title? get text => throw _privateConstructorUsedError;
  String? get uniqueId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChipCloudChipRendererCopyWith<ChipCloudChipRenderer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChipCloudChipRendererCopyWith<$Res> {
  factory $ChipCloudChipRendererCopyWith(ChipCloudChipRenderer value,
          $Res Function(ChipCloudChipRenderer) then) =
      _$ChipCloudChipRendererCopyWithImpl<$Res, ChipCloudChipRenderer>;
  @useResult
  $Res call(
      {StyleClass? style,
      ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      Icon? icon,
      Accessibility? accessibilityData,
      bool? isSelected,
      Title? text,
      String? uniqueId});

  $StyleClassCopyWith<$Res>? get style;
  $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint;
  $IconCopyWith<$Res>? get icon;
  $AccessibilityCopyWith<$Res>? get accessibilityData;
  $TitleCopyWith<$Res>? get text;
}

/// @nodoc
class _$ChipCloudChipRendererCopyWithImpl<$Res,
        $Val extends ChipCloudChipRenderer>
    implements $ChipCloudChipRendererCopyWith<$Res> {
  _$ChipCloudChipRendererCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? icon = freezed,
    Object? accessibilityData = freezed,
    Object? isSelected = freezed,
    Object? text = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_value.copyWith(
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleClass?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as ChipCloudChipRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      uniqueId: freezed == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StyleClassCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $StyleClassCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint {
    if (_value.navigationEndpoint == null) {
      return null;
    }

    return $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>(
        _value.navigationEndpoint!, (value) {
      return _then(_value.copyWith(navigationEndpoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $IconCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilityCopyWith<$Res>? get accessibilityData {
    if (_value.accessibilityData == null) {
      return null;
    }

    return $AccessibilityCopyWith<$Res>(_value.accessibilityData!, (value) {
      return _then(_value.copyWith(accessibilityData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TitleCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $TitleCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChipCloudChipRendererImplCopyWith<$Res>
    implements $ChipCloudChipRendererCopyWith<$Res> {
  factory _$$ChipCloudChipRendererImplCopyWith(
          _$ChipCloudChipRendererImpl value,
          $Res Function(_$ChipCloudChipRendererImpl) then) =
      __$$ChipCloudChipRendererImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StyleClass? style,
      ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,
      String? trackingParams,
      Icon? icon,
      Accessibility? accessibilityData,
      bool? isSelected,
      Title? text,
      String? uniqueId});

  @override
  $StyleClassCopyWith<$Res>? get style;
  @override
  $ChipCloudChipRendererNavigationEndpointCopyWith<$Res>?
      get navigationEndpoint;
  @override
  $IconCopyWith<$Res>? get icon;
  @override
  $AccessibilityCopyWith<$Res>? get accessibilityData;
  @override
  $TitleCopyWith<$Res>? get text;
}

/// @nodoc
class __$$ChipCloudChipRendererImplCopyWithImpl<$Res>
    extends _$ChipCloudChipRendererCopyWithImpl<$Res,
        _$ChipCloudChipRendererImpl>
    implements _$$ChipCloudChipRendererImplCopyWith<$Res> {
  __$$ChipCloudChipRendererImplCopyWithImpl(_$ChipCloudChipRendererImpl _value,
      $Res Function(_$ChipCloudChipRendererImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = freezed,
    Object? navigationEndpoint = freezed,
    Object? trackingParams = freezed,
    Object? icon = freezed,
    Object? accessibilityData = freezed,
    Object? isSelected = freezed,
    Object? text = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_$ChipCloudChipRendererImpl(
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleClass?,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as ChipCloudChipRendererNavigationEndpoint?,
      trackingParams: freezed == trackingParams
          ? _value.trackingParams
          : trackingParams // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      accessibilityData: freezed == accessibilityData
          ? _value.accessibilityData
          : accessibilityData // ignore: cast_nullable_to_non_nullable
              as Accessibility?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Title?,
      uniqueId: freezed == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChipCloudChipRendererImpl implements _ChipCloudChipRenderer {
  const _$ChipCloudChipRendererImpl(
      {this.style,
      this.navigationEndpoint,
      this.trackingParams,
      this.icon,
      this.accessibilityData,
      this.isSelected,
      this.text,
      this.uniqueId});

  factory _$ChipCloudChipRendererImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChipCloudChipRendererImplFromJson(json);

  @override
  final StyleClass? style;
  @override
  final ChipCloudChipRendererNavigationEndpoint? navigationEndpoint;
  @override
  final String? trackingParams;
  @override
  final Icon? icon;
  @override
  final Accessibility? accessibilityData;
  @override
  final bool? isSelected;
  @override
  final Title? text;
  @override
  final String? uniqueId;

  @override
  String toString() {
    return 'ChipCloudChipRenderer(style: $style, navigationEndpoint: $navigationEndpoint, trackingParams: $trackingParams, icon: $icon, accessibilityData: $accessibilityData, isSelected: $isSelected, text: $text, uniqueId: $uniqueId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChipCloudChipRendererImpl &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint) &&
            (identical(other.trackingParams, trackingParams) ||
                other.trackingParams == trackingParams) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.accessibilityData, accessibilityData) ||
                other.accessibilityData == accessibilityData) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, style, navigationEndpoint,
      trackingParams, icon, accessibilityData, isSelected, text, uniqueId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChipCloudChipRendererImplCopyWith<_$ChipCloudChipRendererImpl>
      get copyWith => __$$ChipCloudChipRendererImplCopyWithImpl<
          _$ChipCloudChipRendererImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChipCloudChipRendererImplToJson(
      this,
    );
  }
}

abstract class _ChipCloudChipRenderer implements ChipCloudChipRenderer {
  const factory _ChipCloudChipRenderer(
      {final StyleClass? style,
      final ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,
      final String? trackingParams,
      final Icon? icon,
      final Accessibility? accessibilityData,
      final bool? isSelected,
      final Title? text,
      final String? uniqueId}) = _$ChipCloudChipRendererImpl;

  factory _ChipCloudChipRenderer.fromJson(Map<String, dynamic> json) =
      _$ChipCloudChipRendererImpl.fromJson;

  @override
  StyleClass? get style;
  @override
  ChipCloudChipRendererNavigationEndpoint? get navigationEndpoint;
  @override
  String? get trackingParams;
  @override
  Icon? get icon;
  @override
  Accessibility? get accessibilityData;
  @override
  bool? get isSelected;
  @override
  Title? get text;
  @override
  String? get uniqueId;
  @override
  @JsonKey(ignore: true)
  _$$ChipCloudChipRendererImplCopyWith<_$ChipCloudChipRendererImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChipCloudChipRendererNavigationEndpoint
    _$ChipCloudChipRendererNavigationEndpointFromJson(
        Map<String, dynamic> json) {
  return _ChipCloudChipRendererNavigationEndpoint.fromJson(json);
}

/// @nodoc
mixin _$ChipCloudChipRendererNavigationEndpoint {
  String? get clickTrackingParams => throw _privateConstructorUsedError;
  SearchEndpoint? get searchEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChipCloudChipRendererNavigationEndpointCopyWith<
          ChipCloudChipRendererNavigationEndpoint>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  factory $ChipCloudChipRendererNavigationEndpointCopyWith(
          ChipCloudChipRendererNavigationEndpoint value,
          $Res Function(ChipCloudChipRendererNavigationEndpoint) then) =
      _$ChipCloudChipRendererNavigationEndpointCopyWithImpl<$Res,
          ChipCloudChipRendererNavigationEndpoint>;
  @useResult
  $Res call({String? clickTrackingParams, SearchEndpoint? searchEndpoint});

  $SearchEndpointCopyWith<$Res>? get searchEndpoint;
}

/// @nodoc
class _$ChipCloudChipRendererNavigationEndpointCopyWithImpl<$Res,
        $Val extends ChipCloudChipRendererNavigationEndpoint>
    implements $ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  _$ChipCloudChipRendererNavigationEndpointCopyWithImpl(
      this._value, this._then);

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
abstract class _$$ChipCloudChipRendererNavigationEndpointImplCopyWith<$Res>
    implements $ChipCloudChipRendererNavigationEndpointCopyWith<$Res> {
  factory _$$ChipCloudChipRendererNavigationEndpointImplCopyWith(
          _$ChipCloudChipRendererNavigationEndpointImpl value,
          $Res Function(_$ChipCloudChipRendererNavigationEndpointImpl) then) =
      __$$ChipCloudChipRendererNavigationEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clickTrackingParams, SearchEndpoint? searchEndpoint});

  @override
  $SearchEndpointCopyWith<$Res>? get searchEndpoint;
}

/// @nodoc
class __$$ChipCloudChipRendererNavigationEndpointImplCopyWithImpl<$Res>
    extends _$ChipCloudChipRendererNavigationEndpointCopyWithImpl<$Res,
        _$ChipCloudChipRendererNavigationEndpointImpl>
    implements _$$ChipCloudChipRendererNavigationEndpointImplCopyWith<$Res> {
  __$$ChipCloudChipRendererNavigationEndpointImplCopyWithImpl(
      _$ChipCloudChipRendererNavigationEndpointImpl _value,
      $Res Function(_$ChipCloudChipRendererNavigationEndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clickTrackingParams = freezed,
    Object? searchEndpoint = freezed,
  }) {
    return _then(_$ChipCloudChipRendererNavigationEndpointImpl(
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
class _$ChipCloudChipRendererNavigationEndpointImpl
    implements _ChipCloudChipRendererNavigationEndpoint {
  const _$ChipCloudChipRendererNavigationEndpointImpl(
      {this.clickTrackingParams, this.searchEndpoint});

  factory _$ChipCloudChipRendererNavigationEndpointImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChipCloudChipRendererNavigationEndpointImplFromJson(json);

  @override
  final String? clickTrackingParams;
  @override
  final SearchEndpoint? searchEndpoint;

  @override
  String toString() {
    return 'ChipCloudChipRendererNavigationEndpoint(clickTrackingParams: $clickTrackingParams, searchEndpoint: $searchEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChipCloudChipRendererNavigationEndpointImpl &&
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
  _$$ChipCloudChipRendererNavigationEndpointImplCopyWith<
          _$ChipCloudChipRendererNavigationEndpointImpl>
      get copyWith =>
          __$$ChipCloudChipRendererNavigationEndpointImplCopyWithImpl<
              _$ChipCloudChipRendererNavigationEndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChipCloudChipRendererNavigationEndpointImplToJson(
      this,
    );
  }
}

abstract class _ChipCloudChipRendererNavigationEndpoint
    implements ChipCloudChipRendererNavigationEndpoint {
  const factory _ChipCloudChipRendererNavigationEndpoint(
          {final String? clickTrackingParams,
          final SearchEndpoint? searchEndpoint}) =
      _$ChipCloudChipRendererNavigationEndpointImpl;

  factory _ChipCloudChipRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =
      _$ChipCloudChipRendererNavigationEndpointImpl.fromJson;

  @override
  String? get clickTrackingParams;
  @override
  SearchEndpoint? get searchEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$ChipCloudChipRendererNavigationEndpointImplCopyWith<
          _$ChipCloudChipRendererNavigationEndpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchEndpoint _$SearchEndpointFromJson(Map<String, dynamic> json) {
  return _SearchEndpoint.fromJson(json);
}

/// @nodoc
mixin _$SearchEndpoint {
  String? get query => throw _privateConstructorUsedError;
  String? get params => throw _privateConstructorUsedError;

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
  $Res call({String? query, String? params});
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
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$SearchEndpointImplCopyWith<$Res>
    implements $SearchEndpointCopyWith<$Res> {
  factory _$$SearchEndpointImplCopyWith(_$SearchEndpointImpl value,
          $Res Function(_$SearchEndpointImpl) then) =
      __$$SearchEndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query, String? params});
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
    Object? params = freezed,
  }) {
    return _then(_$SearchEndpointImpl(
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
class _$SearchEndpointImpl implements _SearchEndpoint {
  const _$SearchEndpointImpl({this.query, this.params});

  factory _$SearchEndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchEndpointImplFromJson(json);

  @override
  final String? query;
  @override
  final String? params;

  @override
  String toString() {
    return 'SearchEndpoint(query: $query, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEndpointImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.params, params) || other.params == params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, params);

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
  const factory _SearchEndpoint({final String? query, final String? params}) =
      _$SearchEndpointImpl;

  factory _SearchEndpoint.fromJson(Map<String, dynamic> json) =
      _$SearchEndpointImpl.fromJson;

  @override
  String? get query;
  @override
  String? get params;
  @override
  @JsonKey(ignore: true)
  _$$SearchEndpointImplCopyWith<_$SearchEndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StyleClass _$StyleClassFromJson(Map<String, dynamic> json) {
  return _StyleClass.fromJson(json);
}

/// @nodoc
mixin _$StyleClass {
  String? get styleType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StyleClassCopyWith<StyleClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleClassCopyWith<$Res> {
  factory $StyleClassCopyWith(
          StyleClass value, $Res Function(StyleClass) then) =
      _$StyleClassCopyWithImpl<$Res, StyleClass>;
  @useResult
  $Res call({String? styleType});
}

/// @nodoc
class _$StyleClassCopyWithImpl<$Res, $Val extends StyleClass>
    implements $StyleClassCopyWith<$Res> {
  _$StyleClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styleType = freezed,
  }) {
    return _then(_value.copyWith(
      styleType: freezed == styleType
          ? _value.styleType
          : styleType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyleClassImplCopyWith<$Res>
    implements $StyleClassCopyWith<$Res> {
  factory _$$StyleClassImplCopyWith(
          _$StyleClassImpl value, $Res Function(_$StyleClassImpl) then) =
      __$$StyleClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? styleType});
}

/// @nodoc
class __$$StyleClassImplCopyWithImpl<$Res>
    extends _$StyleClassCopyWithImpl<$Res, _$StyleClassImpl>
    implements _$$StyleClassImplCopyWith<$Res> {
  __$$StyleClassImplCopyWithImpl(
      _$StyleClassImpl _value, $Res Function(_$StyleClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styleType = freezed,
  }) {
    return _then(_$StyleClassImpl(
      styleType: freezed == styleType
          ? _value.styleType
          : styleType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StyleClassImpl implements _StyleClass {
  const _$StyleClassImpl({this.styleType});

  factory _$StyleClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$StyleClassImplFromJson(json);

  @override
  final String? styleType;

  @override
  String toString() {
    return 'StyleClass(styleType: $styleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyleClassImpl &&
            (identical(other.styleType, styleType) ||
                other.styleType == styleType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, styleType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StyleClassImplCopyWith<_$StyleClassImpl> get copyWith =>
      __$$StyleClassImplCopyWithImpl<_$StyleClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StyleClassImplToJson(
      this,
    );
  }
}

abstract class _StyleClass implements StyleClass {
  const factory _StyleClass({final String? styleType}) = _$StyleClassImpl;

  factory _StyleClass.fromJson(Map<String, dynamic> json) =
      _$StyleClassImpl.fromJson;

  @override
  String? get styleType;
  @override
  @JsonKey(ignore: true)
  _$$StyleClassImplCopyWith<_$StyleClassImpl> get copyWith =>
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
  int? get maxAgeSeconds => throw _privateConstructorUsedError;

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
      {String? visitorData,
      List<ServiceTrackingParam>? serviceTrackingParams,
      int? maxAgeSeconds});
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
    Object? maxAgeSeconds = freezed,
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
      maxAgeSeconds: freezed == maxAgeSeconds
          ? _value.maxAgeSeconds
          : maxAgeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {String? visitorData,
      List<ServiceTrackingParam>? serviceTrackingParams,
      int? maxAgeSeconds});
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
    Object? maxAgeSeconds = freezed,
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
      maxAgeSeconds: freezed == maxAgeSeconds
          ? _value.maxAgeSeconds
          : maxAgeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseContextImpl implements _ResponseContext {
  const _$ResponseContextImpl(
      {this.visitorData,
      final List<ServiceTrackingParam>? serviceTrackingParams,
      this.maxAgeSeconds})
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
  final int? maxAgeSeconds;

  @override
  String toString() {
    return 'ResponseContext(visitorData: $visitorData, serviceTrackingParams: $serviceTrackingParams, maxAgeSeconds: $maxAgeSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseContextImpl &&
            (identical(other.visitorData, visitorData) ||
                other.visitorData == visitorData) &&
            const DeepCollectionEquality()
                .equals(other._serviceTrackingParams, _serviceTrackingParams) &&
            (identical(other.maxAgeSeconds, maxAgeSeconds) ||
                other.maxAgeSeconds == maxAgeSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      visitorData,
      const DeepCollectionEquality().hash(_serviceTrackingParams),
      maxAgeSeconds);

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
  const factory _ResponseContext(
      {final String? visitorData,
      final List<ServiceTrackingParam>? serviceTrackingParams,
      final int? maxAgeSeconds}) = _$ResponseContextImpl;

  factory _ResponseContext.fromJson(Map<String, dynamic> json) =
      _$ResponseContextImpl.fromJson;

  @override
  String? get visitorData;
  @override
  List<ServiceTrackingParam>? get serviceTrackingParams;
  @override
  int? get maxAgeSeconds;
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
  const _$ServiceTrackingParamImpl({this.service, final List<Param>? params})
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
  const factory _ServiceTrackingParam(
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
  const _$ParamImpl({this.key, this.value});

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
  const factory _Param({final String? key, final String? value}) = _$ParamImpl;

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
