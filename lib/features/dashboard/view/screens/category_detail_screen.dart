import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/category_product_detail_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/addtocart_from_category_botmsheet.dart';
import 'package:kitchen_ecommerce/features/wishlist/controller/wishlist_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final String category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final catRef = ref.watch(catProdController);
    final catRefR = ref.read(catProdController);
    final detRefR = ref.read(productDetController);
    final wishRefR = ref.read(wishListController);
    final wishRef = ref.watch(wishListController);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.w500),
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
      body: catRef.catProd.isEmpty
          ? const Center(child: Text("No Products Available!"))
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                spacing: height * 0.01,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0, bottom: 100),
                    physics: const NeverScrollableScrollPhysics(),
                    // itemCount: ProductDetails.dashBotImg.length,
                    itemCount: catRefR.catProd.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.70,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // final detRefR = ref.read(productDetController);
                          // detRefR.resetProdImg();
                          //this fix hero animation problem
                          detRefR.loadProductDetail(catRefR.catProd[index]);
                          detRefR.prodImages =
                              catRefR.catProd[index].imgMap.values.first;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  CategoryProductDetailScreen(prodIndex: index),
                            ),
                          );
                        },
                        child: LayoutBuilder(
                          builder: (context, conCons) {
                            final conHeght = conCons.maxHeight;
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                color: ComColors.lightGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                spacing: conHeght * 0.02,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {
                                              if (wishRefR.isWishList(
                                                catRefR.catProd[index],
                                              )) {
                                                wishRefR.removeFromWishList(
                                                  catRefR.catProd[index],
                                                );
                                                showTopSnackBar(
                                                  displayDuration:
                                                      const Duration(
                                                        milliseconds: 500,
                                                      ),
                                                  Overlay.of(context),
                                                  CustomSnackBar.success(
                                                    backgroundColor:
                                                        ComColors.priLightColor,

                                                    message:
                                                        "Product removed from wishlist!!",
                                                  ),
                                                );
                                              } else {
                                                wishRefR.addToWishList(
                                                  catRefR.catProd[index],
                                                );
                                                showTopSnackBar(
                                                  displayDuration:
                                                      const Duration(
                                                        milliseconds: 500,
                                                      ),
                                                  Overlay.of(context),
                                                  CustomSnackBar.success(
                                                    backgroundColor:
                                                        ComColors.priLightColor,

                                                    message:
                                                        "Product added to wishlist!!",
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5.r),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                wishRef.isWishList(
                                                      catRefR.catProd[index],
                                                    )
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                color: ComColors.priLightColor,
                                                size: 24.r,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      catRef.catProd[index].isOffer == true
                                          ? Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: ComColors.darkRed,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      bottomLeft:
                                                          Radius.circular(4),
                                                    ),
                                              ),
                                              child: Text(
                                                "${catRef.catProd[index].discountPercent}% Off",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Hero(
                                      tag: "hero_tag$index",
                                      child: Image.asset(
                                        // "assets/images/${ProductDetails.dashBotImg[index]}",
                                        "assets/images/${catRef.catProd[index].img}",
                                        height: conHeght * 0.45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 10.w,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              // ProductDetails.dashProdName[index],
                                              catRef.catProd[index].prodName,
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,

                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          spacing: 3,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow[800]!,
                                              size: 16.r,
                                            ),
                                            Text(
                                              catRef.catProd[index].rating,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        catRef.catProd[index].isOffer == true
                                            ? Row(
                                                children: [
                                                  Text(
                                                    "Rs.",
                                                    style: TextStyle(
                                                      fontSize: conHeght * 0.07,
                                                      color: ComColors
                                                          .priLightColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    catRef.catProd[index].price,
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.grey,
                                                      fontSize: conHeght * 0.07,
                                                      color: ComColors
                                                          .priLightColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    catRef.catProd[index].priceAfterDis,
                                                    style: TextStyle(
                                                      fontSize: conHeght * 0.07,
                                                      color: ComColors
                                                          .priLightColor,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Rs.",
                                                    style: TextStyle(
                                                      fontSize: conHeght * 0.07,
                                                      color: ComColors
                                                          .priLightColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    catRef.catProd[index].price,
                                                    style: TextStyle(
                                                      fontSize: conHeght * 0.07,
                                                      color: ComColors
                                                          .priLightColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return AddToCartFromCategoryBottomSheet(
                                                  prodIndex: index,
                                                );
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.shopping_cart_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
