import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_project/utils/models/shopPageProduct.dart';
import '../models/product.dart';

class ProductService {
  static Future<List<shopPageProduct>> fetchProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('products').get();
      return snapshot.docs.map((doc) => shopPageProduct.fromFirestore(doc.data())).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
