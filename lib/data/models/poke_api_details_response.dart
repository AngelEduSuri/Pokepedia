
class PokeApiDetailsResponse {

  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final String imageUrl;
  final List<StatsResponse> stats;
  final List<TypesResponse> types;

  PokeApiDetailsResponse({required this.id, required this.name, required this.baseExperience, required this.height, required this.weight, required this.imageUrl, required this.stats, required this.types});

  @override
  String toString() {
    return 'PokeApiDetailsResponse{id: $id, name: $name, baseExperience: $baseExperience, height: $height, weight: $weight, stats: $stats, types: $types}';
  }

  factory PokeApiDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokeApiDetailsResponse(
      id: json["id"],
      name: json["name"],
      baseExperience: json["base_experience"],
      height: json["height"],
      weight: json["weight"],
      imageUrl: json["sprites"]["other"]["official-artwork"]["front_default"],
      stats: List<StatsResponse>.from(json["stats"].map((x) => StatsResponse.fromJson(x))),
      types: List<TypesResponse>.from(json["types"].map((x) => TypesResponse.fromJson(x))),
    );
  }
}

class StatsResponse {
  final int baseStat;
  final StatResponse stat;

  StatsResponse({required this.baseStat, required this.stat});

  @override
  String toString() {
    return 'StatsResponse{baseStat: $baseStat, stat: $stat}';
  }

  factory StatsResponse.fromJson(Map<String, dynamic> json) {
    return StatsResponse(
      baseStat: json["base_stat"],
      stat: StatResponse.fromJson(json["stat"]),
    );
  }
}

class StatResponse {
  final String name;
  final String url;

  StatResponse({required this.name, required this.url});

  @override
  String toString() {
    return 'StatResponse{name: $name, url: $url}';
  }

  factory StatResponse.fromJson(Map<String, dynamic> json) {
    return StatResponse(
      name: json["name"],
      url: json["url"],
    );
  }
}

class TypesResponse {
  final int slot;
  final TypeResponse type;

  TypesResponse({required this.slot, required this.type});

  @override
  String toString() {
    return 'TypesResponse{slot: $slot, type: $type}';
  }

  factory TypesResponse.fromJson(Map<String, dynamic> json) {
    return TypesResponse(
      slot: json["slot"],
      type: TypeResponse.fromJson(json["type"]),
    );
  }
}

class TypeResponse {
  final String name;
  final String url;

  TypeResponse({required this.name, required this.url});

  @override
  String toString() {
    return 'TypeResponse{name: $name, url: $url}';
  }

  factory TypeResponse.fromJson(Map<String, dynamic> json) {
    return TypeResponse(
      name: json["name"],
      url: json["url"],
    );
  }
}