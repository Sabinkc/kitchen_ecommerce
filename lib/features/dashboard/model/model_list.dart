import 'package:flutter/material.dart';

final List<Map<String, dynamic>> categoryDetail = [
  {
    "name": "Kitchen",
    "icon": Icons.kitchen,
    "subcategory": [
      {"name": "Sink", "icon": Icons.water_damage}, // faucet/sink symbol
      {"name": "Trash Can", "icon": Icons.delete}, // trash can
      {"name": "Flanger", "icon": Icons.build}, // tool icon (no direct match)
    ],
  },
  {
    "name": "Bathroom",
    "icon": Icons.bathroom,
    "subcategory": [
      {"name": "Faucet", "icon": Icons.water}, // water icon
      {
        "name": "Mirror",
        "icon": Icons.add_box,
      }, // best fit, reflects mirror frame
      {"name": "Cleaner", "icon": Icons.cleaning_services}, // perfect match
      {"name": "Shower", "icon": Icons.shower}, // available in Flutter 3.10+
    ],
  },
  {
    "name": "Lighting",
    "icon": Icons.lightbulb,
    "subcategory": [
      {
        "name": "Mount Lighting",
        "icon": Icons.light,
      }, // ceiling light (Flutter 3.10+)
    ],
  },
  {
    "name": "Living Room",
    "icon": Icons.weekend,
    "subcategory": [
      {"name": "Sofa", "icon": Icons.weekend}, // perfect match
      {"name": "Table", "icon": Icons.table_bar}, // better table icon
      {"name": "Bed Frame", "icon": Icons.bed}, // reused
      {"name": "Pillow", "icon": Icons.king_bed_outlined}, // best alternative
    ],
  },
  {
    "name": "Bedroom",
    "icon": Icons.bed,
    "subcategory": [
      {"name": "Bed Frame", "icon": Icons.bed},
      {"name": "Mattresses", "icon": Icons.bed_outlined},
      {"name": "Nightstands", "icon": Icons.night_shelter}, // decent fit
    ],
  },
];

final List<String> recList = [
  "For You",
  "Offers",
  "New Arrivals",
  "Popular",
  "Best Sellers",
];
