import 'package:pokepedia/data/datasources/pokemon_datasource.dart';
import 'package:pokepedia/data/repositories/pokemon_repository.dart';
import 'package:pokepedia/domain/pokemon.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _pokemonDatasource;

  PokemonRepositoryImpl({required PokemonDatasource pokemonDatasource})
      : _pokemonDatasource = pokemonDatasource;

  @override
  Future<List<Pokemon>> getPokemonList({int offset = 0, int limit = 3}) =>
      _pokemonDatasource.getPokemonList(offset: offset, limit: limit);

  @override
  Future<PokemonAbility> getPokemonAbilitiesDetails(int id) =>
      _pokemonDatasource.getPokemonAbilitiesDetails(id);
}
