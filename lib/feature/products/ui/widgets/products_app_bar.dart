import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/routing/app_route.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: false,
      pinned: false,
      backgroundColor: ColorsManager.whiteColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'أستكشف العروض',
            style: TextStyles.font16Medium.copyWith(
              color: ColorsManager.textPrimaryColor,
            ),
          ),
          InkWell(
            onTap: () {
              AppRouter.goToFilterScreen(context);
            },
            child: Row(
              spacing: 4,
              children: [
                Text(
                  'الكل',
                  style: TextStyles.font16Medium.copyWith(
                    color: ColorsManager.geryColor,
                  ),
                ),
                SvgPicture.asset(Assets.arrowBack),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
