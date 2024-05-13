import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_text.dart';

class PokepediaLoadingBar extends StatelessWidget {
  const PokepediaLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.tertiary),
          ),
          const SizedBox(height: 15),
          const PokepediaText(text: "Cargando..."),
        ],
      ),
    );
  }
}
