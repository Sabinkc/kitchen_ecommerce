import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/track_order_screen.dart';

class MyOrderTabview extends StatelessWidget {
  MyOrderTabview({super.key});

  final colorConverter = ColorConverter();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
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
                                color: colorConverter.colorFromString("black"),
                                shape: BoxShape.circle,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => TrackOrderScreen(),
                                  ),
                                );
                              },
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
                                    "Track Order",
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
              // if (index != cartRefR.cartSelectedItems.length - 1)
              if (index != 2) Divider(color: ComColors.lightGrey),
            ],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kitchen_ecommerce/common/colors.dart';
// import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
// import 'package:kitchen_ecommerce/features/settings/view/screens/track_order_screen.dart';

// class MyOrderTabview extends StatelessWidget {
//   MyOrderTabview({super.key});

//   final colorConverter = ColorConverter();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.symmetric(vertical: 5.h),
//           child: Column(
//             children: [
//               Container(
//                 height: 100.h,
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 10.h),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.w),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: ComColors.lightGrey,
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.r),
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 child: Image.asset(
//                                   "assets/images/flanger_white.png",
//                                   fit: BoxFit.cover,
//                                   width: 100.w,
//                                   height: 80.h,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           right: 10.w,
//                         ), // Add right padding
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "White medium Flanger",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(height: 4.h),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     "Flanger",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13.sp,
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   " | Qty:",
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 13.sp,
//                                   ),
//                                 ),
//                                 Text(
//                                   "3 items",
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 4.h),
//                             const Row(children: [Text("Rs."), Text("100")]),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10.w,
//                         vertical: 10.h,
//                       ),
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Container(
//                               height: 20.r,
//                               width: 20.r,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: ComColors.lightGrey,
//                                   width: 1.r,
//                                 ),
//                                 color: colorConverter.colorFromString("black"),
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   CupertinoPageRoute(
//                                     builder: (context) => TrackOrderScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 5.h,
//                                   vertical: 3.h,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ComColors.priLightColor,
//                                   borderRadius: BorderRadius.circular(8.r),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Track Order",
//                                     style: TextStyle(
//                                       fontSize: 10.sp,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (index != 2) Divider(color: ComColors.lightGrey),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
