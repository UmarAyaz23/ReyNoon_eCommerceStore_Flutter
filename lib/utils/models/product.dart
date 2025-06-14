import 'package:ecommerce_project/imports.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageURL;
  final bool isFavorite;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.imageURL,
    this.isFavorite = false,
    required this.description
  });
}

final List<Product> products = [
  const Product(
    name: "Men's Luxury 01",
    category: "Men's Luxury",
    price: 2500,
    imageURL: "assets/categories/menLuxury/menLuxury_01.jpg",
    description: "The Men's Luxury 01 is an outclass perfume designed to exude flamboyance and elegance"
  ), 
  const Product(
    name: "Men's Luxury 01",
    category: "Men's Luxury",
    price: 2500,
    imageURL: "assets/categories/menLuxury/menLuxury_01.jpg",
    description: "The Men's Luxury 01 is an outclass perfume designed to exude flamboyance and elegance"
  ),
  const Product(
    name: "Men's Luxury 01",
    category: "Men's Luxury",
    price: 2500,
    imageURL: "assets/categories/menLuxury/menLuxury_01.jpg",
    description: "The Men's Luxury 01 is an outclass perfume designed to exude flamboyance and elegance"
  ),
  const Product(
    name: "Men's Luxury 01",
    category: "Men's Luxury",
    price: 2500,
    imageURL: "assets/categories/menLuxury/menLuxury_01.jpg",
    description: "The Men's Luxury 01 is an outclass perfume designed to exude flamboyance and elegance"
  )
];