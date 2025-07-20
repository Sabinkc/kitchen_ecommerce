import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class ViewReviewScreen extends StatelessWidget {
  const ViewReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            "Review",
            style: TextStyle(fontWeight: FontWeight.w500),
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8.h,
                          children: [
                            Text("4.5", style: TextStyle(fontSize: 28.sp)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 2.w,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 25.r,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 25.r,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 25.r,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 25.r,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 25.r,
                                ),
                              ],
                            ),
                            Text(
                              "(107 Reviews)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: ComColors.lightGrey, width: 1.5.r),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          child: Column(
                            spacing: 3.h,
                            children: [
                              Row(
                                spacing: 10.w,
                                children: [
                                  Text("5", style: TextStyle(fontSize: 15.sp)),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      minHeight: 5.h,
                                      color: Colors.white,
                                      backgroundColor: ComColors.lightGrey,
                                      stopIndicatorColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                        ComColors.priLightColor,
                                      ),
                                      value: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Text("4", style: TextStyle(fontSize: 15.sp)),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      minHeight: 5.h,
                                      color: Colors.white,
                                      backgroundColor: ComColors.lightGrey,
                                      stopIndicatorColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                        ComColors.priLightColor,
                                      ),
                                      value: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Text("3", style: TextStyle(fontSize: 15.sp)),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      minHeight: 5.h,
                                      color: Colors.white,
                                      backgroundColor: ComColors.lightGrey,
                                      stopIndicatorColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                        ComColors.priLightColor,
                                      ),
                                      value: 0.4,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Text("2", style: TextStyle(fontSize: 15.sp)),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      minHeight: 5.h,
                                      color: Colors.white,
                                      backgroundColor: ComColors.lightGrey,
                                      stopIndicatorColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                        ComColors.priLightColor,
                                      ),
                                      value: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Text("1", style: TextStyle(fontSize: 15.sp)),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      minHeight: 5.h,
                                      color: Colors.white,
                                      backgroundColor: ComColors.lightGrey,
                                      stopIndicatorColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation(
                                        ComColors.priLightColor,
                                      ),
                                      value: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: ComColors.lightGrey, thickness: 1.5.r),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: ComColors.priLightColor,
                      size: 28.r,
                    ),
                    hintText: "Search in reviews",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                    fillColor: ComColors.lightGrey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ComColors.lightGrey,
                        width: 1.5.r,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ComColors.secColor,
                        width: 1.5.r,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: ComColors.lightGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(BoxIcons.bx_filter, size: 22.r),
                              Text("Filter", style: TextStyle(fontSize: 12.sp)),
                              Icon(Icons.arrow_drop_down, size: 22.r),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: ComColors.priLightColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: ComColors.priLightColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Latest",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: ComColors.priLightColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Detailed Reviews",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: ComColors.lightGrey, thickness: 1.5.r),
                Column(
                  spacing: 8.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 8.w,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/images/profile.jpeg",
                                    height: 30.r,
                                    width: 30.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,

                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.verified,
                                      size: 10.r,
                                      color: ComColors.priLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text("Dale Thiel"),
                          ],
                        ),
                        Text(
                          "11 months ago",
                          style: TextStyle(color: ComColors.priLightColor),
                        ),
                      ],
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        SizedBox(width: 3.w),
                        Text(
                          "5.0",
                          style: TextStyle(
                            color: ComColors.priLightColor,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: ComColors.lightGrey, thickness: 1.5.r),
                Column(
                  spacing: 8.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 8.w,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/images/profile.jpeg",
                                    height: 30.r,
                                    width: 30.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,

                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.verified,
                                      size: 10.r,
                                      color: ComColors.priLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text("Tiffaney Nitzsche"),
                          ],
                        ),
                        Text(
                          "1 year ago",
                          style: TextStyle(color: ComColors.priLightColor),
                        ),
                      ],
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        Icon(Icons.star, color: Colors.yellow[800]),
                        SizedBox(width: 3.w),
                        Text(
                          "5.0",
                          style: TextStyle(
                            color: ComColors.priLightColor,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.asset(
                              "assets/images/mirror_black3.webp",
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.asset(
                              "assets/images/mirror_black2.webp",
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ComColors.priLightColor,
            ),
            onPressed: () {},
            child: Text(
              "Write Review",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
