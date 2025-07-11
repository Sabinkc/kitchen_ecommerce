// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kitchen_ecommerce/common/colors.dart';
// import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
// import 'package:kitchen_ecommerce/features/cart/view/screens/payment_screen.dart';
// import 'package:kitchen_ecommerce/features/cart/view/screens/shipping_address_screen.dart';
// import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';

// class CheckoutScreen extends ConsumerWidget {
//   CheckoutScreen({super.key});
//   final colorConverter = ColorConverter();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartRef = ref.watch(cartController);
//     final cartRefR = ref.read(cartController);
//     // cartRefR.getSelectedItems();
//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,

//         title: const Text(
//           "Checkout",
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//         leading: Padding(
//           padding: const EdgeInsetsGeometry.only(left: 12),
//           child: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 border: Border.all(color: ComColors.lightGrey, width: 1.3.r),
//               ),
//               child: const Icon(Icons.arrow_back),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 5.h,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//             child: Text(
//               "Shipping Address",
//               style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: Column(
//               children: [
//                 Row(
//                   spacing: 3.w,
//                   children: [
//                     Icon(Icons.place_outlined, color: ComColors.priLightColor),
//                     Text("Home", style: TextStyle(fontSize: 15.sp)),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   spacing: 10.w,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         spacing: 3.w,
//                         children: [
//                           const Icon(
//                             Icons.place_outlined,
//                             color: Colors.transparent,
//                           ),
//                           Flexible(
//                             child: Text(
//                               "1901 Thornridge Cir, Shiloh, Hawali 81063 Chicago 5676",
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 13.sp,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => ShippingAddressScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 5.w,
//                           vertical: 2.h,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(18.r),
//                           border: Border.all(
//                             color: ComColors.lightGrey,
//                             width: 1.3.r,
//                           ),
//                         ),
//                         child: Text(
//                           "CHANGE",
//                           style: TextStyle(
//                             color: ComColors.priLightColor,
//                             fontSize: 13.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 3.h),

//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//             child: Divider(color: ComColors.lightGrey),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: Text(
//               "Order List",
//               style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(0),
//                 itemCount: cartRefR.cartItems.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         // color: Colors.red,
//                         height: 100.h,
//                         width: double.infinity,
//                         padding: EdgeInsets.symmetric(vertical: 10.h),
//                         child: Row(
//                           spacing: 5.w,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 10.w),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: ComColors.lightGrey,
//                                   borderRadius: BorderRadius.circular(10.r),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   child: Stack(
//                                     children: [
//                                       Positioned(
//                                         child: Image.asset(
//                                           "assets/images/${cartRef.cartItems[index].img}",
//                                           fit: BoxFit.cover,
//                                           width: 100.w,
//                                           height: 80.h,
//                                         ),
//                                       ),

