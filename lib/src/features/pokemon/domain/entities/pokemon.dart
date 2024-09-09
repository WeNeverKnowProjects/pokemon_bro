import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/src/core/constants/constants.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@Freezed()
class Pokemon with _$Pokemon {
  const Pokemon._();
  const factory Pokemon({
    final String? uid,
    final int? id,
    final String? name,
    final int? number, //dont know what field

    final int? level, //dont know what field
    final String? url,
    //ignore: invalid_annotation_target
    @JsonKey(name: "min_level") final int? minLevel,
    //ignore: invalid_annotation_target
    @JsonKey(name: "max_level") final int? maxLevel,
    final int? chance,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String get imageUrl => "$baseImageUrl/$id.png";
}
