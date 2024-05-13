import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokepedia/domain/pokemon.dart';
import 'package:pokepedia/domain/pokemon_ability.dart';
import 'package:pokepedia/domain/pokemon_stats.dart';
import 'package:pokepedia/domain/utils/string_capitalize.dart';
import 'package:pokepedia/presentation/blocs/pokepedia_bloc.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_chip.dart';

class PokepediaPageView extends StatefulWidget {
  final List<Pokemon> pokemonList;
  final int pokemonIndexSelected;
  final Function(PokemonAbility ability) onAbilitySelected;
  final Function(int index) onPokemonSelected;

  const PokepediaPageView({
    super.key,
    required this.pokemonList,
    required this.onAbilitySelected,
    required this.pokemonIndexSelected,
    required this.onPokemonSelected,
  });

  @override
  State<PokepediaPageView> createState() => _PokepediaPageViewState();
}

class _PokepediaPageViewState extends State<PokepediaPageView> {
  final controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Swiper(
      physics: const BouncingScrollPhysics(),
      loop: false,
      controller: controller,
      viewportFraction: 0.90,
      scale: 0.95,
      itemCount: widget.pokemonList.length,
      pagination: SwiperCustomPagination(
        builder: (BuildContext context, SwiperPluginConfig config) {
          return _PokepediaPaginationCustom(
            pokemonList: widget.pokemonList,
            currentIndexSelected: widget.pokemonIndexSelected,
            onPokemonSelected: (index) {
              widget.onPokemonSelected(index);
              controller.move(index);
            },
          );
        },
      ),
      index: widget.pokemonIndexSelected,
      onIndexChanged: (value) => widget.onPokemonSelected(value),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 70),
          child: PokepediaContent(
            currentPokemon: widget.pokemonList[index],
            onAbilitySelected: (ability) {
              widget.onAbilitySelected(ability);
            },
          ),
        );
      },
    );
  }
}

class _PokepediaPaginationCustom extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final int currentIndexSelected;
  final Function(int index) onPokemonSelected;

  const _PokepediaPaginationCustom(
      {required this.pokemonList,
      required this.currentIndexSelected,
      required this.onPokemonSelected});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const padding = 15.0;
    final itemWidth = (screenWidth - 2 * padding) / 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pokemonList.length,
            itemBuilder: (context, index) => _PokepediaItem(
              index: index,
              currentIndex: currentIndexSelected,
              width: itemWidth,
              name: pokemonList[index].name,
              onPokemonSelected: onPokemonSelected,
            ),
          ),
        ),
      ),
    );
  }
}

class _PokepediaItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String name;
  final double width;
  final Function(int index) onPokemonSelected;

  const _PokepediaItem(
      {required this.index,
      required this.currentIndex,
      required this.name,
      required this.width,
      required this.onPokemonSelected});

  @override
  Widget build(BuildContext context) {
    final colorsScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.only(right: index == 2 ? 0 : 5),
        color: currentIndex != index
            ? colorsScheme.primary
            : colorsScheme.secondary,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onPokemonSelected(index);
            },
            child: Center(
              child: Text(
                name.capitalize(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PokepediaContent extends StatelessWidget {
  final Pokemon currentPokemon;
  final Function(PokemonAbility ability) onAbilitySelected;

  const PokepediaContent({
    super.key,
    required this.currentPokemon,
    required this.onAbilitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("Habilidades",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            _PokepediaAbilities(
              currentPokemon: currentPokemon,
              onAbilitySelected: onAbilitySelected,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: _PokepediaSelectedAbilitiesInfo(
                selectedAbilities: currentPokemon.selectedAbilities,
              ),
            ),
            SizedBox(
                height: 200,
                child: _PokepediaImageAndInfo(
                    pokemonImageUrl: currentPokemon.imageUrl,
                    pokemonHeight: currentPokemon.height,
                    pokemonWeight: currentPokemon.weight)),
            Divider(
                thickness: 2, color: Theme.of(context).colorScheme.secondary),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: _PokepediaStatsInfo(
                    currentStats: currentPokemon.currentStats,
                    baseStats: currentPokemon.baseStats),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokepediaAbilities extends StatelessWidget {
  final Pokemon currentPokemon;
  final Function(PokemonAbility ability) onAbilitySelected;

  const _PokepediaAbilities({
    required this.currentPokemon,
    required this.onAbilitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Wrap(children: [
              for (final ability in currentPokemon.abilities)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: PokepediaChip(
                    text: ability.toSpanish().name.capitalize(),
                    onTap: () => onAbilitySelected(ability),
                    isSelected:
                        currentPokemon.selectedAbilities.contains(ability),
                  ),
                )
            ]),
          ),
        ),
      ),
    );
  }
}

class _PokepediaSelectedAbilitiesInfo extends StatelessWidget {
  final List<PokemonAbility> selectedAbilities;

  const _PokepediaSelectedAbilitiesInfo({required this.selectedAbilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.info_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 10),
          Text(
            selectedAbilities.isEmpty
                ? 'Sin habilidades seleccionadas'
                : 'Habilidades seleccionadas',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ]),
        const SizedBox(height: 8),
        ...selectedAbilities.map((ability) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: FadeIn(
              animate: selectedAbilities.contains(ability),
              child: Text(
                '"${ability.description.replaceAll('\n', ' ')}"',
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _PokepediaImageAndInfo extends StatelessWidget {
  final String pokemonImageUrl;
  final int pokemonHeight;
  final int pokemonWeight;

  const _PokepediaImageAndInfo(
      {required this.pokemonImageUrl,
      required this.pokemonHeight,
      required this.pokemonWeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 1,
            left: 1,
            right: 1,
            bottom: 1,
            child: Image.network(
              pokemonImageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.tertiary,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ));
              },
            ),
          ),
          Positioned(
            right: 1,
            bottom: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Altura: ${pokemonHeight * 10} cm", style: Theme.of(context).textTheme.titleSmall),
                Text("Peso: ${pokemonWeight * 0.22} lb", style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PokepediaStatsInfo extends StatelessWidget {
  final List<PokemonStats> currentStats;
  final List<PokemonStats> baseStats;

  const _PokepediaStatsInfo(
      {required this.currentStats, required this.baseStats});

  @override
  Widget build(BuildContext context) {
    final colorsScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...currentStats.asMap().map((index, stat) {
          final newStat = stat.toSpanish();
          final change = newStat.baseStat - baseStats[index].baseStat;
          final isBaseStat = newStat.baseStat == baseStats[index].baseStat;
          return MapEntry(
            index,
            Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        newStat.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 1,
                                  left: 1,
                                  right: 1,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                      begin: 0,
                                      end: newStat.baseStat / 100,
                                    ),
                                    duration: const Duration(milliseconds: 500),
                                    builder: (context, value, child) =>
                                        LinearProgressIndicator(
                                      minHeight: 15,
                                      value: value,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 1,
                                  right: 1,
                                  child: Text(
                                    '${change > 0 ? '+' : ''}$change',
                                    style: TextStyle(
                                      fontFamily: "PokeFont",
                                      color: isBaseStat
                                          ? colorsScheme.tertiary
                                          : (change > 1
                                              ? Colors.green
                                              : colorsScheme.primary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 3)
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30,
                      child: Text(
                        "${stat.baseStat > 100 ? 100 : stat.baseStat}",
                        style: const TextStyle(
                            color: Colors.green, fontFamily: "PokeFont"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).values
      ],
    );
  }
}
