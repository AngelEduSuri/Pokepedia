import 'package:flutter/material.dart';

class PokepediaChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const PokepediaChip(
      {super.key, required this.text, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150, minHeight: 45),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected) const Row(
                children: [
                  Icon(Icons.check, color: Colors.white),
                  SizedBox(width: 5),
                ],
              ),
              Text(text, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
