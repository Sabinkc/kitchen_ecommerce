// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kitchen_ecommerce/common/colors.dart';
// import 'package:kitchen_ecommerce/features/cart/controller/cart_controller.dart';
// import 'package:kitchen_ecommerce/features/cart/model/cart_item_model.dart';
// import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
// import 'package:kitchen_ecommerce/features/dashboard/model/color_converter.dart';
// import 'package:kitchen_ecommerce/features/wishlist/controller/wishlist_controller.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class ProductDetailScreen extends ConsumerStatefulWidget {
//   final int prodIndex;
//   const ProductDetailScreen({super.key, required this.prodIndex});

//   @override
//   ConsumerState<ProductDetailScreen> createState() =>
//       _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
//   final colorConverter = ColorConverter();
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () {
//       final detRefR = ref.read(productDetController);
//       final botmProdRefR = ref.read(botmProdController);
//       detRefR.resetProdImg();
//       detRefR.clearImgIndex();
//       detRefR.clearColIndex();
//       detRefR.prodImages =
//           botmProdRefR.botmProducts[widget.prodIndex].imgMap.values.first;
//       detRefR.imgColor =
//           botmProdRefR.botmProducts[widget.prodIndex].imgMap.keys.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     final detRef = ref.watch(productDetController);
//     final detRefR = ref.read(productDetController);
//     final botmProdRef = ref.watch(botmProdController);
//     final botmProdRefR = ref.read(botmProdController);
//     final cartRefR = ref.read(cartController);
//     final wishRefR = ref.read(wishListController);
//     final wishRef = ref.watch(wishListController);
//     final product = botmProdRef.botmProducts[widget.prodIndex];
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: ComColors.lightGrey,
//         scrolledUnderElevation: 0,

//         title: const Text(
//           "Product Details",
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//         leading: Padding(
//           padding: const EdgeInsetsGeometry.only(left: 12),
//           child: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: const Icon(Icons.arrow_back),
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsetsGeometry.only(right: 12),
//             child: InkWell(
//               onTap: () {
//                 if (wishRefR.isWishList(product)) {
//                   wishRefR.removeFromWishList(product);
//                   showTopSnackBar(
//                     displayDuration: const Duration(milliseconds: 500),
//                     Overlay.of(context),
//                     CustomSnackBar.success(
//                       backgroundColor: ComColors.priLightColor,

//                       message: "Product removed from wishlist!",
//                     ),
//                   );
//                 } else {
//                   wishRefR.addToWishList(product);
//                   showTopSnackBar(
//                     displayDuration: const Duration(milliseconds: 500),
//                     Overlay.of(context),
//                     CustomSnackBar.success(
//                       backgroundColor: ComColors.priLightColor,

//                       message: "Product added to wishlist!",
//                     ),
//                   );
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                 ),
//                 child: Icon(
//                   wishRef.isWishList(product)
//                       ? Icons.favorite
//                       : Icons.favorite_outline,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: detRef.prodImages.isEmpty
//           ? Center(child: CircularProgressIndicator(color: ComColors.secColor))
//           : SingleChildScrollView(
//               child: Column(
//                 spacing: height * 0.02,
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         height: height * 0.35,
//                         width: double.infinity,
//                         decoration: BoxDecoration(color: ComColors.lightGrey),
//                         child: Hero(
//                           tag: "hero_tag${widget.prodIndex}",
//                           child: Image.asset(
//                             "assets/images/${detRef.prodImages[detRef.imgIndex]}",
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       if (botmProdRef.botmProducts[widget.prodIndex].isOffer ==
//                           true)
//                         Positioned(
//                           top: 10,
//                           right: 0,

//                           child: Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: ComColors.darkRed,
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(4),
//                                 bottomLeft: Radius.circular(4),
//                               ),
//                             ),
//                             child: Text(
//                               "${botmProdRef.botmProducts[widget.prodIndex].discountPercent}% Off",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       spacing: height * 0.015,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: height * 0.1,
//                           width: double.infinity,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: detRefR.prodImages.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 5,
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     ref
//                                         .read(productDetController)
//                                         .updateImgInd(index);
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: index == detRef.imgIndex
//                                             ? ComColors.secColor
//                                             : Colors.white,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: Image.asset(
//                                         // "assets/images/${images[index]}",
//                                         "assets/images/${detRef.prodImages[index]}",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               botmProdRef
//                                   .botmProducts[widget.prodIndex]
//                                   .category,
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Row(
//                               spacing: 5,
//                               children: [
//                                 Icon(Icons.star, color: Colors.yellow[800]),
//                                 Text(
//                                   botmProdRef
//                                       .botmProducts[widget.prodIndex]
//                                       .rating,
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),

//                         Text(
//                           botmProdRef.botmProducts[widget.prodIndex].prodName,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),

//                         Text(
//                           "Product Details",
//                           style: TextStyle(
//                             color: ComColors.secColor,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           botmProdRef
//                               .botmProducts[widget.prodIndex]
//                               .productDetails,
//                           style: const TextStyle(color: Colors.grey),
//                         ),
//                         Divider(color: Colors.grey[300]),
//                         Row(
//                           spacing: 4,
//                           children: [
//                             const Text(
//                               "Select Color:",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               detRef.imgColor,
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30,
//                           child: ListView.builder(
//                             itemCount: botmProdRefR
//                                 .botmProducts[widget.prodIndex]
//                                 .imgMap
//                                 .length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               final prodColor = botmProdRefR
//                                   .botmProducts[widget.prodIndex]
//                                   .imgMap
//                                   .keys
//                                   .elementAt(index);
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 5,
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     detRefR.updateColInd(index);
//                                     detRefR.clearImgIndex();
//                                     detRefR.updateProdImg(
//                                       botmProdRefR
//                                           .botmProducts[widget.prodIndex]
//                                           .imgMap
//                                           .keys
//                                           .elementAt(index),
//                                       widget.prodIndex,
//                                       botmProdRefR.botmProducts,
//                                     );
//                                     detRefR.updateImgCol(
//                                       botmProdRefR
//                                           .botmProducts[widget.prodIndex]
//                                           .imgMap
//                                           .keys
//                                           .elementAt(index),
//                                     );
//                                   },
//                                   child: Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       // color: colorConverter.colorFromString("red"),
//                                       border: detRef.colIndex == index
//                                           ? Border.all(
//                                               color: colorConverter
//                                                   .colorFromString(prodColor),
//                                             )
//                                           : Border.all(
//                                               color: Colors.transparent,
//                                             ),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Container(
//                                       height: 20,
//                                       width: 20,
//                                       decoration: BoxDecoration(
//                                         color: colorConverter.colorFromString(
//                                           prodColor,
//                                         ),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: height * 0.02),
//                           child: InkWell(
//                             onTap: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     height: height * 0.5,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 20,
//                                         vertical: 10,
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               const Text(
//                                                 "Features",
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               InkWell(
//                                                 onTap: () =>
//                                                     Navigator.pop(context),
//                                                 child: const Icon(
//                                                   Icons.cancel_outlined,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: height * 0.02),
//                                           Expanded(
//                                             child: ListView.builder(
//                                               itemCount: botmProdRef
//                                                   .botmProducts[widget
//                                                       .prodIndex]
//                                                   .features
//                                                   .length,
//                                               itemBuilder: (context, index) {
//                                                 return Padding(
//                                                   padding:
//                                                       const EdgeInsets.symmetric(
//                                                         vertical: 5,
//                                                       ),
//                                                   child: Row(
//                                                     spacing: 5,
//                                                     children: [
//                                                       const Text(
//                                                         "➜",
//                                                         style: TextStyle(
//                                                           color: Colors.grey,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         botmProdRef
//                                                             .botmProducts[widget
//                                                                 .prodIndex]
//                                                             .features[index],
//                                                         style: const TextStyle(
//                                                           color: Colors.grey,
//                                                           fontSize: 18,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   spacing: 5,
//                                   children: [
//                                     Icon(Icons.new_releases_outlined),
//                                     Text(
//                                       "Features",
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   ],
//                                 ),
//                                 Icon(Icons.arrow_forward_ios, size: 18),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Divider(height: 0, color: Colors.grey[300]),
//                         InkWell(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               builder: (context) {
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   height: height * 0.5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 20,
//                                       vertical: 10,
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       spacing: height * 0.01,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             const Text(
//                                               "Specifications",
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () =>
//                                                   Navigator.pop(context),
//                                               child: const Icon(
//                                                 Icons.cancel_outlined,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         // SizedBox(height: height * 0.01),
//                                         Expanded(
//                                           child: ListView.builder(
//                                             itemCount: botmProdRef
//                                                 .botmProducts[widget.prodIndex]
//                                                 .specifications
//                                                 .length,
//                                             itemBuilder: (context, index) {
//                                               final specMap = botmProdRef
//                                                   .botmProducts[widget
//                                                       .prodIndex]
//                                                   .specifications;
//                                               final key = specMap.keys
//                                                   .elementAt(index);
//                                               final value =
//                                                   specMap[key] ??
//                                                   "Not available";
//                                               return Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                       vertical: 5,
//                                                     ),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       key,
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                     ),
//                                                     Row(
//                                                       spacing: 5,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         const Text(
//                                                           "➜",
//                                                           style: TextStyle(
//                                                             color: Colors.grey,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           value,
//                                                           style:
//                                                               const TextStyle(
//                                                                 color:
//                                                                     Colors.grey,
//                                                               ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 spacing: 5,
//                                 children: [
//                                   Icon(Icons.info_outline),
//                                   Text(
//                                     "Specifications",
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ],
//                               ),
//                               Icon(Icons.arrow_forward_ios, size: 18),
//                             ],
//                           ),
//                         ),

//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),

//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: height * 0.01),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           border: Border(top: BorderSide(color: Colors.grey[300]!)),
//         ),
//         height: 70.h,
//         width: double.infinity,
//         child: Row(
//           spacing: 30,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Flexible(
//               flex: 2,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Total Price",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   // Text(
//                   //   "Rs.${botmProdRef.botmProducts[widget.prodIndex].price}",
//                   //   style: const TextStyle(fontWeight: FontWeight.bold),
//                   // ),
//                   botmProdRef.botmProducts[widget.prodIndex].isOffer == true
//                       ? Row(
//                           children: [
//                             Text(
//                               "Rs.",
//                               style: TextStyle(color: ComColors.priLightColor),
//                             ),
//                             Text(
//                               "${botmProdRef.botmProducts[widget.prodIndex].price}",
//                               style: TextStyle(
//                                 decoration: TextDecoration.lineThrough,
//                                 decorationColor: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 color: ComColors.priLightColor,
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Text(
//                               "${botmProdRef.botmProducts[widget.prodIndex].priceAfterDis}",
//                               style: TextStyle(
//                                 color: ComColors.priLightColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         )
//                       : Row(
//                           children: [
//                             Text(
//                               "Rs.",
//                               style: TextStyle(color: ComColors.priLightColor),
//                             ),
//                             Text(
//                               "${botmProdRef.botmProducts[widget.prodIndex].price}",
//                               style: TextStyle(color: ComColors.priLightColor),
//                             ),
//                           ],
//                         ),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 4,
//               child: ElevatedButton(
//                 onPressed: () {
//                   cartRefR.addToCart(
//                     CartItemModel(
//                       id: botmProdRefR.botmProducts[widget.prodIndex].id,
//                       prodName:
//                           botmProdRefR.botmProducts[widget.prodIndex].prodName,
//                       // img: botmProdRefR.botmProducts[widget.prodIndex].img,
//                       img: detRef.prodImages[0],
//                       category:
//                           botmProdRefR.botmProducts[widget.prodIndex].category,
//                       price: botmProdRefR.botmProducts[widget.prodIndex].price,
//                       quantity: 1,
//                       isOffer:
//                           botmProdRefR.botmProducts[widget.prodIndex].isOffer,
//                       discountPercent: botmProdRefR
//                           .botmProducts[widget.prodIndex]
//                           .discountPercent,
//                       priceAfterDis: botmProdRefR
//                           .botmProducts[widget.prodIndex]
//                           .priceAfterDis,
//                       isSelected: true,
//                       color: detRefR.imgColor,
//                     ),
//                   );
//                   Navigator.pop(context);
//                   showTopSnackBar(
//                     displayDuration: const Duration(milliseconds: 500),
//                     Overlay.of(context),
//                     CustomSnackBar.success(
//                       backgroundColor: ComColors.priLightColor,

//                       message: "Item added to cart successfully!",
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: ComColors.priLightColor,
//                 ),
//                 child: const Row(
//                   spacing: 4,
//                   mainAxisAlignment: MainAxisAlignment.center,

//                   children: [
//                     Icon(Icons.shopping_bag_outlined, color: Colors.white),
//                     Text("Add to Cart", style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      final botmProdRefR = ref.read(botmProdController);
      detRefR.resetProdImg();
      detRefR.clearImgIndex();
      detRefR.clearColIndex();
      detRefR.prodImages =
          botmProdRefR.botmProducts[widget.prodIndex].imgMap.values.first;
      detRefR.imgColor =
          botmProdRefR.botmProducts[widget.prodIndex].imgMap.keys.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final detRef = ref.watch(productDetController);
    final detRefR = ref.read(productDetController);
    final botmProdRef = ref.watch(botmProdController);
    final botmProdRefR = ref.read(botmProdController);
    final cartRefR = ref.read(cartController);
    final wishRefR = ref.read(wishListController);
    final wishRef = ref.watch(wishListController);
    final product = botmProdRef.botmProducts[widget.prodIndex];
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
            child: InkWell(
              onTap: () {
                if (wishRefR.isWishList(product)) {
                  wishRefR.removeFromWishList(product);
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
                    Overlay.of(context),
                    CustomSnackBar.success(
                      backgroundColor: ComColors.priLightColor,

                      message: "Product removed from wishlist!",
                    ),
                  );
                } else {
                  wishRefR.addToWishList(product);
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
                    Overlay.of(context),
                    CustomSnackBar.success(
                      backgroundColor: ComColors.priLightColor,

                      message: "Product added to wishlist!",
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  wishRef.isWishList(product)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                ),
              ),
            ),
          ),
        ],
      ),
      body: detRef.prodImages.isEmpty
          ? Center(child: CircularProgressIndicator(color: ComColors.secColor))
          : SingleChildScrollView(
              child: Column(
                spacing: height * 0.02,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.35,
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
                      if (botmProdRef.botmProducts[widget.prodIndex].isOffer ==
                          true)
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
                              "${botmProdRef.botmProducts[widget.prodIndex].discountPercent}% Off",
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
                      spacing: height * 0.015,
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
                              botmProdRef
                                  .botmProducts[widget.prodIndex]
                                  .category,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.star, color: Colors.yellow[800]),
                                Text(
                                  botmProdRef
                                      .botmProducts[widget.prodIndex]
                                      .rating,
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
                          botmProdRef.botmProducts[widget.prodIndex].prodName,
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
                          botmProdRef
                              .botmProducts[widget.prodIndex]
                              .productDetails,
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
                            itemCount: botmProdRefR
                                .botmProducts[widget.prodIndex]
                                .imgMap
                                .length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final prodColor = botmProdRefR
                                  .botmProducts[widget.prodIndex]
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
                                      botmProdRefR
                                          .botmProducts[widget.prodIndex]
                                          .imgMap
                                          .keys
                                          .elementAt(index),
                                      widget.prodIndex,
                                      botmProdRefR.botmProducts,
                                    );
                                    detRefR.updateImgCol(
                                      botmProdRefR
                                          .botmProducts[widget.prodIndex]
                                          .imgMap
                                          .keys
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
                        if (botmProdRef
                                .botmProducts[widget.prodIndex]
                                .dynamicData ==
                            null)
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                itemCount: botmProdRef
                                                    .botmProducts[widget
                                                        .prodIndex]
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
                                                          botmProdRef
                                                              .botmProducts[widget
                                                                  .prodIndex]
                                                              .features[index],
                                                          style:
                                                              const TextStyle(
                                                                color:
                                                                    Colors.grey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        if (botmProdRef
                                .botmProducts[widget.prodIndex]
                                .dynamicData ==
                            null)
                          Divider(height: 0, color: Colors.grey[300]),
                        if (botmProdRef
                                .botmProducts[widget.prodIndex]
                                .dynamicData ==
                            null)
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
                                              itemCount: botmProdRef
                                                  .botmProducts[widget
                                                      .prodIndex]
                                                  .specifications
                                                  .length,
                                              itemBuilder: (context, index) {
                                                final specMap = botmProdRef
                                                    .botmProducts[widget
                                                        .prodIndex]
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
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          Text(
                                                            value,
                                                            style:
                                                                const TextStyle(
                                                                  color: Colors
                                                                      .grey,
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

                        if (botmProdRef
                                .botmProducts[widget.prodIndex]
                                .dynamicData !=
                            null)
                          ListView.builder(
                            padding: EdgeInsets.only(top: 7.h),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: botmProdRef
                                .botmProducts[widget.prodIndex]
                                .dynamicData
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.h),
                                child: InkWell(
                                  onTap: () {
                                    final key = botmProdRef
                                        .botmProducts[widget.prodIndex]
                                        .dynamicData
                                        .keys
                                        .elementAt(index);
                                    final value = botmProdRef
                                        .botmProducts[widget.prodIndex]
                                        .dynamicData[key];
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "$key",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () =>
                                                          Navigator.pop(
                                                            context,
                                                          ),
                                                      child: const Icon(
                                                        Icons.cancel_outlined,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(height: height * 0.01),
                                                Expanded(
                                                  child: value is List
                                                      ? ListView.builder(
                                                          itemCount:
                                                              value.length,
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
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    value[index],
                                                                    style: const TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        )
                                                      : value is Map
                                                      ? ListView.builder(
                                                          itemCount:
                                                              value.length,
                                                          itemBuilder: (context, index) {
                                                            final itemKey =
                                                                value.keys
                                                                    .elementAt(
                                                                      index,
                                                                    );

                                                            final itemValue =
                                                                value[key] ??
                                                                "Not available";
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                    vertical: 5,
                                                                  ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    itemKey
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        itemValue
                                                                            .toString(),
                                                                        style: const TextStyle(
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
                                                        )
                                                      : Text(
                                                          value,
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    spacing: 14.h,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            spacing: 5,
                                            children: [
                                              Icon(Icons.info_outline),
                                              Text(
                                                // "Specifications",
                                                "${botmProdRef.botmProducts[widget.prodIndex].dynamicData.keys.elementAt(index)}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      if (index !=
                                          botmProdRef
                                                  .botmProducts[widget
                                                      .prodIndex]
                                                  .dynamicData
                                                  .length -
                                              1)
                                        Divider(
                                          height: 0,
                                          color: Colors.grey[300],
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
        height: 70.h,
        width: double.infinity,
        child: Row(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  // Text(
                  //   "Rs.${botmProdRef.botmProducts[widget.prodIndex].price}",
                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  botmProdRef.botmProducts[widget.prodIndex].isOffer == true
                      ? Row(
                          children: [
                            Text(
                              "Rs.",
                              style: TextStyle(color: ComColors.priLightColor),
                            ),
                            Text(
                              "${botmProdRef.botmProducts[widget.prodIndex].price}",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                fontWeight: FontWeight.bold,
                                color: ComColors.priLightColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${botmProdRef.botmProducts[widget.prodIndex].priceAfterDis}",
                              style: TextStyle(
                                color: ComColors.priLightColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              "Rs.",
                              style: TextStyle(color: ComColors.priLightColor),
                            ),
                            Text(
                              "${botmProdRef.botmProducts[widget.prodIndex].price}",
                              style: TextStyle(color: ComColors.priLightColor),
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
                      id: botmProdRefR.botmProducts[widget.prodIndex].id,
                      prodName:
                          botmProdRefR.botmProducts[widget.prodIndex].prodName,
                      // img: botmProdRefR.botmProducts[widget.prodIndex].img,
                      img: detRef.prodImages[0],
                      category:
                          botmProdRefR.botmProducts[widget.prodIndex].category,
                      price: botmProdRefR.botmProducts[widget.prodIndex].price,
                      quantity: 1,
                      isOffer:
                          botmProdRefR.botmProducts[widget.prodIndex].isOffer,
                      discountPercent: botmProdRefR
                          .botmProducts[widget.prodIndex]
                          .discountPercent,
                      priceAfterDis: botmProdRefR
                          .botmProducts[widget.prodIndex]
                          .priceAfterDis,
                      isSelected: true,
                      color: detRefR.imgColor,
                    ),
                  );
                  Navigator.pop(context);
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
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
