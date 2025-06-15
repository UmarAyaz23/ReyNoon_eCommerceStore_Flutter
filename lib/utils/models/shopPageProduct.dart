import 'package:ecommerce_project/imports.dart';

class shopPageProduct {
  final String category;
  final String imagePath;
  final String name;
  final double price;

  shopPageProduct({required this.category, required this.imagePath, required this.name, required this.price});

  factory shopPageProduct.fromFirestore(Map<String, dynamic> data) {
    return shopPageProduct(
      category: data['category'] ?? '',
      imagePath: data['imagePath'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
    );
  }
}