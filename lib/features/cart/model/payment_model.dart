import 'package:flutter/material.dart';

class PaymentModel extends ChangeNotifier {
  int selectedInd = 0;

  void updateSelectedInd(int index) {
    selectedInd = index;
    notifyListeners();
  }
}
