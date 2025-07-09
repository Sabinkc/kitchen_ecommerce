import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details_data.dart';

class HomeBotproductModel extends ChangeNotifier {
  int botProdIndex = 0;
  void updateBotprodInd(int index) {
    botProdIndex = index;
    notifyListeners();
  }

  List<ProductDetailModel> botmProducts = products;

  void updateBotmProds(int index) {
    switch (index) {
      case 0:
        botmProducts = products;
        notifyListeners();
      case 1:
        botmProducts = offerProducts;
        notifyListeners();
      case 2:
        botmProducts = newArrivals;
        notifyListeners();
      case 3:
        botmProducts = popularProd;
        notifyListeners();
      case 4:
        botmProducts = bestSellers;
        notifyListeners();
      default:
        botmProducts = products;
        notifyListeners();
    }
  }
}
