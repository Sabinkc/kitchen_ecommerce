import 'package:icons_plus/icons_plus.dart';

class ContactItemModel {
  final String title;
  final String value;
  BoxIconData icon;

  ContactItemModel({
    required this.icon,
    required this.title,
    required this.value,
  });
}
