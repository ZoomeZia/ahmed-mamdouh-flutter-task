import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';
import 'package:flutter_tasks/feature/products/logic/products_cubit/products_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
  });

  static const List<String> _tabs = [
    'كل العروض', //all offers
    'أكسسوارات', //accessories
    'ملابس', //clothes
    'إلكترونيات', //electronics
    'عقارات', //real estate
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final tabController = cubit.tabController;
        return SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            TabBar(
              controller: tabController,
              isScrollable: true,
              indicator: const BoxDecoration(),
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelPadding: EdgeInsets.zero,
              labelColor: ColorsManager.geryColor,
              unselectedLabelColor: ColorsManager.orange,
              tabs: List.generate(_tabs.length, (index) {
                return Tab(
                  child: AnimatedBuilder(
                    animation: tabController,
                    builder: (context, child) {
                      final isSelected = tabController.index == index;
                      return AnimatedContainer(
                        height: 41,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsManager.orangeWithOpacity
                              : ColorsManager.whiteColor,
                          border: Border.all(
                            color: isSelected
                                ? ColorsManager.activeborderColor
                                : ColorsManager.blackWithOpacity,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _tabs[index],
                            style: TextStyles.font14Bold.copyWith(
                              color: isSelected
                                  ? ColorsManager.orange
                                  : ColorsManager.geryColor,
                              fontFamily: GoogleFonts.tajawal().fontFamily,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: ColorsManager.whiteColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
