import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
import 'package:kitchen_ecommerce/features/cart/model/cart_item_model.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RemovefromcartBottomsheet extends ConsumerWidget {
  final CartItemModel item;
  final int cartIndex;
  RemovefromcartBottomsheet({
    super.key,
    required this.item,
    required this.cartIndex,
  });

  final colorConverter = ColorConverter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRefR = ref.read(cartController);

    return Container(
      height: 350..h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        child: Column(
          children: [
            Text(
              "Remove from Cart?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Divider(color: ComColors.lightGrey, height: 20.h),
            Column(
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
                                    "assets/images/${item.img}",
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 80.h,
                                  ),
                                ),

                                if (item.isOffer)
                                  Positioned(
                                    top: 5.h,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: ComColors.darkRed,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        "${item.discountPercent}% Off",
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
                              item.prodName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            item.isOffer == true
                                ? Row(
                                    children: [
                                      const Text("Rs."),
                                      Text(
                                        item.price,
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(item.priceAfterDis),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Text("Rs."),
                                      Text(item.price),
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
                                    item.color,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Row(
                                spacing: 2.w,
                                children: [
                                  const Text("Qty:"),
                                  Text(item.quantity.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 30.w,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 37.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ComColors.lightGrey,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ComColors.priLightColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 37.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ComColors.priLightColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        cartRefR.removeCartItem(cartIndex);
                        Navigator.pop(context);
                        showTopSnackBar(
                          displayDuration: const Duration(milliseconds: 500),
                          Overlay.of(context),
                          CustomSnackBar.success(
                            backgroundColor: ComColors.priLightColor,

                            message: "An item removed from cart!",
                          ),
                        );
                      },
                      child: const Text(
                        "Yes, Remove",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
