import 'package:flutter/material.dart';

class ColorConverter {
  Color colorFromString(String color) {
    switch (color.toLowerCase()) {
      case "grey":
        return Colors.grey;
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case 'white':
        return Colors.grey[300]!;
      case "yellow":
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }
}
