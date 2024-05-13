import 'package:flutter/material.dart';

class PokepediaText extends StatelessWidget {

  final String text;
  const PokepediaText({super.key, this.text = "Pokepedia"});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: "Pokefont",
            letterSpacing: 3,
            fontSize: 26,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = colorScheme.secondary,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: "Pokefont",
            letterSpacing: 3,
            fontSize: 26,
            color: colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
