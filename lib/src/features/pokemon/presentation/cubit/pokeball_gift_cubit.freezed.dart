// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokeball_gift_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokeballGiftState {
  TimerState get timerState => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Create a copy of PokeballGiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeballGiftStateCopyWith<PokeballGiftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeballGiftStateCopyWith<$Res> {
  factory $PokeballGiftStateCopyWith(
          PokeballGiftState value, $Res Function(PokeballGiftState) then) =
      _$PokeballGiftStateCopyWithImpl<$Res, PokeballGiftState>;
  @useResult
  $Res call({TimerState timerState, String? email});
}

/// @nodoc
class _$PokeballGiftStateCopyWithImpl<$Res, $Val extends PokeballGiftState>
    implements $PokeballGiftStateCopyWith<$Res> {
  _$PokeballGiftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeballGiftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerState = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokeballGiftStateImplCopyWith<$Res>
    implements $PokeballGiftStateCopyWith<$Res> {
  factory _$$PokeballGiftStateImplCopyWith(_$PokeballGiftStateImpl value,
          $Res Function(_$PokeballGiftStateImpl) then) =
      __$$PokeballGiftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerState timerState, String? email});
}

/// @nodoc
class __$$PokeballGiftStateImplCopyWithImpl<$Res>
    extends _$PokeballGiftStateCopyWithImpl<$Res, _$PokeballGiftStateImpl>
    implements _$$PokeballGiftStateImplCopyWith<$Res> {
  __$$PokeballGiftStateImplCopyWithImpl(_$PokeballGiftStateImpl _value,
      $Res Function(_$PokeballGiftStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeballGiftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerState = null,
    Object? email = freezed,
  }) {
    return _then(_$PokeballGiftStateImpl(
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PokeballGiftStateImpl extends _PokeballGiftState {
  const _$PokeballGiftStateImpl(
      {this.timerState = TimerState.initial, this.email})
      : super._();

  @override
  @JsonKey()
  final TimerState timerState;
  @override
  final String? email;

  @override
  String toString() {
    return 'PokeballGiftState(timerState: $timerState, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeballGiftStateImpl &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerState, email);

  /// Create a copy of PokeballGiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeballGiftStateImplCopyWith<_$PokeballGiftStateImpl> get copyWith =>
      __$$PokeballGiftStateImplCopyWithImpl<_$PokeballGiftStateImpl>(
          this, _$identity);
}

abstract class _PokeballGiftState extends PokeballGiftState {
  const factory _PokeballGiftState(
      {final TimerState timerState,
      final String? email}) = _$PokeballGiftStateImpl;
  const _PokeballGiftState._() : super._();

  @override
  TimerState get timerState;
  @override
  String? get email;

  /// Create a copy of PokeballGiftState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeballGiftStateImplCopyWith<_$PokeballGiftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
