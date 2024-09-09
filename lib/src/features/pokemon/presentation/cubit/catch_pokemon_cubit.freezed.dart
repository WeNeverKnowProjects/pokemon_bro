// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catch_pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CatchPokemonState {
  LoadState get catchState => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Pokemon? get pokemon => throw _privateConstructorUsedError;

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatchPokemonStateCopyWith<CatchPokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatchPokemonStateCopyWith<$Res> {
  factory $CatchPokemonStateCopyWith(
          CatchPokemonState value, $Res Function(CatchPokemonState) then) =
      _$CatchPokemonStateCopyWithImpl<$Res, CatchPokemonState>;
  @useResult
  $Res call({LoadState catchState, String? errorMessage, Pokemon? pokemon});

  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class _$CatchPokemonStateCopyWithImpl<$Res, $Val extends CatchPokemonState>
    implements $CatchPokemonStateCopyWith<$Res> {
  _$CatchPokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catchState = null,
    Object? errorMessage = freezed,
    Object? pokemon = freezed,
  }) {
    return _then(_value.copyWith(
      catchState: null == catchState
          ? _value.catchState
          : catchState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ) as $Val);
  }

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res>? get pokemon {
    if (_value.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_value.pokemon!, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatchPokemonStateImplCopyWith<$Res>
    implements $CatchPokemonStateCopyWith<$Res> {
  factory _$$CatchPokemonStateImplCopyWith(_$CatchPokemonStateImpl value,
          $Res Function(_$CatchPokemonStateImpl) then) =
      __$$CatchPokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadState catchState, String? errorMessage, Pokemon? pokemon});

  @override
  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class __$$CatchPokemonStateImplCopyWithImpl<$Res>
    extends _$CatchPokemonStateCopyWithImpl<$Res, _$CatchPokemonStateImpl>
    implements _$$CatchPokemonStateImplCopyWith<$Res> {
  __$$CatchPokemonStateImplCopyWithImpl(_$CatchPokemonStateImpl _value,
      $Res Function(_$CatchPokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catchState = null,
    Object? errorMessage = freezed,
    Object? pokemon = freezed,
  }) {
    return _then(_$CatchPokemonStateImpl(
      catchState: null == catchState
          ? _value.catchState
          : catchState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }
}

/// @nodoc

class _$CatchPokemonStateImpl extends _CatchPokemonState {
  const _$CatchPokemonStateImpl(
      {this.catchState = LoadState.initial, this.errorMessage, this.pokemon})
      : super._();

  @override
  @JsonKey()
  final LoadState catchState;
  @override
  final String? errorMessage;
  @override
  final Pokemon? pokemon;

  @override
  String toString() {
    return 'CatchPokemonState(catchState: $catchState, errorMessage: $errorMessage, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatchPokemonStateImpl &&
            (identical(other.catchState, catchState) ||
                other.catchState == catchState) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, catchState, errorMessage, pokemon);

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatchPokemonStateImplCopyWith<_$CatchPokemonStateImpl> get copyWith =>
      __$$CatchPokemonStateImplCopyWithImpl<_$CatchPokemonStateImpl>(
          this, _$identity);
}

abstract class _CatchPokemonState extends CatchPokemonState {
  const factory _CatchPokemonState(
      {final LoadState catchState,
      final String? errorMessage,
      final Pokemon? pokemon}) = _$CatchPokemonStateImpl;
  const _CatchPokemonState._() : super._();

  @override
  LoadState get catchState;
  @override
  String? get errorMessage;
  @override
  Pokemon? get pokemon;

  /// Create a copy of CatchPokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatchPokemonStateImplCopyWith<_$CatchPokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
