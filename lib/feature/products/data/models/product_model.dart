class ProductModel {
  final int? id;
  final String title;
  final String? description;
  final String? imagePath;
  final double originalPrice;
  final double currentPrice;
  final int soldQuantity;
  final int? categoryId;

  ProductModel({
    this.id,
    required this.title,
    this.description,
    this.imagePath,
    required this.originalPrice,
    required this.currentPrice,
    required this.soldQuantity,
    this.categoryId,
  });

  // Factory constructor to create ProductModel from Map (database row)
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      description: map['description'],
      imagePath: map['image_path'],
      originalPrice: map['original_price']?.toDouble() ?? 0.0,
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      soldQuantity: map['sold_quantity']?.toInt() ?? 0,
      categoryId: map['category_id']?.toInt(),
    );
  }

  // Getter to calculate discount percentage
  double get discountPercentage {
    if (originalPrice == 0) return 0;
    return ((originalPrice - currentPrice) / originalPrice) * 100;
  }

  // Getter to check if product is on sale
  bool get isOnSale => currentPrice < originalPrice;

  // Getter to check if product has been sold
  bool get hasBeenSold => soldQuantity > 0;
}
