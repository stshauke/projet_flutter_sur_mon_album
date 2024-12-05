import 'package:flutter/material.dart';
import 'package:tp02/exemple/choice_item.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    this.choices = const [],
    this.selectedChoices = const [],
    required this.onChoiceTap,
  });

  final List<String> choices;
  final List<String> selectedChoices;
  final Function(String) onChoiceTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildChoices(),
      ),
    );
  }

  Widget _buildChoices() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: choices.map((choice) {
        return ChoiceItem(
          choice: choice,
          selected: selectedChoices.contains(choice),
          onTap: () => onChoiceTap(choice),
        );
      }).toList(),
    );
  }
}