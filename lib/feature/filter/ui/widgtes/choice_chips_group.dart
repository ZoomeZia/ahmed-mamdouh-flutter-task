import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class ChoiceChipsGroup extends StatelessWidget {
  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;

  const ChoiceChipsGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: options.map((String option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          labelStyle: TextStyles.font14Bold.copyWith(
            color: isSelected
                ? ColorsManager.blueColor
                : ColorsManager.geryColor,
          ),
          selected: isSelected,
          backgroundColor: ColorsManager.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(
              width: 2,
              color: isSelected
                  ? ColorsManager.blueColor
                  : ColorsManager.lightGeryColor,
            ),
          ),
          onSelected: (_) => onSelected(option),
          selectedColor: ColorsManager.lightBlueColor,
        );
      }).toList(),
    );
  }
}
