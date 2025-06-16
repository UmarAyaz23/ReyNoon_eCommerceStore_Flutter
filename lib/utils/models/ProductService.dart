import 'package:ecommerce_project/imports.dart';

class ProductService {
  static Future<List<shopPageProduct>> fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((doc) => shopPageProduct.fromFirestore(doc.data())).toList();
  }
}