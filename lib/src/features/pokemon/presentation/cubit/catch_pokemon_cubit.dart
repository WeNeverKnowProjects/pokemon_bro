import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/usecase/catch_pokemon_usecase.dart';

part 'catch_pokemon_state.dart';
part 'catch_pokemon_cubit.freezed.dart';

@lazySingleton
class CatchPokemonCubit extends Cubit<CatchPokemonState> {
  CatchPokemonCubit(this._catchPokemonUsecase)
      : super(const CatchPokemonState());
  final CatchPokemonUsecase _catchPokemonUsecase;

  catchPokemon(Member member, Pokemon pokemon) async {
    emit(state.copyWith(
      catchState: LoadState.loading,
    ));
    if ((member.numbers ?? 0) >= (member.pokeball ?? 20)) {
      emit(state.copyWith(
        catchState: LoadState.failed,
        errorMessage: "Pokeball is full.",
      ));
      return;
    }

    final (fail, result) =
        await _catchPokemonUsecase(CatchPokemonParams(member.uid!, pokemon));
    if (fail != null) {
      emit(state.copyWith(
        catchState: LoadState.failed,
        errorMessage: fail.message,
      ));
    } else {
      emit(state.copyWith(
        catchState: LoadState.success,
        pokemon: pokemon,
      ));
    }
  }
}
