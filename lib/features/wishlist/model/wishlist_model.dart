import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details_data.dart';

class WishlistModel extends ChangeNotifier {
  List<ProductDetailModel> wishList = [];

  void addToWishList(ProductDetailModel product) {
    if (wishList.contains(product)) {
      wishList.remove(product);
      return;
    }
    wishList.add(product);
    // logger.log("wishList: $wishList");
    notifyListeners();
  }

  void removeFromWishList(ProductDetailModel product) {
    wishList.remove(product);
    // logger.log("wishList: $wishList");
    notifyListeners();
  }

  void clearWishlist() {
    wishList.clear();
    // logger.log("wishList: $wishList");
    notifyListeners();
  }

  bool isWishList(ProductDetailModel product) {
    if (wishList.contains(product)) {
      // logger.log("is wishlist");
      return true;
    } else {
      // logger.log("not wishlist");
      return false;
    }
  }
}
