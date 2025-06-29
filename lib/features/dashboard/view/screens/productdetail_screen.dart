import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_details.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final int prodIndex;
  const ProductDetailScreen({super.key, required this.prodIndex});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final colorConverter = ColorConverter();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final detRefR = ref.read(productDetController);
      detRefR.resetProdImg();
      detRefR.clearImgIndex();
      detRefR.clearColIndex();
      detRefR.prodImages = products[widget.prodIndex].imgMap.values.first;
      detRefR.imgColor = products[widget.prodIndex].imgMap.keys.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final detRef = ref.watch(productDetController);
    final detRefR = ref.read(productDetController);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: ComColors.lightGrey,
        scrolledUnderElevation: 0,

        title: const Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsetsGeometry.only(left: 12),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsGeometry.only(right: 12),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),
      body: detRefR.prodImages.isEmpty
          ? Center(child: CircularProgressIndicator(color: ComColors.secColor))
          : SingleChildScrollView(
              child: Column(
                spacing: height * 0.02,
                children: [
                  Container(
                    height: height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(color: ComColors.lightGrey),
                    child: Hero(
                      tag: "hero_tag${widget.prodIndex}",
                      child: Image.asset(
                        "assets/images/${detRef.prodImages[detRef.imgIndex]}",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: height * 0.015,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: detRef.prodImages.length,
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
                                        // "assets/images/${images[index]}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              products[widget.prodIndex].category,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                Text(
                                  products[widget.prodIndex].rating,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Text(
                          products[widget.prodIndex].prodName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Product Details",
                          style: TextStyle(
                            color: ComColors.secColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          products[widget.prodIndex].productDetails,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Divider(color: Colors.grey[300]),
                        Row(
                          spacing: 4,
                          children: [
                            const Text(
                              "Select Color:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              detRef.imgColor,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: products[widget.prodIndex].imgMap.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final prodColor = products[widget.prodIndex]
                                  .imgMap
                                  .keys
                                  .elementAt(index);
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    detRefR.updateColInd(index);
                                    detRefR.clearImgIndex();
                                    detRefR.updateProdImg(
                                      products[widget.prodIndex].imgMap.keys
                                          .elementAt(index),
                                      widget.prodIndex,
                                    );
                                    detRefR.updateImgCol(
                                      products[widget.prodIndex].imgMap.keys
                                          .elementAt(index),
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      // color: colorConverter.colorFromString("red"),
                                      border: detRef.colIndex == index
                                          ? Border.all(
                                              color: colorConverter
                                                  .colorFromString(prodColor),
                                            )
                                          : Border.all(
                                              color: Colors.transparent,
                                            ),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 20,
                                      width: 20,
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
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.02),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: height * 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Features",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(
                                                  Icons.cancel_outlined,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.02),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  products[widget.prodIndex]
                                                      .features
                                                      .length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                      ),
                                                  child: Row(
                                                    spacing: 5,
                                                    children: [
                                                      const Text(
                                                        "➜",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        products[widget
                                                                .prodIndex]
                                                            .features[index],
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.new_releases_outlined),
                                    Text(
                                      "Features",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 18),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 0, color: Colors.grey[300]),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: height * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: height * 0.01,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Specifications",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              child: const Icon(
                                                Icons.cancel_outlined,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(height: height * 0.01),
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount:
                                                products[widget.prodIndex]
                                                    .specifications
                                                    .length,
                                            itemBuilder: (context, index) {
                                              final specMap =
                                                  products[widget.prodIndex]
                                                      .specifications;
                                              final key = specMap.keys
                                                  .elementAt(index);
                                              final value =
                                                  specMap[key] ??
                                                  "Not available";
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      key,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Row(
                                                      spacing: 5,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "➜",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          value,
                                                          style:
                                                              const TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(Icons.info_outline),
                                  Text(
                                    "Specifications",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, size: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: height * 0.01),
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
                  const Text(
                    "Total Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Rs.${products[widget.prodIndex].price}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ComColors.priLightColor,
                ),
                child: const Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    Text("Add to Cart", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
