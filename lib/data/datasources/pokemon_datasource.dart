
import 'package:pokepedia/domain/pokemon.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';

abstract class PokemonDatasource {

  Future<List<Pokemon>> getPokemonList({int offset = 0, int limit = 3});
  
  Future<PokemonAbility> getPokemonAbilitiesDetails(int id);
}