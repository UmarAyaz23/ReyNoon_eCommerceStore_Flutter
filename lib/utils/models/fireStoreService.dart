import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/shopPageProduct.dart'; // import your product model

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get next order ID (basic version)
  Future<String> getNextOrderID() async {
    final snapshot = await _firestore.collection('orders').get();
    int nextID = snapshot.docs.length + 1;
    return nextID.toString();
  }

  // Place Order Function
  Future<void> placeOrder({
    required List<shopPageProduct> products,
    required double subtotal,
    required Map<String, String> address,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    // Generate order ID
    String orderID = await getNextOrderID();

    // Prepare product data for Firestore
    List<Map<String, dynamic>> productData = products.map((product) => {
      "name": product.name,
      "price": product.price,
      "imagePath": product.imagePath,
    }).toList();

    // Create Order
    await _firestore.collection('orders').doc(orderID).set({
      "userID": user.uid,
      "products": productData,
      "subtotal": subtotal,
      "address": address,
      "orderDate": Timestamp.now(),
    });

    // Add order ID to user's order list
    await _firestore.collection('users').doc(user.uid).set({
      "orders": FieldValue.arrayUnion([orderID])
    }, SetOptions(merge: true));
  }
}
