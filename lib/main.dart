import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokepedia/presentation/blocs/pokepedia_bloc.dart';
import 'package:pokepedia/presentation/navigation/app_router.dart';
import 'package:pokepedia/presentation/ui/theme/pokepedia_theme.dart';

import 'data/datasources/pokemon_datasource_impl.dart';
import 'data/repositories/pokemon_repository_impl.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PokepediaBloc(
      pokemonRepository:
          PokemonRepositoryImpl(pokemonDatasource: PokemonDatasourceImpl()),
    ),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: PokepediaTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes,
    );
  }
}
