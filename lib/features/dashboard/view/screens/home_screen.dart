import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:badges/badges.dart' as b;
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/productdetail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            pinned: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                const SizedBox(width: 0),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/profile.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  "Sabin K.C.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ComColors.lightGrey,
                  ),
                  child: b.Badge(
                    badgeStyle: const b.BadgeStyle(padding: EdgeInsets.all(4)),
                    position: b.BadgePosition.topEnd(top: 10, end: 10),
                    child: const Center(
                      child: Icon(Icons.notifications_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: height * 0.02,
                children: [
                  SizedBox(height: height * 0.005),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          height: 50,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ComColors.lightGrey,
                          ),
                          child: Row(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(),
                              Icon(
                                Icons.search_outlined,
                                color: ComColors.priLightColor,
                                size: 30,
                              ),
                              const Text(
                                "Search items",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ComColors.priLightColor,
                          ),
                          height: 50,
                          child: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ComColors.lightGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "New Collection",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                "Get 50% discount for the first transaction",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 30,

                                child: ComButton(
                                  name: "Shop Now",
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 4,
                          child: Image.asset(
                            "assets/images/light1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: ComColors.lightGrey,
                      activeDotColor: ComColors.priLightColor,
                    ),
                    controller: PageController(),
                    count: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("See all"),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            spacing: 5,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ComColors.lightGrey,
                                ),
                                padding: const EdgeInsets.all(20),

                                child: Center(
                                  child: Icon(
                                    categoryIcons[index],
                                    size: 35,
                                    color: ComColors.priLightColor,
                                  ),
                                ),
                              ),
                              Text(
                                categoryList[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == 0
                                      ? ComColors.priLightColor
                                      : ComColors.lightGrey,
                                ),
                                child: Text(
                                  recList[index],
                                  style: TextStyle(
                                    color: index == 0
                                        ? Colors.white
                                        : ComColors.priLightColor,
                                    fontWeight: FontWeight.bold,
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
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                              builder: (context) =>
                                  ProductDetailScreen(prodIndex: index),
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
                                      "assets/images/${products[index].img}",
                                      height: conHeght * 0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      // ProductDetails.dashProdName[index],
                                      products[index].prodName,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
