part of 'pokepedia_bloc.dart';

abstract class PokepediaEvent {}

class PokepediaEventLoadPokemonAbilities extends PokepediaEvent {
  final List<PokemonAbility> pokemonAbilities;
  PokepediaEventLoadPokemonAbilities(this.pokemonAbilities);
}

class PokepediaEventLoadPokemonList extends PokepediaEvent {
  final List<Pokemon> pokemonList;
  PokepediaEventLoadPokemonList(this.pokemonList);
}

class PokepediaEventSelectPokemonIndex extends PokepediaEvent {
  final int index;
  PokepediaEventSelectPokemonIndex(this.index);
}

class PokepediaEventLoadingData extends PokepediaEvent {
  final bool isLoading;
  PokepediaEventLoadingData(this.isLoading);
}
