import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/settings/model/address_data.dart';
import 'package:kitchen_ecommerce/features/settings/model/address_item_model.dart';
// import 'dart:developer' as logger;

class AddressModel extends ChangeNotifier {
  List<AddressItemModel> locations = addresses;

  void addLocation(AddressItemModel location) {
    locations.add(location);
    notifyListeners();
    // logger.log("locations: $locations");
  }

  int selctedInd = 0;

  updateSelectedIndex(int index) {
    selctedInd = index;
    notifyListeners();
  }

  int selectedLocationInd = 0;

  void resetSelectedInd() {
    selctedInd = selectedLocationInd;
    notifyListeners();
  }

  void deleteLocation(int index) {
    locations.removeAt(index);
    if (index < selectedLocationInd) {
      selctedInd = selctedInd - 1;
      selectedLocationInd = selectedLocationInd - 1;
    }
    notifyListeners();
  }

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
