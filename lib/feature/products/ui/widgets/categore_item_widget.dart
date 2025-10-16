import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class CategoreItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit imageFit;
  const CategoreItemWidget({
    super.key,
    required this.image,
    required this.title,
    this.imageWidth,
    this.imageHeight,
    this.imageFit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Container(
          width: 71,
          height: 78,
          decoration: BoxDecoration(
            color: ColorsManager.blackWithOpacity,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: imageWidth ?? 71,
                height: imageHeight ?? 78,
                fit: imageFit,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyles.font12Regular.copyWith(
            color: ColorsManager.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}

class AllCategoreItemWidget extends StatelessWidget {
  const AllCategoreItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 33,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children: [
              CategoreItemWidget(
                image: Assets.manCategory,
                title: 'موضة رجالى',
                imageFit: BoxFit.contain,
              ),
              CategoreItemWidget(
                image: Assets.watchesCategory,
                title: 'ساعات',
                imageWidth: 56,
                imageHeight: 56,
                imageFit: BoxFit.contain,
              ),
              CategoreItemWidget(
                image: Assets.phonesCategory,
                title: 'موبايلات',
                imageWidth: 56,
                imageHeight: 56,
                imageFit: BoxFit.contain,
              ),

              CategoreItemWidget(
                image: Assets.makeupCategory,
                title: 'منتجات تجميل',
                imageWidth: 56,
                imageHeight: 56,
                imageFit: BoxFit.contain,
              ),
              CategoreItemWidget(
                image: Assets.villaCategory,
                title: 'عقارات',
                imageFit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
