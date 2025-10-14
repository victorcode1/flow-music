// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Client {
  String? get clientName;
  String? get clientVersion;
  String? get platform;
  String? get hl;
  String? get visitorData;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientCopyWith<Client> get copyWith =>
      _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Client &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, clientName, clientVersion, platform, hl, visitorData);

  @override
  String toString() {
    return 'Client(clientName: $clientName, clientVersion: $clientVersion, platform: $platform, hl: $hl, visitorData: $visitorData)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call(
      {String? clientName,
      String? clientVersion,
      String? platform,
      String? hl,
      String? visitorData});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res> implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = freezed,
    Object? clientVersion = freezed,
    Object? platform = freezed,
    Object? hl = freezed,
    Object? visitorData = freezed,
  }) {
    return _then(_self.copyWith(
      clientName: freezed == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVersion: freezed == clientVersion
          ? _self.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      hl: freezed == hl
          ? _self.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorData: freezed == visitorData
          ? _self.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Client value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Client value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Client value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? clientName, String? clientVersion,
            String? platform, String? hl, String? visitorData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.clientName, _that.clientVersion, _that.platform,
            _that.hl, _that.visitorData);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? clientName, String? clientVersion,
            String? platform, String? hl, String? visitorData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client():
        return $default(_that.clientName, _that.clientVersion, _that.platform,
            _that.hl, _that.visitorData);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? clientName, String? clientVersion,
            String? platform, String? hl, String? visitorData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Client() when $default != null:
        return $default(_that.clientName, _that.clientVersion, _that.platform,
            _that.hl, _that.visitorData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  _Client(
      {this.clientName,
      this.clientVersion,
      this.platform,
      this.hl,
      this.visitorData});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

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

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Client &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, clientName, clientVersion, platform, hl, visitorData);

  @override
  String toString() {
    return 'Client(clientName: $clientName, clientVersion: $clientVersion, platform: $platform, hl: $hl, visitorData: $visitorData)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
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
class __$ClientCopyWithImpl<$Res> implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientName = freezed,
    Object? clientVersion = freezed,
    Object? platform = freezed,
    Object? hl = freezed,
    Object? visitorData = freezed,
  }) {
    return _then(_Client(
      clientName: freezed == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVersion: freezed == clientVersion
          ? _self.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      hl: freezed == hl
          ? _self.hl
          : hl // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorData: freezed == visitorData
          ? _self.visitorData
          : visitorData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

ContextModel _$ContextModelFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$ContextModel {
  Client? get client;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<ContextModel> get copyWith =>
      _$ContextModelCopyWithImpl<ContextModel>(
          this as ContextModel, _$identity);

  /// Serializes this ContextModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContextModel &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, client);

  @override
  String toString() {
    return 'ContextModel(client: $client)';
  }
}

/// @nodoc
abstract mixin class $ContextModelCopyWith<$Res> {
  factory $ContextModelCopyWith(
          ContextModel value, $Res Function(ContextModel) _then) =
      _$ContextModelCopyWithImpl;
  @useResult
  $Res call({Client? client});

  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class _$ContextModelCopyWithImpl<$Res> implements $ContextModelCopyWith<$Res> {
  _$ContextModelCopyWithImpl(this._self, this._then);

  final ContextModel _self;
  final $Res Function(ContextModel) _then;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_self.copyWith(
      client: freezed == client
          ? _self.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
    ));
  }

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_self.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_self.client!, (value) {
      return _then(_self.copyWith(client: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContextModel].
extension ContextModelPatterns on ContextModel {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Context value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Context() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Context value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Context():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Context value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Context() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Client? client)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Context() when $default != null:
        return $default(_that.client);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Client? client) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Context():
        return $default(_that.client);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Client? client)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Context() when $default != null:
        return $default(_that.client);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Context implements ContextModel {
  _Context({this.client});
  factory _Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  @override
  final Client? client;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContextCopyWith<_Context> get copyWith =>
      __$ContextCopyWithImpl<_Context>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Context &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, client);

  @override
  String toString() {
    return 'ContextModel(client: $client)';
  }
}

/// @nodoc
abstract mixin class _$ContextCopyWith<$Res>
    implements $ContextModelCopyWith<$Res> {
  factory _$ContextCopyWith(_Context value, $Res Function(_Context) _then) =
      __$ContextCopyWithImpl;
  @override
  @useResult
  $Res call({Client? client});

  @override
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class __$ContextCopyWithImpl<$Res> implements _$ContextCopyWith<$Res> {
  __$ContextCopyWithImpl(this._self, this._then);

  final _Context _self;
  final $Res Function(_Context) _then;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? client = freezed,
  }) {
    return _then(_Context(
      client: freezed == client
          ? _self.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
    ));
  }

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_self.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_self.client!, (value) {
      return _then(_self.copyWith(client: value));
    });
  }
}

