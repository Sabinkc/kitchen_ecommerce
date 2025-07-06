import 'package:flutter/material.dart';

final List<Map<String, dynamic>> categoryDetail = [
  {
    "name": "Kitchen",
    "icon": Icons.kitchen,
    "subcategory": [
      {"name": "Chimney", "icon": Icons.smoke_free},
      {"name": "Oven", "icon": Icons.restaurant_rounded}, // closest built‑in
      {"name": "Dishwashers", "icon": Icons.local_laundry_service},
    ],
  },
  {
    "name": "Bathroom",
    "icon": Icons.bathroom,
    "subcategory": [
      {"name": "Towel Rails", "icon": Icons.list},
      {"name": "Mirrors", "icon": Icons.circle}, // placeholder
      {"name": "Vanity Cabinets", "icon": Icons.cabin},
    ],
  },
  {
    "name": "Lighting",
    "icon": Icons.lightbulb,
    "subcategory": [
      {"name": "Ceiling Lights", "icon": Icons.lightbulb},
      {"name": "Wall Lamps", "icon": Icons.lightbulb_outline},
      {"name": "Pendant Lights", "icon": Icons.light},
    ],
  },

  {
    "name": "Living Room",
    "icon": Icons.weekend,
    "subcategory": [
      {"name": "Sofas", "icon": Icons.weekend},
      {
        "name": "Coffee Tables",
        "icon": Icons.table_restaurant,
      }, // reuse dining table
      {"name": "TV Stands", "icon": Icons.tv},
    ],
  },
  {
    "name": "Bedroom",
    "icon": Icons.bed,
    "subcategory": [
      {"name": "Bed Frames", "icon": Icons.bed},
      {"name": "Mattresses", "icon": Icons.bed_outlined},
      {"name": "Nightstands", "icon": Icons.night_shelter},
      // available
    ],
  },
  {
    "name": "Outdoor",
    "icon": Icons.outdoor_grill,
    "subcategory": [
      {"name": "Garden Furniture", "icon": Icons.chair_outlined},
      {"name": "Landscape Lighting", "icon": Icons.grass}, // workaround
      {"name": "Planters", "icon": Icons.grass_outlined},
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
