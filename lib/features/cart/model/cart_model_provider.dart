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
    cartItems.removeWhere((item) => item.isSelected);
    notifyListeners();
  }

  void removeCartItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void switchSelection(int index) {
    cartItems[index].isSelected = !cartItems[index].isSelected;
    notifyListeners();
  }

  // List<CartItemModel> selectedItems = [];

  // void getSelectedItems() {
  //   selectedItems = cartItems.where((item) => item.isSelected == true).toList();
  //   notifyListeners();
  // }

  int getSubTotal() {
    int subTotal = 0;
    int itemTotal;
    int i;
    for (i = 0; i < cartItems.length; i++) {
      itemTotal =
          double.parse(cartItems[i].price).toInt() * cartItems[i].quantity;
      subTotal = itemTotal + subTotal;
    }
    return subTotal;
  }

  // int getSubTotal() {
  //   getSelectedItems();
  //   int subTotal = 0;
  //   int itemTotal;
  //   int i;
  //   for (i = 0; i < selectedItems.length; i++) {
  //     itemTotal =
  //         double.parse(selectedItems[i].price).toInt() *
  //         selectedItems[i].quantity;
  //     subTotal = itemTotal + subTotal;
  //   }
  //   return subTotal;
  // }

  int getDiscount() {
    int disc = 0;
    for (int i = 0; i < cartItems.length; i++) {
      disc =
          disc +
          ((cartItems[i].discountPercent / 100) *
                  double.parse(cartItems[i].price).toInt() *
                  cartItems[i].quantity)
              .toInt();
    }
    return disc;
  }

  // int getDiscount() {
  //   getSelectedItems();
  //   int disc = 0;
  //   for (int i = 0; i < selectedItems.length; i++) {
  //     disc =
  //         disc +
  //         ((selectedItems[i].discountPercent / 100) *
  //                 double.parse(selectedItems[i].price).toInt() *
  //                 selectedItems[i].quantity)
  //             .toInt();
  //   }
  //   return disc;
  // }

  int getTotal() {
    int delivery = 50;
    int subTotal = getSubTotal();
    int disc = getDiscount();
    int total = subTotal - disc + delivery;
    return total;
  }

  // int getTotal() {
  //   getSelectedItems();
  //   int delivery = 50;
  //   int subTotal = getSubTotal();
  //   int disc = getDiscount();
  //   int total = subTotal - disc + delivery;
  //   return total;
  // }
}
