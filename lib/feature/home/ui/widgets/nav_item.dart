import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class NavItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final String label;
  final bool isActive;
  final bool isSpecial;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.index,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    Color textColor;
    Color shadowColor = ColorsManager.geryColor;

    if (isSpecial) {
      iconColor = ColorsManager.blueColor;
      textColor = ColorsManager.blueColor;
      shadowColor = ColorsManager.whiteColor;
    } else if (isActive) {
      iconColor = ColorsManager.black;
      textColor = ColorsManager.black;
      shadowColor = ColorsManager.textPrimaryColor;
    } else {
      iconColor = ColorsManager.geryColor;
      textColor = ColorsManager.geryColor;
      shadowColor = ColorsManager.whiteColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconPath, color: iconColor, width: 24, height: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyles.font12Medium.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
