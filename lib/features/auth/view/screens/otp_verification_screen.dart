import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/change_password_screen.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Verify Code", style: TextStyle(fontSize: 30.sp)),
              Text(
                "Please verify code that we just sent to",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              Text(
                "sabinkc@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ComColors.priLightColor,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 15.h),
              Pinput(
                defaultPinTheme: PinTheme(
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: ComColors.lightGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              Text(
                "Didn't receive OTP?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              ),
              Text(
                "Resend Code",
                textAlign: TextAlign.center,

                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 13.sp,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Verify",
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
