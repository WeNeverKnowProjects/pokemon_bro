part of 'catch_pokemon_cubit.dart';

@freezed
class CatchPokemonState with _$CatchPokemonState {
  const CatchPokemonState._();
  const factory CatchPokemonState({
    @Default(LoadState.initial) final LoadState catchState,
    final String? errorMessage,
    final Pokemon? pokemon,
  }) = _CatchPokemonState;
}
