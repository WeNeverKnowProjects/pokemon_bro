import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/repository/pokemon_repository.dart';

@lazySingleton
class FetchPokemonsUsecase implements Usecase<List<Pokemon>?, String> {
  final PokemonRepository repository;
  FetchPokemonsUsecase(this.repository);
  @override
  Future<(Failure?, List<Pokemon>?)> call(String url) async {
    return repository.fetchPokemons(url);
  }
}
