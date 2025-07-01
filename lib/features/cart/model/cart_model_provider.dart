import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/cart/model/cart_item_model.dart';

class CartModelProvider extends ChangeNotifier {
  List<CartItemModel> cartItems = [];

  void addToCart(CartItemModel item) {
    final existing = cartItems.indexWhere(
      (ci) => ci.id == item.id && ci.color == item.color,
    );

    if (existing != -1) {
      cartItems[existing].quantity = cartItems[existing].quantity + 1;
    } else {
      cartItems.add(item);
    }
    // logger.log("cart Items: $cartItems");
    notifyListeners();
  }

  void increaseCartQuant(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseCartQuant(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void clearCartItems() {
    cartItems.clear();
    notifyListeners();
  }
}
