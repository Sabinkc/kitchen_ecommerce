import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class PaymentMethodScreen extends ConsumerWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cartRefR = ref.read(cartController);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Payment Methods",
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
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 7.h,
              children: [
                Text(
                  "Cash",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 7.w,
                        children: [
                          Icon(
                            Icons.money_outlined,
                            color: ComColors.priLightColor,
                          ),
                          Text(
                            "Cash",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              // fontWeight: FontWeight.w600,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 20.r,
                        width: 20.r,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: ComColors.priLightColor),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ComColors.priLightColor,
                              shape: BoxShape.circle,
                            ),

                            height: 10.r,
                            width: 10.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Credit & Debit Card",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 7.w,
                        children: [
                          Icon(
                            Icons.card_travel_outlined,
                            color: ComColors.priLightColor,
                          ),
                          Text(
                            "Add Card",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              // fontWeight: FontWeight.w600,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        color: ComColors.priLightColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "More Payment Options",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey[300]!),
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]!),
                          left: BorderSide(color: Colors.grey[300]!),
                          right: BorderSide(color: Colors.grey[300]!),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 7.w,
                            children: [
                              Brand(
                                Brands.paypal,
                                // color: ComColors.priLightColor,
                              ),
                              Text(
                                "Paypal",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.w600,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20.r,
                            width: 20.r,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]!),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey[300]!),
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]!),
                          left: BorderSide(color: Colors.grey[300]!),
                          right: BorderSide(color: Colors.grey[300]!),
                        ),
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(10.r),
                        //   topRight: Radius.circular(10.r),
                        // ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 7.w,
                            children: [
                              Brand(
                                Brands.apple_logo,
                                // color: ComColors.priLightColor,
                              ),
                              Text(
                                "Apple Pay",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.w600,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20.r,
                            width: 20.r,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]!),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey[300]!),
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]!),
                          left: BorderSide(color: Colors.grey[300]!),
                          right: BorderSide(color: Colors.grey[300]!),
                          bottom: BorderSide(color: Colors.grey[300]!),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 7.w,
                            children: [
                              Brand(
                                Brands.google,
                                // color: ComColors.priLightColor,
                              ),
                              Text(
                                "Google Pay",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.w600,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20.r,
                            width: 20.r,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300]!),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                "Save Payment Method",
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
    );
  }
}
