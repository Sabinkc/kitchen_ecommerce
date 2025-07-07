import 'package:flutter/cupertino.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details_data.dart';

class SearchProductModel extends ChangeNotifier {
  List<ProductDetailModel> searchProd = products;

  loadSearchProd(List<ProductDetailModel> product) {
    searchProd = product;
    notifyListeners();
  }

  bool isSearching = false;

  switchIsSearching() {
    isSearching = !isSearching;
    notifyListeners();
  }

  search(String name) {
    searchProd = products
        .where(
          (item) => item.prodName.toLowerCase().contains(name.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void resetSearchProd() {
    searchProd = products;
    notifyListeners();
  }
}