/// @nodoc
mixin _$QuerySearch {
  ContextModel? get context;
  String? get input;

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuerySearchCopyWith<QuerySearch> get copyWith =>
      _$QuerySearchCopyWithImpl<QuerySearch>(this as QuerySearch, _$identity);

  /// Serializes this QuerySearch to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuerySearch &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.input, input) || other.input == input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, context, input);

  @override
  String toString() {
    return 'QuerySearch(context: $context, input: $input)';
  }
}

/// @nodoc
abstract mixin class $QuerySearchCopyWith<$Res> {
  factory $QuerySearchCopyWith(
          QuerySearch value, $Res Function(QuerySearch) _then) =
      _$QuerySearchCopyWithImpl;
  @useResult
  $Res call({ContextModel? context, String? input});

  $ContextModelCopyWith<$Res>? get context;
}

/// @nodoc
class _$QuerySearchCopyWithImpl<$Res> implements $QuerySearchCopyWith<$Res> {
  _$QuerySearchCopyWithImpl(this._self, this._then);

  final QuerySearch _self;
  final $Res Function(QuerySearch) _then;

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? input = freezed,
  }) {
    return _then(_self.copyWith(
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $ContextModelCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }
}

/// Adds pattern-matching-related methods to [QuerySearch].
extension QuerySearchPatterns on QuerySearch {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QuerySearch value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuerySearch() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QuerySearch value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuerySearch():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QuerySearch value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuerySearch() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ContextModel? context, String? input)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuerySearch() when $default != null:
        return $default(_that.context, _that.input);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ContextModel? context, String? input) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuerySearch():
        return $default(_that.context, _that.input);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ContextModel? context, String? input)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuerySearch() when $default != null:
        return $default(_that.context, _that.input);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuerySearch implements QuerySearch {
  _QuerySearch({this.context, this.input});
  factory _QuerySearch.fromJson(Map<String, dynamic> json) =>
      _$QuerySearchFromJson(json);

  @override
  final ContextModel? context;
  @override
  final String? input;

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuerySearchCopyWith<_QuerySearch> get copyWith =>
      __$QuerySearchCopyWithImpl<_QuerySearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuerySearchToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuerySearch &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.input, input) || other.input == input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, context, input);

  @override
  String toString() {
    return 'QuerySearch(context: $context, input: $input)';
  }
}

/// @nodoc
abstract mixin class _$QuerySearchCopyWith<$Res>
    implements $QuerySearchCopyWith<$Res> {
  factory _$QuerySearchCopyWith(
          _QuerySearch value, $Res Function(_QuerySearch) _then) =
      __$QuerySearchCopyWithImpl;
  @override
  @useResult
  $Res call({ContextModel? context, String? input});

  @override
  $ContextModelCopyWith<$Res>? get context;
}

/// @nodoc
class __$QuerySearchCopyWithImpl<$Res> implements _$QuerySearchCopyWith<$Res> {
  __$QuerySearchCopyWithImpl(this._self, this._then);

  final _QuerySearch _self;
  final $Res Function(_QuerySearch) _then;

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = freezed,
    Object? input = freezed,
  }) {
    return _then(_QuerySearch(
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuerySearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $ContextModelCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }
}

// dart format on
