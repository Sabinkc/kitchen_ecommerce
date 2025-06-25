import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class AuthTextfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const AuthTextfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: ComColors.secColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
    );
  }
}
