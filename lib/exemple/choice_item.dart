import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  const ChoiceItem({
    super.key,
    required this.choice,
    this.selected = false,
    this.onTap,
  });

  final String choice;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(
            selected ? 20 : 0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 3,
          ),
          child: Text(choice),
        ),
      ),
    );
  }

  Color? _getBackgroundColor() {
    if (selected) return Colors.amber;
    return Colors.grey[300];
  }
}