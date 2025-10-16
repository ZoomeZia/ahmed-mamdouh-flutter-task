import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/feature/products/data/models/product_model.dart';
import 'package:flutter_tasks/core/helpers/local_db.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late TabController _tabController;
  TabController get tabController => _tabController;
  TickerProvider? _tickerProvider;

  ProductsCubit() : super(ProductsInitial());

  void initializeTabController(TickerProvider tickerProvider) {
    _tickerProvider = tickerProvider;
    _tabController = TabController(length: 5, vsync: tickerProvider);
  }

  Future<void> loadAllProducts() async {
    emit(ProductsLoading());

    try {
      final db = LocalDB.instance;

      // Load all products
      final allProductMaps = await db.getProducts();
      final allProducts = allProductMaps
          .map((map) => ProductModel.fromMap(map))
          .toList();

      // Load products by category
      final clothesProductMaps = await db.getProductsByCategory(1); // ملابس
      final clothesProducts = clothesProductMaps
          .map((map) => ProductModel.fromMap(map))
          .toList();

      final accessoriesProductMaps = await db.getProductsByCategory(
        2,
      ); // اكسسوارات
      final accessoriesProducts = accessoriesProductMaps
          .map((map) => ProductModel.fromMap(map))
          .toList();

      final electronicsProductMaps = await db.getProductsByCategory(
        3,
      ); // الكترونيات
      final electronicsProducts = electronicsProductMaps
          .map((map) => ProductModel.fromMap(map))
          .toList();

      final propertyProductMaps = await db.getProductsByCategory(4); // عقارات
      final propertyProducts = propertyProductMaps
          .map((map) => ProductModel.fromMap(map))
          .toList();

      emit(
        ProductsLoaded(
          allProducts: allProducts,
          clothesProducts: clothesProducts,
          accessoriesProducts: accessoriesProducts,
          electronicsProducts: electronicsProducts,
          propertyProducts: propertyProducts,
        ),
      );
    } catch (e) {
      emit(ProductsError('Error loading products: $e'));
    }
  }

  Future<void> refreshProducts() async {
    await loadAllProducts();
  }

  @override
  Future<void> close() {
    if (_tickerProvider != null) {
      _tabController.dispose();
    }
    return super.close();
  }
}
