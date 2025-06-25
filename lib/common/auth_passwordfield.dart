import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class AuthPasswordfield extends StatelessWidget {
  final String hintText;
  const AuthPasswordfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        prefixIcon: const Icon(Icons.lock_outlined),
        prefixIconColor: Colors.grey,
        suffixIcon: const Icon(Icons.visibility_outlined),
        suffixIconColor: Colors.grey,
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
