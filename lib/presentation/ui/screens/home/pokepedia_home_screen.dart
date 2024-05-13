import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_app_bar.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_loading_bar.dart';

import '../../../blocs/pokepedia_bloc.dart';
import '../../widgets/pokepedia_page_view.dart';

class PokepediaHomeScreen extends StatelessWidget {
  const PokepediaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokepediaBloc = context.read<PokepediaBloc>();
    final pokepediaState = context.watch<PokepediaBloc>().state;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const PokepediaAppBar(),
      body: Visibility(
        visible: !pokepediaState.isLoading,
        replacement: const PokepediaLoadingBar(),
        child: RefreshIndicator(
          onRefresh: () => pokepediaBloc.onRefresh(),
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.9,
                child: Center(
                  child: PokepediaPageView(
                    pokemonList: pokepediaState.pokemonList,
                    pokemonIndexSelected: pokepediaState.pokemonIndexSelected,
                    onPokemonSelected: pokepediaBloc.onPokemonSelected,
                    onAbilitySelected: pokepediaBloc.onAbilitySelected,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

