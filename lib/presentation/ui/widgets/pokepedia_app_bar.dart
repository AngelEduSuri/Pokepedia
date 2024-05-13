import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_text.dart';

class PokepediaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokepediaAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: AppBar(
        backgroundColor: colorScheme.primary,
        title: const PokepediaText(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
