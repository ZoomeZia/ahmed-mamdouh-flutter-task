import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/spacing.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/widgets/app_text_form_field.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/choice_chips_group.dart';
import 'package:flutter_tasks/feature/filter/ui/widgtes/title_text_widget.dart';

class FilterDetailsWidget extends StatefulWidget {
  const FilterDetailsWidget({super.key});

  @override
  State<FilterDetailsWidget> createState() => _FilterDetailsWidgetState();
}

class _FilterDetailsWidgetState extends State<FilterDetailsWidget> {
  String selectedType = 'الكل';
  final types = [
    'الكل',
    'توين هاوس',
    'فيلا منفصلة',
    'تاون هاوس',
  ];
  String selectedRooms = '5 غرف+';
  final rooms = [
    '4 غرف',
    '5 غرف+',
    'الكل',
    'غرفتين',
    '3 غرف',
  ];
  String selectedPaymentMethod = 'كاش';
  final paymentMethods = [
    'أى',
    'تقسيط',
    'كاش',
  ];
  String selectedStatus = 'جاهز';
  final statuses = [
    'أى',
    'جاهز',
    'قيد الأنشاء',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(title: 'الأقساط الشهرية'),
          verticalSpace(12),
          Row(
            children: [
              const Flexible(
                child: AppTextFormField(
                  borderColor: ColorsManager.lightGeryColor,

                  keyboardType: TextInputType.number,
                ),
              ),
              horizontalSpace(16),
              const Flexible(
                child: AppTextFormField(
                  keyboardType: TextInputType.number,
                  borderColor: ColorsManager.lightGeryColor,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          const TitleText(title: 'النوع'),
          verticalSpace(12),
          ChoiceChipsGroup(
            options: types,
            selected: selectedType,
            onSelected: (selected) {
              setState(() {
                selectedType = selected;
              });
            },
          ),
          verticalSpace(20),
          const TitleText(title: 'عدد الغرف'),
          verticalSpace(12),
          ChoiceChipsGroup(
            options: rooms,
            selected: selectedRooms,
            onSelected: (selected) {
              setState(() {
                selectedRooms = selected;
              });
            },
          ),
          verticalSpace(20),
          const TitleText(title: 'السعر'),
          verticalSpace(12),
          Row(
            children: [
              const Flexible(
                child: AppTextFormField(
                  labelText: 'أقل سعر',
                  keyboardType: TextInputType.number,
                  borderColor: ColorsManager.lightGeryColor,
                ),
              ),
              horizontalSpace(16),
              const Flexible(
                child: AppTextFormField(
                  labelText: 'أقصى سعر',
                  borderColor: ColorsManager.lightGeryColor,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          const TitleText(title: 'طريقة الدفع'),
          verticalSpace(12),
          ChoiceChipsGroup(
            options: paymentMethods,
            selected: selectedPaymentMethod,
            onSelected: (selected) {
              setState(() {
                selectedPaymentMethod = selected;
              });
            },
          ),
          verticalSpace(20),
          const TitleText(title: 'حالة العقار'),
          verticalSpace(12),
          ChoiceChipsGroup(
            options: statuses,
            selected: selectedStatus,
            onSelected: (selected) {
              setState(() {
                selectedStatus = selected;
              });
            },
          ),
        ],
      ),
    );
  }
}
