import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../../domain/pokemon.dart';
import '../../domain/pokemon_ability.dart';

part 'pokepedia_event.dart';

part 'pokepedia_state.dart';

class PokepediaBloc extends Bloc<PokepediaEvent, PokepediaState> {
  final PokemonRepository pokemonRepository;

  PokepediaBloc({required this.pokemonRepository})
      : super(const PokepediaState()) {
    on<PokepediaEvent>((event, emit) {
      if (event is PokepediaEventLoadPokemonAbilities) {
        emit(state.copyWith(pokemonAbilities: event.pokemonAbilities));
      }

      if (event is PokepediaEventLoadPokemonList) {
        emit(state.copyWith(pokemonList: event.pokemonList));
      }

      if (event is PokepediaEventSelectPokemonIndex) {
        emit(state.copyWith(pokemonIndexSelected: event.index));
      }

      if (event is PokepediaEventLoadingData) {
        emit(state.copyWith(isLoading: event.isLoading));
      }
    });

    loadPokemonList();
  }

  Future<void> loadPokemonList() async {
    add(PokepediaEventLoadingData(true));
    final pokemonList = await pokemonRepository.getPokemonList(
        limit: state.limit, offset: state.offset);
    if (state.pokemonAbilities
        .every((element) => element.description.isEmpty)) {
      await loadPokemonAbilities();
    }
    await Future.delayed(const Duration(milliseconds: 500));
    final pokemonAbilities = state.pokemonAbilities;
    final pokemonListWithAbilities = pokemonList
        .map((pokemon) => pokemon.copyWith(abilities: pokemonAbilities))
        .toList();
    add(PokepediaEventLoadPokemonList(pokemonListWithAbilities));
    add(PokepediaEventLoadingData(false));
  }

  Future<void> loadPokemonAbilities() async {
    final pokemonAbilities = await Future.wait(state.pokemonAbilities.map(
        (ability) => pokemonRepository.getPokemonAbilitiesDetails(ability.id)));
    add(PokepediaEventLoadPokemonAbilities(pokemonAbilities));
  }

  void onPokemonSelected(int index) {
    add(PokepediaEventSelectPokemonIndex(index));
  }

  void onAbilitySelected(PokemonAbility ability) {
    final currentPokemon = state.pokemonList[state.pokemonIndexSelected];
    final newAbilities = [...currentPokemon.selectedAbilities];

    if (newAbilities.contains(ability)) {
      newAbilities.remove(ability);
    } else if (newAbilities.length < 2) {
      newAbilities.add(ability);
    } else {
      return;
    }

    Pokemon newPokemon =
        currentPokemon.copyWith(selectedAbilities: newAbilities);
    final newStats = newPokemon.recalculateStats();

    newPokemon = newPokemon.copyWith(currentStats: newStats);
    final newPokemonList = [...state.pokemonList];
    newPokemonList[state.pokemonIndexSelected] = newPokemon;
    add(PokepediaEventLoadPokemonList(newPokemonList));
  }
}
