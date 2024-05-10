import 'package:equatable/equatable.dart';

class PokemonAbility extends Equatable {
  final int id;
  final String name;
  final String description;
  final int buffHp;
  final int buffAttack;
  final int buffDefense;
  final int buffSpeed;

  const PokemonAbility(
      {this.id = 0,
      this.name = "",
      this.description = "",
      this.buffHp = 0,
      this.buffAttack = 0,
      this.buffDefense = 0,
      this.buffSpeed = 0});

  @override
  List<Object> get props => [
        id,
        name,
        description,
        buffHp,
        buffAttack,
        buffDefense,
        buffSpeed,
      ];

  PokemonAbility copyWith({
    int? id,
    String? name,
    String? description,
    int? buffHp,
    int? buffAttack,
    int? buffDefense,
    int? buffSpeed,
  }) {
    return PokemonAbility(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      buffHp: buffHp ?? this.buffHp,
      buffAttack: buffAttack ?? this.buffAttack,
      buffDefense: buffDefense ?? this.buffDefense,
      buffSpeed: buffSpeed ?? this.buffSpeed,
    );
  }

  @override
  String toString() {
    return 'PokemonAbility{id: $id, name: $name, description: $description, buffHp: $buffHp, buffAttack: $buffAttack, buffDefense: $buffDefense, buffSpeed: $buffSpeed}';
  }
}

extension PokemonAbilityMapper on PokemonAbility {
  PokemonAbility toSpanish() {
    String spanishName = "";
    switch (name) {
      case "intimidate":
        spanishName = "Intimidación";
        break;
      case "regenerator":
        spanishName = "Regeneración";
        break;
      case "immunity":
        spanishName = "Inmunidad";
        break;
      case "huge-power":
        spanishName = "Potencia";
        break;
      case "steadfast":
        spanishName = "Impasible";
        break;
      case "toxic-boost":
        spanishName = "Tóxico";
        break;
    }

    return PokemonAbility(
      id: id,
      name: spanishName,
      description: description,
      buffHp: buffHp,
      buffAttack: buffAttack,
      buffDefense: buffDefense,
      buffSpeed: buffSpeed,
    );
  }
}

const staticAbilities = [
  PokemonAbility(
    name: "intimidate",
    id: 22,
    buffAttack: 10,
    buffSpeed: 15,
    buffHp: -5,
    buffDefense: -10,
  ),
  PokemonAbility(
    name: "regenerator",
    id: 144,
    buffHp: 10,
    buffSpeed: 5,
    buffDefense: 5,
    buffAttack: -20,
  ),
  PokemonAbility(
    name: "immunity",
    id: 17,
    buffHp: 10,
    buffDefense: 20,
    buffAttack: -20,
    buffSpeed: -10,
  ),
  PokemonAbility(
    name: "huge-power",
    id: 37,
    buffAttack: 15,
    buffSpeed: 15,
    buffHp: -20,
    buffDefense: -10,
  ),
  PokemonAbility(
    name: "steadfast",
    id: 80,
    buffSpeed: 30,
    buffHp: -10,
    buffDefense: -10,
    buffAttack: -3,
  ),
  PokemonAbility(
    name: "toxic-boost",
    id: 137,
    buffDefense: 20,
    buffHp: -15,
    buffSpeed: -3,
    buffAttack: 0,
  ),
];
