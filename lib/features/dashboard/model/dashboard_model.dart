import 'package:flutter/material.dart';

class DashboardModel extends ChangeNotifier {
  int smoothIndex = 0;

  void updateSmoothInd(int index) {
    smoothIndex = index;
    notifyListeners();
  }
}
