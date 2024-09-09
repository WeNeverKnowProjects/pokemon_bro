// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      pokeball: (json['pokeball'] as num?)?.toInt(),
      numbers: (json['numbers'] as num?)?.toInt(),
      loginAt: json['login_at'] == null
          ? null
          : DateTime.parse(json['login_at'] as String),
      pokemons: (json['pokemons'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'pokeball': instance.pokeball,
      'numbers': instance.numbers,
      'login_at': instance.loginAt?.toIso8601String(),
      'pokemons': instance.pokemons,
    };
