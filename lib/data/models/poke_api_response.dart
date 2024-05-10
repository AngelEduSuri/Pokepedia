class PokeApiResponse {
  final int count;
  final String next;
  final String previous;
  final List<PokemonApi> results;

  PokeApiResponse(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory PokeApiResponse.fromJson(Map<String, dynamic> json) {
    final results = List<PokemonApi>.from(json["results"].map(
        (pokemon) => PokemonApi(name: pokemon["name"], url: pokemon["url"])));
    return PokeApiResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"] ?? "",
        results: results);
  }
}

class PokemonApi {
  final String name;
  final String url;

  PokemonApi({required this.name, required this.url});
}
