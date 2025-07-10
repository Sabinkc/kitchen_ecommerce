import 'package:flutter/material.dart';

class AddAddressModel extends ChangeNotifier {
  String selectedPlace = "Home";
  void updateSelectedPlace(String place) {
    selectedPlace = place;
    notifyListeners();
  }

  int selectedIndex = 0;
  void updateSelctedIdnex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
