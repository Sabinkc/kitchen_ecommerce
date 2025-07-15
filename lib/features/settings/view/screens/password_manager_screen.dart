import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,

          title: const Text(
            "Password Manager",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsetsGeometry.only(left: 12),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: ComColors.lightGrey, width: 1.3.r),
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Password", style: TextStyle(fontSize: 14.sp)),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                  hintText: "**************",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.lightGrey,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.secColor,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    "Forgot Password?",

                    style: TextStyle(
                      color: ComColors.priLightColor,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: ComColors.priLightColor,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
              Text("New Password", style: TextStyle(fontSize: 14.sp)),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                  hintText: "**************",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.lightGrey,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.secColor,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              Text("Confirm New Password", style: TextStyle(fontSize: 14.sp)),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                  hintText: "**************",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.lightGrey,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ComColors.secColor,
                      width: 1.5.r,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
