// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  String? get uid => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError; //dont know what field
  int? get level => throw _privateConstructorUsedError; //dont know what field
  String? get url =>
      throw _privateConstructorUsedError; //ignore: invalid_annotation_target
  @JsonKey(name: "min_level")
  int? get minLevel =>
      throw _privateConstructorUsedError; //ignore: invalid_annotation_target
  @JsonKey(name: "max_level")
  int? get maxLevel => throw _privateConstructorUsedError;
  int? get chance => throw _privateConstructorUsedError;

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call(
      {String? uid,
      int? id,
      String? name,
      int? number,
      int? level,
      String? url,
      @JsonKey(name: "min_level") int? minLevel,
      @JsonKey(name: "max_level") int? maxLevel,
      int? chance});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? level = freezed,
    Object? url = freezed,
    Object? minLevel = freezed,
    Object? maxLevel = freezed,
    Object? chance = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      minLevel: freezed == minLevel
          ? _value.minLevel
          : minLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLevel: freezed == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      chance: freezed == chance
          ? _value.chance
          : chance // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
          _$PokemonImpl value, $Res Function(_$PokemonImpl) then) =
      __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      int? id,
      String? name,
      int? number,
      int? level,
      String? url,
      @JsonKey(name: "min_level") int? minLevel,
      @JsonKey(name: "max_level") int? maxLevel,
      int? chance});
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
      _$PokemonImpl _value, $Res Function(_$PokemonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? level = freezed,
    Object? url = freezed,
    Object? minLevel = freezed,
    Object? maxLevel = freezed,
    Object? chance = freezed,
  }) {
    return _then(_$PokemonImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      minLevel: freezed == minLevel
          ? _value.minLevel
          : minLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLevel: freezed == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      chance: freezed == chance
          ? _value.chance
          : chance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl extends _Pokemon {
  const _$PokemonImpl(
      {this.uid,
      this.id,
      this.name,
      this.number,
      this.level,
      this.url,
      @JsonKey(name: "min_level") this.minLevel,
      @JsonKey(name: "max_level") this.maxLevel,
      this.chance})
      : super._();

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  @override
  final String? uid;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? number;
//dont know what field
  @override
  final int? level;
//dont know what field
  @override
  final String? url;
//ignore: invalid_annotation_target
  @override
  @JsonKey(name: "min_level")
  final int? minLevel;
//ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  final int? maxLevel;
  @override
  final int? chance;

  @override
  String toString() {
    return 'Pokemon(uid: $uid, id: $id, name: $name, number: $number, level: $level, url: $url, minLevel: $minLevel, maxLevel: $maxLevel, chance: $chance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.minLevel, minLevel) ||
                other.minLevel == minLevel) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.chance, chance) || other.chance == chance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, id, name, number, level,
      url, minLevel, maxLevel, chance);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(
      this,
    );
  }
}

abstract class _Pokemon extends Pokemon {
  const factory _Pokemon(
      {final String? uid,
      final int? id,
      final String? name,
      final int? number,
      final int? level,
      final String? url,
      @JsonKey(name: "min_level") final int? minLevel,
      @JsonKey(name: "max_level") final int? maxLevel,
      final int? chance}) = _$PokemonImpl;
  const _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  String? get uid;
  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get number; //dont know what field
  @override
  int? get level; //dont know what field
  @override
  String? get url; //ignore: invalid_annotation_target
  @override
  @JsonKey(name: "min_level")
  int? get minLevel; //ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  int? get maxLevel;
  @override
  int? get chance;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
