import 'package:ecommerce_project/imports.dart';

class CartController extends ChangeNotifier {
  final List<shopPageProduct> _cartItems = [];

  List<shopPageProduct> get cartItems => _cartItems;

  void addToCart(shopPageProduct product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(shopPageProduct product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double calculateTotal() {
    double subtotal = 0;
    for (var item in _cartItems) {
      subtotal += item.price;
    }
    return subtotal;
  }

  int get cartItemCount => _cartItems.length;
}
