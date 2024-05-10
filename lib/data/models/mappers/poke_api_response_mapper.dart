import 'package:pokepedia/domain/pokemon.dart';
import 'package:pokepedia/domain/pokemon_stats.dart';

import '../../../domain/pokemon_type.dart';
import '../poke_api_details_response.dart';

extension PokeApiDetailsResponseMapper on PokeApiDetailsResponse {
  Pokemon toPokemonDomain() => Pokemon(
        id: id,
        name: name,
        height: height,
        weight: weight,
        stats: stats
            .where((element) =>
                element.stat.name != "special-attack" &&
                element.stat.name != "special-defense")
            .map((e) => PokemonStats(
                    baseStat: e.baseStat, name: e.stat.name, url: e.stat.url))
            .toList(),
        types: types
            .map((e) => PokemonType(
                  name: e.type.name,
                  url: e.type.url,
                  slot: e.slot,
                ))
            .toList(),
      );
}

