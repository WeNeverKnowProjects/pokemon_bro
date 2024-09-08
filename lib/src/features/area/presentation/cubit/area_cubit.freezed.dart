// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AreaState {
  LoadState? get state => throw _privateConstructorUsedError;
  List<Area>? get areas => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AreaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaStateCopyWith<AreaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaStateCopyWith<$Res> {
  factory $AreaStateCopyWith(AreaState value, $Res Function(AreaState) then) =
      _$AreaStateCopyWithImpl<$Res, AreaState>;
  @useResult
  $Res call({LoadState? state, List<Area>? areas, String? errorMessage});
}

/// @nodoc
class _$AreaStateCopyWithImpl<$Res, $Val extends AreaState>
    implements $AreaStateCopyWith<$Res> {
  _$AreaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? areas = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LoadState?,
      areas: freezed == areas
          ? _value.areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<Area>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AreaStateImplCopyWith<$Res>
    implements $AreaStateCopyWith<$Res> {
  factory _$$AreaStateImplCopyWith(
          _$AreaStateImpl value, $Res Function(_$AreaStateImpl) then) =
      __$$AreaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadState? state, List<Area>? areas, String? errorMessage});
}

/// @nodoc
class __$$AreaStateImplCopyWithImpl<$Res>
    extends _$AreaStateCopyWithImpl<$Res, _$AreaStateImpl>
    implements _$$AreaStateImplCopyWith<$Res> {
  __$$AreaStateImplCopyWithImpl(
      _$AreaStateImpl _value, $Res Function(_$AreaStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AreaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? areas = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AreaStateImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LoadState?,
      areas: freezed == areas
          ? _value._areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<Area>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AreaStateImpl extends _AreaState {
  const _$AreaStateImpl(
      {this.state = LoadState.initial,
      final List<Area>? areas,
      this.errorMessage})
      : _areas = areas,
        super._();

  @override
  @JsonKey()
  final LoadState? state;
  final List<Area>? _areas;
  @override
  List<Area>? get areas {
    final value = _areas;
    if (value == null) return null;
    if (_areas is EqualUnmodifiableListView) return _areas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AreaState(state: $state, areas: $areas, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._areas, _areas) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_areas), errorMessage);

  /// Create a copy of AreaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaStateImplCopyWith<_$AreaStateImpl> get copyWith =>
      __$$AreaStateImplCopyWithImpl<_$AreaStateImpl>(this, _$identity);
}

abstract class _AreaState extends AreaState {
  const factory _AreaState(
      {final LoadState? state,
      final List<Area>? areas,
      final String? errorMessage}) = _$AreaStateImpl;
  const _AreaState._() : super._();

  @override
  LoadState? get state;
  @override
  List<Area>? get areas;
  @override
  String? get errorMessage;

  /// Create a copy of AreaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaStateImplCopyWith<_$AreaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
