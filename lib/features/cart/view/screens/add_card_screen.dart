import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,

          title: const Text(
            "Add Card",
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Stack(
                children: [
                  Container(
                    height: height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ComColors.priLightColor,
                    ),
                  ),
                  Positioned(
                    top: -80.r,
                    right: -5.r,
                    child: Container(
                      height: 200.r,
                      width: 200.r,
                      decoration: BoxDecoration(
                        color: ComColors.lightGrey.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80.r,
                    right: -100.r,
                    child: Container(
                      height: 200.r,
                      width: 200.r,
                      decoration: BoxDecoration(
                        color: ComColors.lightGrey.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.h,
                    right: 15.w,
                    child: Icon(
                      BoxIcons.bxl_visa,
                      color: Colors.white,
                      size: 60.r,
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 18.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5.h,
                        children: [
                          Text(
                            "4716 9456 3489 9802",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Card Holder Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Text(
                                    "Sabin KC",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expiry Date",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Text(
                                    "2026/01/04",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                BoxIcons.bx_memory_card,
                                color: Colors.white,
                                size: 28.r,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card Holder Name", style: TextStyle(fontSize: 14.sp)),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: ComColors.lightGrey,
                      filled: true,

                      hintText: "Sabin KC",
                      hintStyle: const TextStyle(color: Colors.grey),
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
                  Text("Card Number", style: TextStyle(fontSize: 14.sp)),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: ComColors.lightGrey,
                      filled: true,

                      hintText: "4716 9456 3489 9802",
                      hintStyle: const TextStyle(color: Colors.grey),
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
                  Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 5.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Expiry Date",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                fillColor: ComColors.lightGrey,
                                filled: true,

                                hintText: "2026/01/04",
                                hintStyle: const TextStyle(color: Colors.grey),
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
                      Expanded(
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CVV", style: TextStyle(fontSize: 14.sp)),
                            TextField(
                              decoration: InputDecoration(
                                fillColor: ComColors.lightGrey,
                                filled: true,

                                hintText: "000",
                                hintStyle: const TextStyle(color: Colors.grey),
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
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    spacing: 5.h,
                    children: [
                      Icon(
                        Icons.check_box,
                        color: ComColors.priLightColor,
                        size: 24.r,
                      ),
                      Text("Save Card", style: TextStyle(fontSize: 16.sp)),
                    ],
                  ),
                ],
              ),
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
              height: 70.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ComColors.priLightColor,
                ),
                onPressed: () {},
                child: Text(
                  "Add Card",
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
    );
  }
}
