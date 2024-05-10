import 'package:equatable/equatable.dart';

class PokemonStats extends Equatable {
  final int baseStat;
  final String name;
  final String url;

  const PokemonStats(
      {required this.baseStat, required this.name, required this.url});


  @override
  String toString() {
    return 'PokemonStats{baseStat: $baseStat, name: $name, url: $url}';
  }

  @override
  List<Object> get props => [baseStat, name, url];

  PokemonStats copyWith({
    int? baseStat,
    String? name,
    String? url,
  }) {
    return PokemonStats(
      baseStat: baseStat ?? this.baseStat,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}

extension PokemonStatsMapper on PokemonStats {
  PokemonStats toSpanish() {
    String spanishName = "";
    switch (name) {
      case "hp":
        spanishName = "Vida";
        break;
      case "attack":
        spanishName = "Ataque";
        break;
      case "defense":
        spanishName = "Defensa";
        break;
      case "speed":
        spanishName = "Velocidad";
        break;
    }

    return PokemonStats(
      baseStat: baseStat,
      name: spanishName,
      url: url,
    );
  }
}

