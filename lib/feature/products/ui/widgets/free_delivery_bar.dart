import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class FreeDeliveryBar extends StatelessWidget {
  const FreeDeliveryBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.orangeWithOpacity,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Row(
                spacing: 4,
                children: [
                  SvgPicture.asset(
                    Assets.check,
                  ),
                  Text(
                    'شحن مجاني',
                    style: TextStyles.font12Regular.copyWith(
                      color: ColorsManager.greenColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'لأي عرض تطلبه دلوقتي !',
                style: TextStyles.font10Regular.copyWith(
                  color: ColorsManager.textPrimaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
