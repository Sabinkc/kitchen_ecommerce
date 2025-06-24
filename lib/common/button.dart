import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class ComButton extends StatelessWidget {
  const ComButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ComColors.priColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text("Sign In", style: TextStyle(color: Colors.white)),
    );
  }
}
