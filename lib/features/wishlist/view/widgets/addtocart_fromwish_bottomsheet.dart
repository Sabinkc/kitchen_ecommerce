import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
import 'package:kitchen_ecommerce/features/cart/model/cart_item_model.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:kitchen_ecommerce/features/wishlist/controller/wishlist_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddToCartFromWishBottomSheet extends ConsumerStatefulWidget {
  final int prodIndex;
  const AddToCartFromWishBottomSheet({super.key, required this.prodIndex});

  @override
  ConsumerState<AddToCartFromWishBottomSheet> createState() =>
      _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState
    extends ConsumerState<AddToCartFromWishBottomSheet> {
  final colorConverter = ColorConverter();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final detRefR = ref.read(productDetController);
      final wishRefR = ref.read(wishListController);
      detRefR.resetProdImg();
      detRefR.clearImgIndex();
      detRefR.clearColIndex();
      detRefR.prodImages =
          wishRefR.wishList[widget.prodIndex].imgMap.values.first;
      detRefR.imgColor = wishRefR.wishList[widget.prodIndex].imgMap.keys.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final detRef = ref.watch(productDetController);
    final detRefR = ref.read(productDetController);
    final wishRefR = ref.read(wishListController);
    final wishRef = ref.watch(wishListController);
    final cartRefR = ref.read(cartController);
    return Container(
      padding: EdgeInsets.only(top: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      height: height * 0.7,
      width: double.infinity,
      child: detRefR.prodImages.isEmpty
          ? Center(child: CircularProgressIndicator(color: ComColors.secColor))
          : Column(
              spacing: 10.h,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel_outlined, size: 28.r),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(color: ComColors.lightGrey),
                      child: Hero(
                        tag: "hero_tag${widget.prodIndex}",
                        child: Image.asset(
                          "assets/images/${detRef.prodImages[detRef.imgIndex]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (wishRefR.wishList[widget.prodIndex].isOffer == true)
                      Positioned(
                        top: 10,
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
                            "${wishRef.wishList[widget.prodIndex].discountPercent}% Off",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: detRefR.prodImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(productDetController)
                                      .updateImgInd(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: index == detRef.imgIndex
                                          ? ComColors.secColor
                                          : Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/${detRef.prodImages[index]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Text(
                        wishRef.wishList[widget.prodIndex].prodName,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        spacing: 4.w,
                        children: [
                          Text(
                            "Select Color:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            detRef.imgColor,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ListView.builder(
                          itemCount:
                              wishRefR.wishList[widget.prodIndex].imgMap.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final prodColor = wishRefR
                                .wishList[widget.prodIndex]
                                .imgMap
                                .keys
                                .elementAt(index);
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r),
                              child: InkWell(
                                onTap: () {
                                  detRefR.updateColInd(index);
                                  detRefR.clearImgIndex();
                                  detRefR.updateProdImg(
                                    wishRefR
                                        .wishList[widget.prodIndex]
                                        .imgMap
                                        .keys
                                        .elementAt(index),
                                    widget.prodIndex,
                                    wishRefR.wishList,
                                  );
                                  detRefR.updateImgCol(
                                    wishRefR
                                        .wishList[widget.prodIndex]
                                        .imgMap
                                        .keys
                                        .elementAt(index),
                                  );
                                },
                                child: Container(
                                  height: 28.r,
                                  width: 28.r,
                                  decoration: BoxDecoration(
                                    border: detRef.colIndex == index
                                        ? Border.all(
                                            color: colorConverter
                                                .colorFromString(prodColor),
                                          )
                                        : Border.all(color: Colors.transparent),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 18.r,
                                    width: 18.r,
                                    decoration: BoxDecoration(
                                      color: colorConverter.colorFromString(
                                        prodColor,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(top: BorderSide(color: Colors.grey[300]!)),
                  ),
                  height: height * 0.08,
                  width: double.infinity,
                  child: Row(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                            // Text(
                            //   "Rs.${botmProdRef.botmProducts[widget.prodIndex].price}",
                            //   style: const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            wishRefR.wishList[widget.prodIndex].isOffer == true
                                ? Row(
                                    children: [
                                      Text(
                                        "Rs.",
                                        style: TextStyle(
                                          color: ComColors.priLightColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        wishRef
                                            .wishList[widget.prodIndex]
                                            .price,
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          color: ComColors.priLightColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        wishRef
                                            .wishList[widget.prodIndex]
                                            .priceAfterDis,
                                        style: TextStyle(
                                          color: ComColors.priLightColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        "Rs.",
                                        style: TextStyle(
                                          color: ComColors.priLightColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        wishRefR
                                            .wishList[widget.prodIndex]
                                            .price,
                                        style: TextStyle(
                                          color: ComColors.priLightColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: ElevatedButton(
                          onPressed: () {
                            cartRefR.addToCart(
                              CartItemModel(
                                id: wishRefR.wishList[widget.prodIndex].id,
                                prodName: wishRefR
                                    .wishList[widget.prodIndex]
                                    .prodName,
                                img: detRef.prodImages[0],
                                // img: botmProdRefR
                                //     .botmProducts[widget.prodIndex]
                                //     .img,
                                category: wishRefR
                                    .wishList[widget.prodIndex]
                                    .category,
                                price:
                                    wishRefR.wishList[widget.prodIndex].price,
                                quantity: 1,
                                discountPercent: wishRefR
                                    .wishList[widget.prodIndex]
                                    .discountPercent,
                                priceAfterDis: wishRefR
                                    .wishList[widget.prodIndex]
                                    .priceAfterDis,
                                isSelected: true,
                                color: detRefR.imgColor,
                                isOffer:
                                    wishRefR.wishList[widget.prodIndex].isOffer,
                              ),
                            );
                            Navigator.pop(context);
                            showTopSnackBar(
                              displayDuration: const Duration(
                                milliseconds: 500,
                              ),
                              Overlay.of(context),
                              CustomSnackBar.success(
                                backgroundColor: ComColors.priLightColor,

                                message: "Item added to cart successfully!",
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ComColors.priLightColor,
                          ),
                          child: const Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white),
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
    );
  }
}
