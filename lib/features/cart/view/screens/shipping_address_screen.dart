import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Shipping Address",
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
        spacing: 10.h,
        children: [
          SizedBox(height: 5.h),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        spacing: 3.w,
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: ComColors.priLightColor,
                          ),
                          Text("Home", style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10.w,
                        children: [
                          Expanded(
                            child: Row(
                              spacing: 3.w,
                              children: [
                                const Icon(
                                  Icons.place_outlined,
                                  color: Colors.transparent,
                                ),
                                Flexible(
                                  child: Text(
                                    "1901 Thornridge Cir, Shiloh, Hawali 81063 Chicago 5676",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: 20.r,
                            width: 20.r,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: ComColors.priLightColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: index == 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: ComColors.priLightColor,
                                        shape: BoxShape.circle,
                                      ),

                                      height: 10.r,
                                      width: 10.r,
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      if (index != 3) Divider(color: ComColors.lightGrey),
                    ],
                  ),
                );
              },
            ),
          ),
          Spacer(),
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
                "Continue to Payment",
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
