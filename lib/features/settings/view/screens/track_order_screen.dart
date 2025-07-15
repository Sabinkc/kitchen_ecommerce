import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({super.key});

  final colorConverter = ColorConverter();

  final List<Map> orderStatus = [
    {
      "status": "Order Placed",
      "date": "25 Sep 2025, 3:54 PM",
      "icon": "Icons.shoppingbag_outlined",
    },
    {
      "status": "In progress",
      "date": "26 Sep 2025, 3:45 PM",
      "icon": "Icons.shoppingbag_outlined",
    },
    {
      "status": "Shipped",
      "date": "28 Sep 2025, 1:54 PM",
      "icon": "Icons.shoppingbag_outlined",
    },
    {
      "status": "Delivered",
      "date": "29 Sep 2025, 3:05 PM",
      "icon": "Icons.shoppingbag_outlined",
    },
  ];

  final List<IconData> icons = [
    Icons.shopping_bag_outlined,
    Icons.add_box_outlined,
    Icons.car_rental_outlined,
    Icons.delivery_dining_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Track Order",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7.h,
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
                  Container(
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
                  Expanded(
                    child: Column(
                      spacing: 4.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "White medium Flanger",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Row(
                          spacing: 2.w,
                          children: [
                            const Text(
                              "Flanger",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              " | Qty:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "3 items",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // if (index != cartRefR.cartSelectedItems.length - 1)
            Divider(color: ComColors.lightGrey, thickness: 1.5.r),

            Text("Order Details", style: TextStyle(fontSize: 16.sp)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10.w,
              children: [
                Text(
                  "Expected Delivery Date",
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
                Expanded(
                  child: Text(
                    "03 Sep 2025",
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10.w,
              children: [
                Text(
                  "Tracking ID",
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
                Expanded(
                  child: Text(
                    "TRK3452637873",
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            Divider(color: ComColors.lightGrey, thickness: 1.5.r),
            Text("Order Status", style: TextStyle(fontSize: 16.sp)),
            Expanded(
              child: ListView.builder(
                itemCount: orderStatus.length,
                itemBuilder: (context, index) {
                  return Row(
                    spacing: 10.w,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 12.w,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index != 0
                                  ? Container(
                                      height: 20.h,
                                      width: 4.w,
                                      color: index < 2
                                          ? ComColors.priLightColor
                                          : Colors.grey,
                                    )
                                  : Container(
                                      height: 20.h,
                                      width: 4.w,
                                      color: Colors.white,
                                    ),
                              Container(
                                padding: EdgeInsets.all(3.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index < 2
                                      ? ComColors.priLightColor
                                      : Colors.grey,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 15.r,
                                ),
                              ),
                              index != 3
                                  ? Container(
                                      height: 20.h,
                                      width: 4.w,
                                      color: index < 1
                                          ? ComColors.priLightColor
                                          : Colors.grey,
                                    )
                                  : Container(
                                      height: 20.h,
                                      width: 4.w,
                                      color: Colors.white,
                                    ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                orderStatus[index]["status"],
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Text(
                                orderStatus[index]["date"],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        icons[index],
                        color: ComColors.priLightColor,
                        size: 24.r,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
