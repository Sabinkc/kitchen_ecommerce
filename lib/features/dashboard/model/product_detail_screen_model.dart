import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details_data.dart';
import 'dart:developer' as logger;

class ProductDetailScreenModel extends ChangeNotifier {
  ProductDetailModel product = ProductDetailModel(
    id: 0,
    prodName: "",
    img: "",
    imgMap: {},
    category: "",
    productDetails: "",
    price: "",
    features: [],
    specifications: {},
    rating: "",
    priceAfterDis: "",
    isOffer: false,
    discountPercent: 0,
  );

  void loadProductDetail(ProductDetailModel product) {
    product = product;
    // logger.log("product detail: $product");
    notifyListeners();
  }

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
    // logger.log("updated color: $imgColor");
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

  void updateProdImg(String color, int index, List prod) {
    final imgMap = prod[index].imgMap;
    prodImages = imgMap[color] ?? [];
    // logger.log("updated images in detail screen: $prodImages");
    notifyListeners();
  }

  void resetProdImg() {
    prodImages = [];
    notifyListeners();
  }
}
