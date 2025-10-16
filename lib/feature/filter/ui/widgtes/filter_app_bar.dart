import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          spacing: 12,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(Assets.closeSmall),
              ),
            ),
            Text(
              'فلترة',
              style: TextStyles.font24Bold.copyWith(
                color: ColorsManager.textPrimaryColor,
                height: 2,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          'رجوع للأفتراضى',
          style: TextStyles.font16Bold.copyWith(
            color: ColorsManager.blueColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
