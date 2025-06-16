import 'package:ecommerce_project/imports.dart';

class fetchUserdetails with ChangeNotifier {
  String? _userName;
  String? _userEmail;
  String? _userID;
  List<Map<String, dynamic>> _userOrders = [];
  bool _isLoading = true;

  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userID => _userID;
  List<Map<String, dynamic>> get userOrders => _userOrders;
  bool get isLoading => _isLoading;

  fetchUserdetails() {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          final userData = userDoc.data()!;
          _userName = userData['name'] ?? "Guest";
          _userEmail = userData['email'] ?? user.email ?? "No Email";
          _userID = user.uid;

          // Fetch detailed orders
          List<dynamic> orderIDs = userData['orders'] ?? [];
          _userOrders = [];

          for (String orderID in orderIDs) {
            final orderDoc = await FirebaseFirestore.instance.collection('orders').doc(orderID).get();

            if (orderDoc.exists) {
              final orderData = orderDoc.data()!;

              // Get subtotal
              final subtotal = orderData['subtotal'] ?? 0;

              // Get list of products
              final products = List<Map<String, dynamic>>.from(orderData['products'] ?? []);

              _userOrders.add({
                'orderID': orderID,
                'subtotal': subtotal,
                'products': products,
              });
            }
          }

        } else {
          _userName = "Guest";
          _userEmail = user.email ?? "No Email";
        }
      } catch (e) {
        print("Error fetching user data: $e");
        _userName = "Guest";
        _userEmail = "No Email";
        _userOrders = [];
      }
    } else {
      _userName = "Guest";
      _userEmail = "No Email";
      _userOrders = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
