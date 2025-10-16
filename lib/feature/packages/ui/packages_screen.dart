import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';
import 'package:flutter_tasks/core/widgets/app_button.dart';
import 'package:flutter_tasks/feature/packages/logic/packages_cubit/packages_cubit.dart';
import 'package:flutter_tasks/feature/packages/logic/packages_cubit/packages_state.dart';
import 'package:flutter_tasks/feature/packages/ui/widgets/package_card.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackagesCubit()..loadPackages(),
      child: const _PackagesScreenView(),
    );
  }
}

class _PackagesScreenView extends StatelessWidget {
  const _PackagesScreenView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PackagesCubit, PackagesState>(
      listener: (context, state) {
        if (state is PackagesError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'error_loading_packages'.tr(
                  namedArgs: {'error': state.message},
                ),
              ),
            ),
          );
        }
      },
      child: BlocBuilder<PackagesCubit, PackagesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorsManager.whiteColor,
              elevation: 0,
              centerTitle: false,
              title: Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      child: SvgPicture.asset(
                        Assets.chevronRight,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  Text(
                    'أختر الباقات اللى تناسبك',
                    style: TextStyles.font24Medium.copyWith(
                      height: 2,
                      color: ColorsManager.textPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, PackagesState state) {
    if (state is PackagesLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is PackagesError) {
      return Center(
        child: Text(
          'no_packages_available'.tr(),
          style: const TextStyle(
            fontSize: 16,
            color: ColorsManager.textPrimaryColor,
          ),
        ),
      );
    }

    if (state is PackagesLoaded) {
      return _buildPackagesList(context, state);
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildPackagesList(BuildContext context, PackagesLoaded state) {
    if (state.packages.isEmpty) {
      return Center(
        child: Text(
          'no_packages_available'.tr(),
          style: const TextStyle(
            fontSize: 16,
            color: ColorsManager.textPrimaryColor,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
            style: TextStyles.font14Regular.copyWith(
              color: ColorsManager.textPrimaryColor,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              itemCount:
                  state.packages.length + 1, // +1 for the button container
              itemBuilder: (context, index) {
                // Show button container as the last item
                if (index == state.packages.length) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsManager.offWhiteColor,
                      border: Border.all(
                        color: ColorsManager.blackWithOpacity,
                      ),
                    ),
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'باقات مخصصة لك',
                          style: TextStyles.font14Medium.copyWith(
                            color: ColorsManager.textPrimaryColor,
                          ),
                        ),
                        Text(
                          'تواصل معنا لأختيار الباقة المناسبة لك',
                          style: TextStyles.font12Regular.copyWith(
                            color: ColorsManager.textPrimaryColor,
                          ),
                        ),
                        Text(
                          'فريق المبيعات',
                          style: TextStyles.font16Bold.copyWith(
                            color: ColorsManager.blueColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Show package cards for other indices
                return PackageCard(
                  packageItem: state.packages[index],
                  isSelected: state.selectedPackageIndex == index,
                  onTap: () {
                    context.read<PackagesCubit>().selectPackage(index);
                  },
                );
              },
              separatorBuilder: (context, index) {
                // Don't add separator after the last package (before button)
                if (index == state.packages.length - 1) {
                  return const SizedBox(height: 32);
                }
                return const SizedBox(height: 24);
              },
            ),
          ),
          SafeArea(
            bottom: true,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: AppButton(
                onPressed: () {},
                backgroundColor: ColorsManager.blueColor,
                isBackgroundPrimary: false,
                borderRadius: 24,
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'التالي',
                      style: TextStyles.font16Bold.copyWith(
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.arrowBack,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        ColorsManager.whiteColor,
                        BlendMode.srcIn,
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
