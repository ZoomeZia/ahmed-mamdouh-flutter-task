import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';
import 'package:flutter_tasks/feature/packages/data/models/package_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    this.packageItem,
    this.isSelected = false,
    this.onTap,
  });

  final PackageModel? packageItem;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorsManager.blackWithOpacity),
              color: ColorsManager.whiteColor,
              boxShadow: [
                const BoxShadow(
                  color: ColorsManager.blackWithOpacity,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          isSelected
                              ? Assets.activeCheckbox
                              : Assets.inactiveCheckbox,
                          width: 24,
                          height: 24,
                        ),
                        Text(
                          packageItem?.title ?? '',
                          style: TextStyles.font16Bold.copyWith(
                            color: isSelected
                                ? ColorsManager.blueColor
                                : ColorsManager.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: packageItem?.price.toString() ?? '',
                                style: TextStyles.font18Bold.copyWith(
                                  fontFamily: GoogleFonts.tajawal().fontFamily,
                                  color: ColorsManager.orange,
                                ),
                              ),
                              TextSpan(
                                text: ' ج',
                                style: TextStyles.font18Bold.copyWith(
                                  fontFamily: GoogleFonts.tajawal().fontFamily,
                                  color: ColorsManager.orange,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyles.font18Bold.copyWith(
                                  fontFamily: GoogleFonts.tajawal().fontFamily,
                                  color: ColorsManager.orange,
                                ),
                              ),
                              TextSpan(
                                text: 'م',
                                style: TextStyles.font18Bold.copyWith(
                                  fontFamily: GoogleFonts.tajawal().fontFamily,
                                  color: ColorsManager.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          left: -7,
                          right: 0,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 3,
                                  color: ColorsManager.orange,
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 3,
                                  color: ColorsManager.orange,
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(color: ColorsManager.blackWithOpacity, height: 1),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          packageItem?.features
                              .map(
                                (feature) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: PackageFeature(
                                    title: feature.title,
                                    icon: feature.icon,
                                    subtitle: feature.subtitle,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                    packageItem?.viewBoost != 0
                        ? Column(
                            spacing: 4,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                height: 40,
                                width: 81,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                  border: const Border(
                                    top: BorderSide(
                                      color: ColorsManager.greenColor,
                                      width: 2,
                                    ),
                                    left: BorderSide(
                                      color: ColorsManager.greenColor,
                                      width: 2,
                                    ),
                                    right: BorderSide(
                                      color: ColorsManager.greenColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    packageItem?.viewBoost.toString() ?? '',
                                    style: TextStyles.font16Bold.copyWith(
                                      fontSize: 14,
                                      color: ColorsManager.greenColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'ضعف عدد\nالمشاهدات',
                                style: TextStyles.font12Regular.copyWith(
                                  fontSize: 14,
                                  color: ColorsManager.textPrimaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),

          if (packageItem?.type != null && packageItem!.type.isNotEmpty)
            Positioned(
              top: -20,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        Assets.rectangle9,
                        width: 155,
                        height: 35,
                      ),
                      Positioned(
                        top: 10,
                        bottom: 0,
                        right: 9,
                        left: 0,
                        child: Text(
                          packageItem!.type,
                          style: TextStyles.font12Medium.copyWith(
                            color: ColorsManager.priceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PackageFeature extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String icon;
  const PackageFeature({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: 24, height: 24, child: SvgPicture.asset(icon)),
        subtitle != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    subtitle ?? '',
                    style: TextStyles.font14Medium.copyWith(
                      color: ColorsManager.priceColor,
                    ),
                  ),
                ],
              )
            : Text(title, style: TextStyles.font14Medium),
      ],
    );
  }
}
