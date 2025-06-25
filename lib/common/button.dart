import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class ComButton extends StatelessWidget {
  final String name;
  final void Function()? onPressed;
  const ComButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ComColors.priColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(name, style: const TextStyle(color: Colors.white)),
    );
  }
}
