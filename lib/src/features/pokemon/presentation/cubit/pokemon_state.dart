part of 'pokemon_cubit.dart';

@Freezed()
class PokemonState with _$PokemonState {
  const PokemonState._();
  const factory PokemonState({
    final List<Pokemon>? pokemons,
    @Default(LoadState.initial) final LoadState state,
    final String? errorMessage,
  }) = _PokemonState;
}
