// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get pokeball => throw _privateConstructorUsedError;
  int? get numbers => throw _privateConstructorUsedError; //numbers of pokemon
// ignore: invalid_annotation_target
  @JsonKey(name: "login_at")
  DateTime? get loginAt => throw _privateConstructorUsedError;
  List<Pokemon>? get pokemons => throw _privateConstructorUsedError;

  /// Serializes this Member to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {String? uid,
      String? email,
      int? pokeball,
      int? numbers,
      @JsonKey(name: "login_at") DateTime? loginAt,
      List<Pokemon>? pokemons});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? pokeball = freezed,
    Object? numbers = freezed,
    Object? loginAt = freezed,
    Object? pokemons = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pokeball: freezed == pokeball
          ? _value.pokeball
          : pokeball // ignore: cast_nullable_to_non_nullable
              as int?,
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as int?,
      loginAt: freezed == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pokemons: freezed == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? email,
      int? pokeball,
      int? numbers,
      @JsonKey(name: "login_at") DateTime? loginAt,
      List<Pokemon>? pokemons});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? pokeball = freezed,
    Object? numbers = freezed,
    Object? loginAt = freezed,
    Object? pokemons = freezed,
  }) {
    return _then(_$MemberImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pokeball: freezed == pokeball
          ? _value.pokeball
          : pokeball // ignore: cast_nullable_to_non_nullable
              as int?,
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as int?,
      loginAt: freezed == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pokemons: freezed == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl extends _Member {
  const _$MemberImpl(
      {this.uid,
      this.email,
      this.pokeball,
      this.numbers,
      @JsonKey(name: "login_at") this.loginAt,
      final List<Pokemon>? pokemons})
      : _pokemons = pokemons,
        super._();

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? email;
  @override
  final int? pokeball;
  @override
  final int? numbers;
//numbers of pokemon
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "login_at")
  final DateTime? loginAt;
  final List<Pokemon>? _pokemons;
  @override
  List<Pokemon>? get pokemons {
    final value = _pokemons;
    if (value == null) return null;
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Member(uid: $uid, email: $email, pokeball: $pokeball, numbers: $numbers, loginAt: $loginAt, pokemons: $pokemons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pokeball, pokeball) ||
                other.pokeball == pokeball) &&
            (identical(other.numbers, numbers) || other.numbers == numbers) &&
            (identical(other.loginAt, loginAt) || other.loginAt == loginAt) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, pokeball, numbers,
      loginAt, const DeepCollectionEquality().hash(_pokemons));

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member extends Member {
  const factory _Member(
      {final String? uid,
      final String? email,
      final int? pokeball,
      final int? numbers,
      @JsonKey(name: "login_at") final DateTime? loginAt,
      final List<Pokemon>? pokemons}) = _$MemberImpl;
  const _Member._() : super._();

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get email;
  @override
  int? get pokeball;
  @override
  int? get numbers; //numbers of pokemon
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "login_at")
  DateTime? get loginAt;
  @override
  List<Pokemon>? get pokemons;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
