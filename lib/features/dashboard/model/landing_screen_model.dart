import 'package:flutter/material.dart';
import 'dart:developer' as logger;

class LandingScreenModel extends ChangeNotifier {
  int selIndex = 0;
  void updateInd(int index) {
    selIndex = index;
    logger.log("selected Index: $selIndex");
    notifyListeners();
  }
}
