import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/productdetail_screen.dart';

class HomeBottomproducts extends ConsumerWidget {
  const HomeBottomproducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final botProdRef = ref.watch(botmProdController);
    final botProdRefR = ref.read(botmProdController);
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
            childAspectRatio: 0.80,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // final detRefR = ref.read(productDetController);
                // detRefR.resetProdImg();
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ComColors.lightGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      spacing: conHeght * 0.02,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: ComColors.priLightColor,
                            ),
                          ),
                        ),
                        Hero(
                          tag: "hero_tag$index",

                          child: Image.asset(
                            // "assets/images/${ProductDetails.dashBotImg[index]}",
                            "assets/images/${botProdRef.botmProducts[index].img}",
                            height: conHeght * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            // ProductDetails.dashProdName[index],
                            botProdRef.botmProducts[index].prodName,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,

                              fontWeight: FontWeight.w500,
                            ),
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
