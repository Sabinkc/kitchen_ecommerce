import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/product_detail_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/add_to_cart_bottom_sheet.dart';
import 'package:kitchen_ecommerce/features/wishlist/controller/wishlist_controller.dart';

class HomeBottomproducts extends ConsumerWidget {
  const HomeBottomproducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final botProdRef = ref.watch(botmProdController);
    final botProdRefR = ref.read(botmProdController);
    final detRefR = ref.read(productDetController);
    final wishRef = ref.watch(wishListController);
    final wishRefR = ref.read(wishListController);

    return Column(
      spacing: height * 0.02,
      children: [
        SizedBox(
          height: 60,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        botProdRefR.updateBotmProds(index);
                        botProdRefR.updateBotprodInd(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == botProdRefR.botProdIndex
                              ? ComColors.priLightColor
                              : ComColors.lightGrey,
                        ),
                        child: Text(
                          recList[index],
                          style: TextStyle(
                            color: index == botProdRefR.botProdIndex
                                ? Colors.white
                                : ComColors.priLightColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0, bottom: 100),
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: ProductDetails.dashBotImg.length,
          itemCount: botProdRef.botmProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                detRefR.prodImages =
                    botProdRefR.botmProducts[index].imgMap.values.first;
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ProductDetailScreen(prodIndex: index),
                  ),
                );
              },
              child: LayoutBuilder(
                builder: (context, conCons) {
                  final conHeght = conCons.maxHeight;
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: ComColors.lightGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      spacing: conHeght * 0.02,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    wishRefR.isWishList(
                                          botProdRefR.botmProducts[index],
                                        )
                                        ? wishRefR.removeFromWishList(
                                            botProdRefR.botmProducts[index],
                                          )
                                        : wishRefR.addToWishList(
                                            botProdRefR.botmProducts[index],
                                          );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      wishRefR.isWishList(
                                            botProdRefR.botmProducts[index],
                                          )
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: ComColors.priLightColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            botProdRefR.botmProducts[index].isOffer == true
                                ? Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: ComColors.darkRed,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      "${botProdRef.botmProducts[index].discountPercent}% Off",
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Hero(
                            tag: "hero_tag$index",
                            child: Image.asset(
                              // "assets/images/${ProductDetails.dashBotImg[index]}",
                              "assets/images/${botProdRef.botmProducts[index].img}",
                              height: conHeght * 0.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10.w,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    // ProductDetails.dashProdName[index],
                                    botProdRef.botmProducts[index].prodName,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[800]!,
                                    size: 16.r,
                                  ),
                                  Text(
                                    botProdRef.botmProducts[index].rating,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              botProdRefR.botmProducts[index].isOffer == true
                                  ? Row(
                                      children: [
                                        Text(
                                          "Rs.",
                                          style: TextStyle(
                                            fontSize: conHeght * 0.07,
                                            color: ComColors.priLightColor,
                                          ),
                                        ),
                                        Text(
                                          "${botProdRef.botmProducts[index].price}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Colors.grey,
                                            fontSize: conHeght * 0.07,
                                            color: ComColors.priLightColor,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${botProdRef.botmProducts[index].priceAfterDis}",
                                          style: TextStyle(
                                            fontSize: conHeght * 0.07,
                                            color: ComColors.priLightColor,
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
                                            color: ComColors.priLightColor,
                                          ),
                                        ),
                                        Text(
                                          "${botProdRef.botmProducts[index].price}",
                                          style: TextStyle(
                                            fontSize: conHeght * 0.07,
                                            color: ComColors.priLightColor,
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
                                      return AddToCartBottomSheet(
                                        prodIndex: index,
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.shopping_cart_outlined),
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
    );
  }
}
