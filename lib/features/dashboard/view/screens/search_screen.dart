import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/search_product_detail_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/addtocart_from_search_sheet.dart';
import 'package:kitchen_ecommerce/features/wishlist/controller/wishlist_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final searchRefR = ref.read(searchProdController);
      searchRefR.resetSearchProd();
      searchRefR.isSearching = false;
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchRef = ref.watch(searchProdController);
    final searchRefR = ref.read(searchProdController);
    final detRefR = ref.read(productDetController);
    final wishRefR = ref.read(wishListController);
    final wishRef = ref.watch(wishListController);
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: EdgeInsetsGeometry.only(left: 12.w),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: ComColors.lightGrey, width: 1.3.r),
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, anim) {
              return FadeTransition(
                opacity: anim,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: anim,
                  child: child,
                ),
              );
            },
            child: searchRef.isSearching
                ? TextField(
                    onChanged: (value) {
                      searchRefR.search(value);
                    },
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: ComColors.lightGrey,
                      filled: true,
                      hintText: "Search.....",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(Icons.search, size: 27.r),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),

                        borderSide: BorderSide(
                          width: 2,
                          color: ComColors.secColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),

                        borderSide: BorderSide(
                          width: 2,
                          color: ComColors.lightGrey,
                        ),
                      ),
                    ),
                  )
                : const Text("Search"),
          ),
          centerTitle: true,
          actions: [
            searchRef.isSearching
                ? Padding(
                    padding: EdgeInsetsGeometry.only(right: 12.w),
                    child: InkWell(
                      onTap: () {
                        searchRef.switchIsSearching();
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: ComColors.lightGrey,
                            width: 1.3.r,
                          ),
                        ),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsetsGeometry.only(right: 12.w),
                    child: InkWell(
                      onTap: () {
                        searchRef.switchIsSearching();
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: ComColors.lightGrey,
                            width: 1.3.r,
                          ),
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ),
          ],
        ),

        body: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: searchRef.searchProd.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 40.w,
                      right: 40.w,
                      top: 10.h,
                      bottom: 100.h,
                    ),
                    child: Column(
                      spacing: 40.h,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Searchlist is Empty",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.r,
                            vertical: 40.r,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                BoxIcons.bx_search_alt_2,
                                size: 100.r,
                                color: Colors.grey,
                              ),
                              Text(
                                "Nothing to show here right now",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: 15.w,
                          children: [
                            // Expanded(
                            //   flex: 1,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       backgroundColor: Colors.white,
                            //       elevation: 0,
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8.r),
                            //         side: BorderSide(color: ComColors.priColor),
                            //       ),
                            //     ),
                            //     onPressed: () {},
                            //     child: Text(
                            //       "Check Whishlist",
                            //       style: TextStyle(
                            //         color: ComColors.priColor,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ComColors.priLightColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    side: BorderSide(
                                      color: ComColors.priLightColor,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Search other Items",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    if (searchController.text.trim().isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Results for \"${searchController.text.trim()}\"",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              "${searchRef.searchProd.length} results found",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: ComColors.priLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        itemCount: searchRef.searchProd.length,
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
                              detRefR.loadProductDetail(
                                searchRefR.searchProd[index],
                              );
                              detRefR.prodImages = searchRefR
                                  .searchProd[index]
                                  .imgMap
                                  .values
                                  .first;
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      SearchDetailScreen(prodIndex: index),
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
                                                    searchRefR
                                                        .searchProd[index],
                                                  )) {
                                                    wishRefR.removeFromWishList(
                                                      searchRefR
                                                          .searchProd[index],
                                                    );
                                                    showTopSnackBar(
                                                      displayDuration:
                                                          const Duration(
                                                            milliseconds: 500,
                                                          ),
                                                      Overlay.of(context),
                                                      CustomSnackBar.success(
                                                        backgroundColor:
                                                            ComColors
                                                                .priLightColor,

                                                        message:
                                                            "Product removed from wishlist!!",
                                                      ),
                                                    );
                                                  } else {
                                                    wishRefR.addToWishList(
                                                      searchRefR
                                                          .searchProd[index],
                                                    );
                                                    showTopSnackBar(
                                                      displayDuration:
                                                          const Duration(
                                                            milliseconds: 500,
                                                          ),
                                                      Overlay.of(context),
                                                      CustomSnackBar.success(
                                                        backgroundColor:
                                                            ComColors
                                                                .priLightColor,

                                                        message:
                                                            "Product added to wishlist!!",
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5.r),
                                                  decoration:
                                                      const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                  child: Icon(
                                                    wishRef.isWishList(
                                                          searchRefR
                                                              .searchProd[index],
                                                        )
                                                        ? Icons.favorite
                                                        : Icons
                                                              .favorite_outline,
                                                    color:
                                                        ComColors.priLightColor,
                                                    size: 24.r,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchRef.searchProd[index].isOffer ==
                                                  true
                                              ? Container(
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
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
                                                    "${searchRef.searchProd[index].discountPercent}% Off",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            "assets/images/${searchRef.searchProd[index].img}",
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
                                                  searchRef
                                                      .searchProd[index]
                                                      .prodName,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  searchRef
                                                      .searchProd[index]
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            searchRef
                                                        .searchProd[index]
                                                        .isOffer ==
                                                    true
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        "Rs.",
                                                        style: TextStyle(
                                                          fontSize:
                                                              conHeght * 0.07,
                                                          color: ComColors
                                                              .priLightColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        searchRef
                                                            .searchProd[index]
                                                            .price,
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          decorationColor:
                                                              Colors.grey,
                                                          fontSize:
                                                              conHeght * 0.07,
                                                          color: ComColors
                                                              .priLightColor,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        searchRef
                                                            .searchProd[index]
                                                            .priceAfterDis,
                                                        style: TextStyle(
                                                          fontSize:
                                                              conHeght * 0.07,
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
                                                          fontSize:
                                                              conHeght * 0.07,
                                                          color: ComColors
                                                              .priLightColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        searchRef
                                                            .searchProd[index]
                                                            .price,
                                                        style: TextStyle(
                                                          fontSize:
                                                              conHeght * 0.07,
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
                                                    return AddToCartFromSearchBottomSheet(
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
