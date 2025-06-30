import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/cart/model/cart_item_model.dart';
import 'dart:developer' as logger;

class CartModelProvider extends ChangeNotifier {
  List<CartItemModel> cartItems = [];

  void addToCart(CartItemModel item) {
    cartItems.add(item);
    logger.log("cart Items: $cartItems");
    notifyListeners();
  }
}