//                                       if (cartRef.cartItems[index].isOffer)
//                                         Positioned(
//                                           top: 5.h,
//                                           right: 0,
//                                           child: Container(
//                                             padding: const EdgeInsets.all(4),
//                                             decoration: BoxDecoration(
//                                               color: ComColors.darkRed,
//                                               borderRadius:
//                                                   const BorderRadius.only(
//                                                     topLeft: Radius.circular(4),
//                                                     bottomLeft: Radius.circular(
//                                                       4,
//                                                     ),
//                                                   ),
//                                             ),
//                                             child: Text(
//                                               "${cartRef.cartItems[index].discountPercent}% Off",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                                 fontSize: 7.sp,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 spacing: 4.h,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     cartRef.cartItems[index].prodName,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     cartRef.cartItems[index].category,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   cartRefR.cartItems[index].isOffer == true
//                                       ? Row(
//                                           children: [
//                                             const Text("Rs."),
//                                             Text(
//                                               cartRef.cartItems[index].price,
//                                               style: const TextStyle(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                                 decorationColor: Colors.grey,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 5),
//                                             Text(
//                                               cartRef
//                                                   .cartItems[index]
//                                                   .priceAfterDis,
//                                             ),
//                                           ],
//                                         )
//                                       : Row(
//                                           children: [
//                                             const Text("Rs."),
//                                             Text(
//                                               cartRef.cartItems[index].price,
//                                             ),
//                                           ],
//                                         ),
//                                   // cartRefR.cartItems[index].isOffer?
//                                   // Text(
//                                   //   "Rs.${cartRef.cartItems[index].price}",
//                                   //   maxLines: 1,
//                                   //   overflow: TextOverflow.ellipsis,
//                                   //   style: const TextStyle(
//                                   //     fontWeight: FontWeight.bold,
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 10.w,
//                                 vertical: 10.h,
//                               ),
//                               child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       height: 20.r,
//                                       width: 20.r,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: ComColors.lightGrey,
//                                           width: 1.r,
//                                         ),
//                                         color: colorConverter.colorFromString(
//                                           cartRef.cartItems[index].color,
//                                         ),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     Row(
//                                       spacing: 2.w,
//                                       children: [
//                                         const Text("Qty:"),
//                                         Text(
//                                           cartRef.cartItems[index].quantity
//                                               .toString(),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (index != cartRefR.cartItems.length - 1)
//                         Divider(color: ComColors.lightGrey),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               border: Border(top: BorderSide(color: Colors.grey[300]!)),
//             ),
//             height: 70.h,
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: ComColors.priLightColor,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   CupertinoPageRoute(
//                     builder: (context) => const PaymentScreen(),
//                   ),
//                 );
//               },
//               child: Text(
//                 "Continue to Payment",
//                 style: TextStyle(
//                   fontSize: 15.sp,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/address_controller.dart';
import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
import 'package:kitchen_ecommerce/features/cart/view/screens/payment_screen.dart';
import 'package:kitchen_ecommerce/features/cart/view/screens/shipping_address_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/add_address_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final colorConverter = ColorConverter();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final cartRefR = ref.read(cartController);
      cartRefR.getSelectedItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartRef = ref.watch(cartController);
    final cartRefR = ref.read(cartController);
    final addRef = ref.watch(addressController);
    // cartRefR.getSelectedItems();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Checkout",
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
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              "Shipping Address",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
          ),
          addRef.locations.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      dashPattern: [4, 4],
                      strokeWidth: 1.5.r,
                      color: ComColors.priLightColor,
                      radius: Radius.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const AddAddressWidget();
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ComColors.lightGrey,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: ComColors.priLightColor),
                            Text(
                              "Add New Shippping Address",
                              style: TextStyle(color: ComColors.priLightColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Row(
                        spacing: 3.w,
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: ComColors.priLightColor,
                          ),
                          Text(
                            addRef.selectedLocation.place,
                            style: TextStyle(fontSize: 15.sp),
                          ),
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
                                    "${addRef.selectedLocation.completeAddress}, ${addRef.selectedLocation.floor}, ${addRef.selectedLocation.landmark}",
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

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const ShippingAddressScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                border: Border.all(
                                  color: ComColors.lightGrey,
                                  width: 1.3.r,
                                ),
                              ),
                              child: Text(
                                "CHANGE",
                                style: TextStyle(
                                  color: ComColors.priLightColor,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 3.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Divider(color: ComColors.lightGrey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Order List",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: cartRefR.cartSelectedItems.length,
                itemBuilder: (context, index) {
                  return Column(
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
                                          "assets/images/${cartRef.cartSelectedItems[index].img}",
                                          fit: BoxFit.cover,
                                          width: 100.w,
                                          height: 80.h,
                                        ),
                                      ),

                                      if (cartRef
                                          .cartSelectedItems[index]
                                          .isOffer)
                                        Positioned(
                                          top: 5.h,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: ComColors.darkRed,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft: Radius.circular(
                                                      4,
                                                    ),
                                                  ),
                                            ),
                                            child: Text(
                                              "${cartRef.cartSelectedItems[index].discountPercent}% Off",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 7.sp,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                    cartRef.cartSelectedItems[index].prodName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    cartRef.cartSelectedItems[index].category,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  cartRefR.cartSelectedItems[index].isOffer ==
                                          true
                                      ? Row(
                                          children: [
                                            const Text("Rs."),
                                            Text(
                                              cartRef.cartItems[index].price,
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              cartRef
                                                  .cartSelectedItems[index]
                                                  .priceAfterDis,
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            const Text("Rs."),
                                            Text(
                                              cartRef
                                                  .cartSelectedItems[index]
                                                  .price,
                                            ),
                                          ],
                                        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          cartRef
                                              .cartSelectedItems[index]
                                              .color,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Row(
                                      spacing: 2.w,
                                      children: [
                                        const Text("Qty:"),
                                        Text(
                                          cartRef
                                              .cartSelectedItems[index]
                                              .quantity
                                              .toString(),
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
                      if (index != cartRefR.cartSelectedItems.length - 1)
                        Divider(color: ComColors.lightGrey),
                    ],
                  );
                },
              ),
            ),
          ),
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
              onPressed: () {
                if (addRef.locations.isEmpty) {
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
                    Overlay.of(context),
                    CustomSnackBar.error(
                      backgroundColor: ComColors.darkRed,

                      message: "You must add at least one shipping address!",
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
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
