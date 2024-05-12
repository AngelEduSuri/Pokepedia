import 'package:pokepedia/data/datasources/pokemon_datasource.dart';
import 'package:pokepedia/data/models/mappers/poke_api_response_mapper.dart';
import 'package:pokepedia/data/models/poke_api_details_response.dart';
import 'package:pokepedia/data/service/api_service.dart';
import 'package:pokepedia/domain/pokemon.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';

import '../models/poke_api_response.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  @override
  Future<List<Pokemon>> getPokemonList({int offset = 0, int limit = 3}) async {
    final response =
        await ApiService.getApi().get("pokemon?offset=$offset&limit=$limit");

    final pokeApiResponse = PokeApiResponse.fromJson(response.data);
    final pokemonListUrl = pokeApiResponse.results.map((e) => e.url).toList();

    final pokemonDetails = await Future.wait(
      pokemonListUrl.map((url) => _getPokemonDetails(url)),
    );

    return pokemonDetails.map((e) => e.toPokemonDomain()).toList();
  }

  Future<PokeApiDetailsResponse> _getPokemonDetails(String url) async {
    final response = await ApiService.getApi().get(url);
    return PokeApiDetailsResponse.fromJson(response.data);
  }

  @override
  Future<PokemonAbility> getPokemonAbilitiesDetails(int id) async {
    final response = await ApiService.getApi().get("ability/$id");

    final text = _getSpanishFlavorText(response.data);
    final int abilityId = response.data['id'];
    final ability =
        staticAbilities.firstWhere((element) => element.id == abilityId);
    return ability.copyWith(description: text);
  }

  String _getSpanishFlavorText(Map<String, dynamic> abilityData) {
    String spanishDescription = "";

    for (var entry in abilityData['flavor_text_entries']) {
      if (entry['language']['name'] == 'es') {
        return entry['flavor_text'];
      }
    }
    return spanishDescription;
  }
}
