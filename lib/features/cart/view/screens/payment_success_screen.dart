import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/landing_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsetsGeometry.only(left: 12),
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const LandingScreen()),
                (route) => false,
              );
            },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.h,
        children: [
          SizedBox(height: 150.h),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ComColors.priLightColor,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 60.r),
            ),
          ),
          Text("Payment Successful!", style: TextStyle(fontSize: 24.sp)),
          Text(
            "Thank you for your purchase.",
            style: TextStyle(fontSize: 14.sp, color: ComColors.priLightColor),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            height: 120.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      backgroundColor: ComColors.priLightColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "View Order",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ComColors.priLightColor),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "View E-Receipt",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: ComColors.priLightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
