import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/build_tab_bar.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/free_delivery_bar.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/tabs_bodies/accessories_body.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/tabs_bodies/all_offers_body.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/categore_item_widget.dart';

import 'package:flutter_tasks/feature/products/ui/widgets/products_app_bar.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/tabs_bodies/clothes_body.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/tabs_bodies/electronic_body.dart';
import 'package:flutter_tasks/feature/products/ui/widgets/tabs_bodies/property_body.dart';
import 'package:flutter_tasks/feature/products/logic/products_cubit/products_cubit.dart';
import '../../../core/theming/colors_manager.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProductsCubit();
        cubit.initializeTabController(this);
        cubit.loadAllProducts();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.whiteColor,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const ProductAppBar(),
              const BuildTabBar(),
              const AllCategoreItemWidget(),
              const FreeDeliveryBar(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
            ];
          },
          body: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              final cubit = context.read<ProductsCubit>();
              return TabBarView(
                controller: cubit.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const AllOffersBody(),
                  const AccessoriesBody(),
                  const ClothesBody(),
                  const ElectronicBody(),
                  const PropertyBody(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

//
