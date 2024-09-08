// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_validation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthValidationState {
  LoginValidation? get loginValidation => throw _privateConstructorUsedError;
  LoginFormatValidation? get loginFormatValidation =>
      throw _privateConstructorUsedError;
  SignUpValidation? get signUpValidation => throw _privateConstructorUsedError;
  SignUpFormatValidation? get signUpFormatValidation =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthValidationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthValidationStateCopyWith<AuthValidationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValidationStateCopyWith<$Res> {
  factory $AuthValidationStateCopyWith(
          AuthValidationState value, $Res Function(AuthValidationState) then) =
      _$AuthValidationStateCopyWithImpl<$Res, AuthValidationState>;
  @useResult
  $Res call(
      {LoginValidation? loginValidation,
      LoginFormatValidation? loginFormatValidation,
      SignUpValidation? signUpValidation,
      SignUpFormatValidation? signUpFormatValidation});
}

/// @nodoc
class _$AuthValidationStateCopyWithImpl<$Res, $Val extends AuthValidationState>
    implements $AuthValidationStateCopyWith<$Res> {
  _$AuthValidationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthValidationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginValidation = freezed,
    Object? loginFormatValidation = freezed,
    Object? signUpValidation = freezed,
    Object? signUpFormatValidation = freezed,
  }) {
    return _then(_value.copyWith(
      loginValidation: freezed == loginValidation
          ? _value.loginValidation
          : loginValidation // ignore: cast_nullable_to_non_nullable
              as LoginValidation?,
      loginFormatValidation: freezed == loginFormatValidation
          ? _value.loginFormatValidation
          : loginFormatValidation // ignore: cast_nullable_to_non_nullable
              as LoginFormatValidation?,
      signUpValidation: freezed == signUpValidation
          ? _value.signUpValidation
          : signUpValidation // ignore: cast_nullable_to_non_nullable
              as SignUpValidation?,
      signUpFormatValidation: freezed == signUpFormatValidation
          ? _value.signUpFormatValidation
          : signUpFormatValidation // ignore: cast_nullable_to_non_nullable
              as SignUpFormatValidation?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthValidationStateImplCopyWith<$Res>
    implements $AuthValidationStateCopyWith<$Res> {
  factory _$$AuthValidationStateImplCopyWith(_$AuthValidationStateImpl value,
          $Res Function(_$AuthValidationStateImpl) then) =
      __$$AuthValidationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginValidation? loginValidation,
      LoginFormatValidation? loginFormatValidation,
      SignUpValidation? signUpValidation,
      SignUpFormatValidation? signUpFormatValidation});
}

/// @nodoc
class __$$AuthValidationStateImplCopyWithImpl<$Res>
    extends _$AuthValidationStateCopyWithImpl<$Res, _$AuthValidationStateImpl>
    implements _$$AuthValidationStateImplCopyWith<$Res> {
  __$$AuthValidationStateImplCopyWithImpl(_$AuthValidationStateImpl _value,
      $Res Function(_$AuthValidationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthValidationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginValidation = freezed,
    Object? loginFormatValidation = freezed,
    Object? signUpValidation = freezed,
    Object? signUpFormatValidation = freezed,
  }) {
    return _then(_$AuthValidationStateImpl(
      loginValidation: freezed == loginValidation
          ? _value.loginValidation
          : loginValidation // ignore: cast_nullable_to_non_nullable
              as LoginValidation?,
      loginFormatValidation: freezed == loginFormatValidation
          ? _value.loginFormatValidation
          : loginFormatValidation // ignore: cast_nullable_to_non_nullable
              as LoginFormatValidation?,
      signUpValidation: freezed == signUpValidation
          ? _value.signUpValidation
          : signUpValidation // ignore: cast_nullable_to_non_nullable
              as SignUpValidation?,
      signUpFormatValidation: freezed == signUpFormatValidation
          ? _value.signUpFormatValidation
          : signUpFormatValidation // ignore: cast_nullable_to_non_nullable
              as SignUpFormatValidation?,
    ));
  }
}

/// @nodoc

class _$AuthValidationStateImpl extends _AuthValidationState {
  const _$AuthValidationStateImpl(
      {this.loginValidation,
      this.loginFormatValidation,
      this.signUpValidation,
      this.signUpFormatValidation})
      : super._();

  @override
  final LoginValidation? loginValidation;
  @override
  final LoginFormatValidation? loginFormatValidation;
  @override
  final SignUpValidation? signUpValidation;
  @override
  final SignUpFormatValidation? signUpFormatValidation;

  @override
  String toString() {
    return 'AuthValidationState(loginValidation: $loginValidation, loginFormatValidation: $loginFormatValidation, signUpValidation: $signUpValidation, signUpFormatValidation: $signUpFormatValidation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthValidationStateImpl &&
            (identical(other.loginValidation, loginValidation) ||
                other.loginValidation == loginValidation) &&
            (identical(other.loginFormatValidation, loginFormatValidation) ||
                other.loginFormatValidation == loginFormatValidation) &&
            (identical(other.signUpValidation, signUpValidation) ||
                other.signUpValidation == signUpValidation) &&
            (identical(other.signUpFormatValidation, signUpFormatValidation) ||
                other.signUpFormatValidation == signUpFormatValidation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginValidation,
      loginFormatValidation, signUpValidation, signUpFormatValidation);

  /// Create a copy of AuthValidationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthValidationStateImplCopyWith<_$AuthValidationStateImpl> get copyWith =>
      __$$AuthValidationStateImplCopyWithImpl<_$AuthValidationStateImpl>(
          this, _$identity);
}

abstract class _AuthValidationState extends AuthValidationState {
  const factory _AuthValidationState(
          {final LoginValidation? loginValidation,
          final LoginFormatValidation? loginFormatValidation,
          final SignUpValidation? signUpValidation,
          final SignUpFormatValidation? signUpFormatValidation}) =
      _$AuthValidationStateImpl;
  const _AuthValidationState._() : super._();

  @override
  LoginValidation? get loginValidation;
  @override
  LoginFormatValidation? get loginFormatValidation;
  @override
  SignUpValidation? get signUpValidation;
  @override
  SignUpFormatValidation? get signUpFormatValidation;

  /// Create a copy of AuthValidationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthValidationStateImplCopyWith<_$AuthValidationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
