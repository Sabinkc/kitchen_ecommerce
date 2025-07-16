import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,

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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "New Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
              Text(
                "Your new password must be different from previously used passwords.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(height: 15.h),
              Text("Password", style: TextStyle(fontSize: 14.sp)),
              TextField(
                decoration: InputDecoration(
                  fillColor: ComColors.lightGrey,
                  filled: true,
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
              SizedBox(height: 3.h),
              Text("New Password", style: TextStyle(fontSize: 14.sp)),
              TextField(
                decoration: InputDecoration(
                  fillColor: ComColors.lightGrey,
                  filled: true,
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
              SizedBox(height: 15.h),
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ComColors.priLightColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
