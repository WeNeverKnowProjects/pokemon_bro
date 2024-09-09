import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/repository/pokemon_repository.dart';

@lazySingleton
class CatchPokemonUsecase implements Usecase<void, CatchPokemonParams> {
  final PokemonRepository repository;
  CatchPokemonUsecase(this.repository);

  @override
  Future<(Failure?, void)> call(CatchPokemonParams params) async {
    return repository.catchPokemon(params.uid, params.pokemon);
  }
}

class CatchPokemonParams {
  final String uid;
  final Pokemon pokemon;
  CatchPokemonParams(this.uid, this.pokemon);
}
