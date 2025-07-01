import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CartScreen extends ConsumerWidget {
  CartScreen({super.key});
  final colorConverter = ColorConverter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRef = ref.watch(cartController);
    final cartRefR = ref.read(cartController);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 12.w),
            child: InkWell(
              onTap: () {
                cartRefR.clearCartItems();
                showTopSnackBar(
                  displayDuration: const Duration(milliseconds: 500),
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: ComColors.secColor,

                    message: "Cart items cleared successfully!",
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ComColors.lightGrey,
                ),
                child: const Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
      body: cartRefR.cartItems.isEmpty
          ? const Center(child: Text("No items in cart"))
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8.h),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: cartRefR.cartItems.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          key: const Key(""),
                          direction: Axis.horizontal,
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                  horizontal: 7.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: ComColors.darkRed,
                                  ),
                                  width: 100.w,
                                  height: double.infinity,
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                    size: 30.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ComColors.lightGrey,
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                child: Image.asset(
                                                  "assets/images/${cartRef.cartItems[index].img}",
                                                  fit: BoxFit.cover,
                                                  width: 100.w,
                                                  height: 80.h,
                                                ),
                                              ),
                                              Positioned(
                                                top: 5.h,
                                                left: 5.w,
                                                child: Icon(
                                                  Icons.check_box,
                                                  color: ComColors.secColor,
                                                ),
                                              ),
                                              if (cartRef
                                                  .cartItems[index]
                                                  .isOffer)
                                                Positioned(
                                                  top: 5.h,
                                                  right: 0,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: ComColors.darkRed,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                  4,
                                                                ),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                  4,
                                                                ),
                                                          ),
                                                    ),
                                                    child: Text(
                                                      "${cartRef.cartItems[index].discountPercent}% Off",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartRef.cartItems[index].prodName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            cartRef.cartItems[index].category,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          cartRefR.cartItems[index].isOffer ==
                                                  true
                                              ? Row(
                                                  children: [
                                                    const Text("Rs."),
                                                    Text(
                                                      cartRef
                                                          .cartItems[index]
                                                          .price,
                                                      style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationColor:
                                                            Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      cartRef
                                                          .cartItems[index]
                                                          .priceAfterDis,
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    const Text("Rs."),
                                                    Text(
                                                      cartRef
                                                          .cartItems[index]
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 20.r,
                                              width: 20.r,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ComColors.lightGrey,
                                                  width: 1.r,
                                                ),
                                                color: colorConverter
                                                    .colorFromString(
                                                      cartRef
                                                          .cartItems[index]
                                                          .color,
                                                    ),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Row(
                                              spacing: 5.w,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    cartRefR.decreaseCartQuant(
                                                      index,
                                                    );
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.all(1.r),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ComColors.lightGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5.r,
                                                          ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  cartRef
                                                      .cartItems[index]
                                                      .quantity
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    cartRefR.increaseCartQuant(
                                                      index,
                                                    );
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.all(1.r),
                                                    decoration: BoxDecoration(
                                                      color: ComColors
                                                          .priLightColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5.r,
                                                          ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
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
                              if (index != cartRefR.cartItems.length - 1)
                                Divider(color: ComColors.lightGrey),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: ComColors.lightGrey, width: 2),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 12.h,
                      bottom: 100,
                    ),
                    child: Column(
                      spacing: 7.h,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub-Total",
                              style: TextStyle(
                                color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              "Rs.100",
                              style: TextStyle(
                                // color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee",
                              style: TextStyle(
                                color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              "Rs.50",
                              style: TextStyle(
                                // color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount",
                              style: TextStyle(
                                color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              "Rs.10",
                              style: TextStyle(
                                // color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        DottedLine(
                          dashColor: ComColors.lightGrey,
                          dashGapColor: Colors.white,
                          dashGapLength: 7.w,
                          dashLength: 10.w,
                          dashRadius: 2.w,
                          dashGapRadius: 2.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Cost",
                              style: TextStyle(
                                color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              "Rs.140",
                              style: TextStyle(
                                // color: ComColors.priLightColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ComColors.priLightColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Proceed to chekout",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
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
    );
  }
}
