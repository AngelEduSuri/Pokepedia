import 'package:equatable/equatable.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';
import 'package:pokepedia/domain/pokemon_type.dart';

import 'pokemon_stats.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String imageUrl;
  final List<PokemonStats> baseStats;
  final List<PokemonStats> currentStats;
  final List<PokemonType> types;
  final List<PokemonAbility> selectedAbilities;
  final List<PokemonAbility> abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.baseStats,
    required this.currentStats,
    required this.types,
    this.selectedAbilities = const [],
    this.abilities = const [],
  });

  @override
  List<Object> get props => [
        id,
        name,
        height,
        weight,
        imageUrl,
        baseStats,
        currentStats,
        types,
        selectedAbilities,
        abilities
      ];


  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, height: $height, weight: $weight, imageUrl: $imageUrl, baseStats: $baseStats, currentStats: $currentStats, types: $types, selectedAbilities: $selectedAbilities, abilities: $abilities}';
  }

  List<PokemonStats> recalculateStats() {
    List<PokemonStats> newStats = baseStats.map((stat) => stat.copyWith()).toList();

    for (var ability in selectedAbilities) {
      final hpIndex = newStats.indexWhere((stat) => stat.name == 'hp');
      final attackIndex = newStats.indexWhere((stat) => stat.name == 'attack');
      final defenseIndex = newStats.indexWhere((stat) => stat.name == 'defense');
      final speedIndex = newStats.indexWhere((stat) => stat.name == 'speed');

      newStats[hpIndex] = newStats[hpIndex].copyWith(baseStat: newStats[hpIndex].baseStat + ability.buffHp);
      newStats[attackIndex] = newStats[attackIndex].copyWith(baseStat: newStats[attackIndex].baseStat + ability.buffAttack);
      newStats[defenseIndex] = newStats[defenseIndex].copyWith(baseStat: newStats[defenseIndex].baseStat + ability.buffDefense);
      newStats[speedIndex] = newStats[speedIndex].copyWith(baseStat: newStats[speedIndex].baseStat + ability.buffSpeed);
    }

    return newStats;
  }

  Pokemon copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    String? imageUrl,
    List<PokemonStats>? baseStats,
    List<PokemonStats> ? currentStats,
    List<PokemonType>? types,
    List<PokemonAbility>? selectedAbilities,
    List<PokemonAbility>? abilities,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      imageUrl: this.imageUrl,
      baseStats: baseStats ?? this.baseStats,
      currentStats: currentStats ?? this.currentStats,
      types: types ?? this.types,
      selectedAbilities: selectedAbilities ?? this.selectedAbilities,
      abilities: abilities ?? this.abilities,
    );
  }
}
