import 'package:equatable/equatable.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';
import 'package:pokepedia/domain/pokemon_type.dart';

import 'pokemon_stats.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonStats> stats;
  final List<PokemonType> types;
  final List<PokemonAbility> selectedAbilities;
  final List<PokemonAbility> abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
    this.selectedAbilities = const [],
    this.abilities = const [],
  });

  @override
  List<Object> get props =>
      [id, name, height, weight, stats, types, selectedAbilities, abilities];

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, height: $height, weight: $weight, stats: $stats, types: $types, selectedAbilities: $selectedAbilities, abilities: $abilities}';
  }

  Pokemon copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<PokemonStats>? stats,
    List<PokemonType>? types,
    List<PokemonAbility>? selectedAbilities,
    List<PokemonAbility>? abilities,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      selectedAbilities: selectedAbilities ?? this.selectedAbilities,
      abilities: abilities ?? this.abilities,
    );
  }
}
