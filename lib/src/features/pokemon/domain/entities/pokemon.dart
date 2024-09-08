import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/src/core/constants/constants.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@Freezed()
class Pokemon with _$Pokemon {
  const Pokemon._();
  const factory Pokemon({
    final int? id,
    final String? name,
    final int? number, //dont know what field

    final int? level, //dont know what field
    final String? url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String get imageUrl => "$baseImageUrl/$id.png";
}
