import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.font16Medium.copyWith(
        color: ColorsManager.geryColor,
      ),
    );
  }
}
