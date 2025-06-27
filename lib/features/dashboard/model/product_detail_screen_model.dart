import 'package:flutter/material.dart';

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
}
