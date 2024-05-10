import 'package:equatable/equatable.dart';
import 'package:pokepedia/domain/pokemon_type.dart';

import 'pokemon_stats.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonStats> stats;
  final List<PokemonType> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
  });

  @override
  List<Object> get props => [id, name, height, weight, stats, types];

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, height: $height, weight: $weight, stats: $stats, types: $types}';
  }
}
