import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details_data.dart';
// import 'dart:developer' as logger;

class CategoryModel extends ChangeNotifier {
  List<ProductDetailModel> catProd = [];

  loadProductDetail(String subCat) {
    List<ProductDetailModel> prod = products
        .where((cat) => cat.subCategory == subCat)
        .toList();
    catProd = prod;
    notifyListeners();
    // logger.log("category prod: $catProd");
  }
}
