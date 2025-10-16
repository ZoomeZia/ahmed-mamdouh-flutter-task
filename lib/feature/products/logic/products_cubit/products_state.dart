part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> allProducts;
  final List<ProductModel> clothesProducts;
  final List<ProductModel> accessoriesProducts;
  final List<ProductModel> electronicsProducts;
  final List<ProductModel> propertyProducts;

  ProductsLoaded({
    required this.allProducts,
    required this.clothesProducts,
    required this.accessoriesProducts,
    required this.electronicsProducts,
    required this.propertyProducts,
  });

  ProductsLoaded copyWith({
    List<ProductModel>? allProducts,
    List<ProductModel>? clothesProducts,
    List<ProductModel>? accessoriesProducts,
    List<ProductModel>? electronicsProducts,
    List<ProductModel>? propertyProducts,
  }) {
    return ProductsLoaded(
      allProducts: allProducts ?? this.allProducts,
      clothesProducts: clothesProducts ?? this.clothesProducts,
      accessoriesProducts: accessoriesProducts ?? this.accessoriesProducts,
      electronicsProducts: electronicsProducts ?? this.electronicsProducts,
      propertyProducts: propertyProducts ?? this.propertyProducts,
    );
  }
}

final class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
