import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_text.dart';

class PokepediaLoadingBar extends StatelessWidget {
  const PokepediaLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 15),
          PokepediaText(text: "Cargando..."),
        ],
      ),
    );
  }
}
