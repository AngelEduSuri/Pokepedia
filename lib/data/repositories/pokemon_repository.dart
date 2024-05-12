
import '../../domain/pokemon.dart';
import '../../domain/pokemon_ability.dart';

abstract class PokemonRepository {

  Future<List<Pokemon>> getPokemonList({int offset = 0, int limit = 3});

  Future<PokemonAbility> getPokemonAbilitiesDetails(int id);
}