import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/usecase/fetch_pokemons_usecase.dart';

part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

@lazySingleton
class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._fetchPokemonsUsecase) : super(const PokemonState());
  final FetchPokemonsUsecase _fetchPokemonsUsecase;

  fetch(String url) async {
    emit(state.copyWith(
      errorMessage: null,
      pokemons: null,
      state: LoadState.loading,
    ));

    final (fail, items) = await _fetchPokemonsUsecase(url);
    if (fail != null) {
      emit(state.copyWith(
        errorMessage: fail.message,
        state: LoadState.failed,
      ));
    } else {
      emit(state.copyWith(
        state: LoadState.success,
        pokemons: items,
      ));
    }
  }
}
