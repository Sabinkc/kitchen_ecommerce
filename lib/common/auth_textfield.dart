import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class AuthTextfield extends StatelessWidget {
  final String hintText;
  const AuthTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        prefixIcon: Icon(Icons.email_outlined),
        prefixIconColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: ComColors.secColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
    );
  }
}
