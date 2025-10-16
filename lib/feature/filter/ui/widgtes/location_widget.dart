
import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Row(
            spacing: 8,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(Assets.locationOn),
              ),
              Column(
                children: [
                  Text(
                    'الموقع',
                    style: TextStyles.font14Bold.copyWith(
                      color: ColorsManager.textPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'مصر',
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
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(Assets.arrowForward),
          ),
        ],
      ),
    );
  }
}