import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details.dart';
import 'dart:developer' as logger;

class ProductDetailScreenModel extends ChangeNotifier {
  int imgIndex = 0;
  void updateImgInd(int index) {
    imgIndex = index;
    notifyListeners();
  }

  void clearImgIndex() {
    imgIndex = 0;
    notifyListeners();
  }

  String imgColor = "";

  void updateImgCol(String value) {
    imgColor = value;
    notifyListeners();
  }

  void resetImgCol() {
    imgColor = "";
    notifyListeners();
  }

  int colIndex = 0;
  void updateColInd(int index) {
    colIndex = index;
    notifyListeners();
  }

  void clearColIndex() {
    colIndex = 0;
    notifyListeners();
  }

  List<String> prodImages = [];

  void updateProdImg(String color, int index) {
    final imgMap = products[index].imgMap;
    prodImages = imgMap[color] ?? [];
    logger.log("updated images in detail screen: $prodImages");
    notifyListeners();
  }

  void resetProdImg() {
    prodImages = [];
    notifyListeners();
  }
}
