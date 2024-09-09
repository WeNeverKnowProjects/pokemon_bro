// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      uid: json['uid'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: (json['number'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      url: json['url'] as String?,
      minLevel: (json['min_level'] as num?)?.toInt(),
      maxLevel: (json['max_level'] as num?)?.toInt(),
      chance: (json['chance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'level': instance.level,
      'url': instance.url,
      'min_level': instance.minLevel,
      'max_level': instance.maxLevel,
      'chance': instance.chance,
    };
