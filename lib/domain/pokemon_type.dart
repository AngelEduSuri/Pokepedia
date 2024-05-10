import 'package:equatable/equatable.dart';

class PokemonType extends Equatable {
  final int slot;
  final String name;
  final String url;

  const PokemonType(
      {required this.slot, required this.name, required this.url});

  PokemonType copyWith({
    int? slot,
    String? name,
    String? url,
  }) {
    return PokemonType(
      slot: slot ?? this.slot,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [slot, name, url];

  @override
  String toString() {
    return 'PokemonType{slot: $slot, name: $name, url: $url}';
  }
}

