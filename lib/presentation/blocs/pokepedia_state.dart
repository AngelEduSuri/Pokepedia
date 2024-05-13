part of 'pokepedia_bloc.dart';

class PokepediaState extends Equatable {
  final List<Pokemon> pokemonList;
  final List<PokemonAbility> pokemonAbilities;
  final int pokemonIndexSelected;
  final int offset;
  final int limit;
  final bool isLoading;

  const PokepediaState({
    this.pokemonList = const [],
    this.pokemonAbilities = staticAbilities,
    this.pokemonIndexSelected = 0,
    this.offset = 0,
    this.limit = 3,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [
        pokemonList,
        pokemonAbilities,
        pokemonIndexSelected,
        offset,
        limit,
        isLoading
      ];

  PokepediaState copyWith({
    List<Pokemon>? pokemonList,
    List<PokemonAbility>? pokemonAbilities,
    List<PokemonAbility>? selectedPokemonAbilities,
    int? pokemonIndexSelected,
    int? offset,
    int? limit,
    bool? isLoading,
  }) {
    return PokepediaState(
      pokemonList: pokemonList ?? this.pokemonList,
      pokemonAbilities: pokemonAbilities ?? this.pokemonAbilities,
      pokemonIndexSelected: pokemonIndexSelected ?? this.pokemonIndexSelected,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'PokepediaState{pokemonList: $pokemonList, pokemonAbilities: $pokemonAbilities, selectedPokemonIndex: $pokemonIndexSelected, offset: $offset, limit: $limit, isLoading: $isLoading}';
  }
}
