// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: (json['number'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'level': instance.level,
      'url': instance.url,
    };
