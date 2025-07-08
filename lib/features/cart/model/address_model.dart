import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/cart/model/address_data.dart';
import 'package:kitchen_ecommerce/features/cart/model/address_item_model.dart';

class AddressModel extends ChangeNotifier {
  List<AddressItemModel> locations = addresses;

  int selctedInd = 0;

  updateSelectedIndex(int index) {
    selctedInd = index;
    notifyListeners();
  }

  int selectedLocationInd = 0;

  // void updateSelectedLocInd(int index) {
  //   selectedLocationInd = index;
  //   notifyListeners();
  // }

  AddressItemModel selectedLocation = addresses[0];

  updateLocation(int index) {
    selectedLocation = locations[index];
    selectedLocationInd = index;
    notifyListeners();
  }
}
