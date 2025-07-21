import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';

class LeaveReviewScreen extends StatelessWidget {
  LeaveReviewScreen({super.key});

  final colorConverter = ColorConverter();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            "Leave Reiview",
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
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              children: [
                Container(
                  // color: Colors.red,
                  height: 100.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    spacing: 5.w,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ComColors.lightGrey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Image.asset(
                                    "assets/images/flanger_white.png",
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 80.h,
                                  ),
                                ),

                                // if (cartRef
                                //     .cartSelectedItems[index]
                                //     .isOffer)
                                //   Positioned(
                                //     top: 5.h,
                                //     right: 0,
                                //     child: Container(
                                //       padding: const EdgeInsets.all(4),
                                //       decoration: BoxDecoration(
                                //         color: ComColors.darkRed,
                                //         borderRadius:
                                //             const BorderRadius.only(
                                //               topLeft: Radius.circular(4),
                                //               bottomLeft: Radius.circular(
                                //                 4,
                                //               ),
                                //             ),
                                //       ),
                                //       child: Text(
                                //         "${cartRef.cartSelectedItems[index].discountPercent}% Off",
                                //         style: TextStyle(
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors.white,
                                //           fontSize: 7.sp,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 4.h,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "White medium Flanger",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),

                            Row(
                              spacing: 2.w,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Flanger",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  " | Qty:",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "3 items",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // cartRefR.cartSelectedItems[index].isOffer ==
                            //         true
                            //     ? Row(
                            //         children: [
                            //           const Text("Rs."),
                            //           Text(
                            //             cartRef.cartItems[index].price,
                            //             style: const TextStyle(
                            //               decoration:
                            //                   TextDecoration.lineThrough,
                            //               decorationColor: Colors.grey,
                            //             ),
                            //           ),
                            //           const SizedBox(width: 5),
                            //           Text(
                            //             cartRef
                            //                 .cartSelectedItems[index]
                            //                 .priceAfterDis,
                            //           ),
                            //         ],
                            //       )
                            //     :
                            const Row(children: [Text("Rs."), Text("100")]),
                            // cartRefR.cartItems[index].isOffer?
                            // Text(
                            //   "Rs.${cartRef.cartItems[index].price}",
                            //   maxLines: 1,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 20.r,
                                width: 20.r,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ComColors.lightGrey,
                                    width: 1.r,
                                  ),
                                  color: colorConverter.colorFromString(
                                    "black",
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.h,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ComColors.priLightColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Re-Order",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Divider(color: ComColors.lightGrey),
                ),
                Text("How is your order?", style: TextStyle(fontSize: 26.sp)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Divider(color: ComColors.lightGrey),
                ),
                Text(
                  "Your overall rating",
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Icon(
                            Icons.star,
                            size: 40.r,
                            color: Colors.yellow[800],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Divider(color: ComColors.lightGrey),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      child: Column(
                        spacing: 8.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add detailed review",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          TextField(
                            maxLines: 3,

                            decoration: InputDecoration(
                              fillColor: ComColors.lightGrey,
                              filled: true,
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

                          Row(
                            spacing: 5.w,
                            children: [
                              Icon(
                                BoxIcons.bx_camera,
                                color: ComColors.priLightColor,
                                size: 22.r,
                              ),
                              Text(
                                "Add photo",
                                style: TextStyle(
                                  color: ComColors.priLightColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
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
          child: Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ComColors.lightGrey,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: ComColors.priLightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ComColors.priLightColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
