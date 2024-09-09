import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<(Failure?, List<Pokemon>?)> fetchPokemons(String url);
  Future<(Failure?, void)> catchPokemon(String memberId, Pokemon pokemon);
}
