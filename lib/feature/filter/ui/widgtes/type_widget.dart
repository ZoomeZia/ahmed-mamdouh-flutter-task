
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(Assets.cars),
              Column(
                children: [
                  Text(
                    'عقارات',
                    style: TextStyles.font14Bold.copyWith(
                      color: ColorsManager.textPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'فلل للبيع',
                    style: TextStyles.font12Medium.copyWith(
                      color: ColorsManager.geryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            'تغيير',
            style: TextStyles.font14Bold.copyWith(
              color: ColorsManager.blueColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}