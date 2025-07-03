import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerRow extends ConsumerWidget {
  const HomeBannerRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final smoothRef = ref.watch(smoothController);
    return Column(
      spacing: height * 0.02,
      children: [
        CarouselSlider(
          items: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ComColors.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Collection",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Get 50% discount for the first transaction",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ComColors.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Exciting Offers",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Get 40% discount for the kitchen items till 22 Jan, 2025",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
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
                          "assets/images/flanger_white.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ComColors.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Exciting Offers",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Get 10% discount for the shower items till 3 Feb, 2025",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
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
                          "assets/images/shower_white.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              ref.read(smoothController).updateSmoothInd(index);
            },
            autoPlay: true,
            reverse: false,
            height: 150,
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: smoothRef.smoothIndex,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: ComColors.lightGrey,
            activeDotColor: ComColors.priLightColor,
          ),

          count: 3,
        ),
      ],
    );
  }
}
