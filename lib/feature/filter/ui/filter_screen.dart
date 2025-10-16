import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/spacing.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/widgets/app_button.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/filter_app_bar.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/filter_details_widget.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/location_widget.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/title_text_widget.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/type_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        title: const FilterAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TitleText(title: 'الفئة'),
            ),
            verticalSpace(12),
            const TypeWidget(),
            verticalSpace(24),
            const Divider(
              color: ColorsManager.blackWithOpacity,
              thickness: 1,
            ),
            const LocationWidget(),
            const Divider(
              color: ColorsManager.blackWithOpacity,
              thickness: 1,
            ),
            const FilterDetailsWidget(),
            verticalSpace(76),
            SafeArea(
              bottom: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: AppButton(
                  text: 'شاهد 10,000+ نتائج',
                  backgroundColor: ColorsManager.blueColor,
                  width: double.infinity,
                  borderRadius: 24,
                  height: 44,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
