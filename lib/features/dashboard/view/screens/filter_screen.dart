import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Filter",
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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 7.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category", style: TextStyle(fontSize: 16.sp)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 15.w,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.priLightColor,
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Sofa",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Chair",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Cupboard",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Faucets",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text("Price Range", style: TextStyle(fontSize: 16.sp)),
              SfRangeSlider(
                values: const SfRangeValues(100, 300),
                activeColor: ComColors.priLightColor,
                inactiveColor: ComColors.lightGrey,
                onChanged: (values) {},
                min: 0,
                max: 400,
                interval: 100,
                showTicks: true,
                showLabels: true,
                showDividers: true,
                minorTicksPerInterval: 0,
              ),
              SizedBox(height: 2.h),
              Text("Reviews", style: TextStyle(fontSize: 16.sp)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[800]),
                            Icon(Icons.star, color: Colors.yellow[800]),
                            Icon(Icons.star, color: Colors.yellow[800]),
                            Icon(Icons.star, color: Colors.yellow[800]),
                            Icon(Icons.star, color: Colors.yellow[800]),

                            SizedBox(width: 10.w),
                            Text(
                              "4.5 and above",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: ComColors.priLightColor),
                          ),
                          child: Container(
                            height: 10.r,
                            width: 10.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ComColors.priLightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              Text("Sort by", style: TextStyle(fontSize: 16.sp)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 15.w,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.priLightColor,
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Popular",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Most Recent",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Offers",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Best Sellers",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text("Category", style: TextStyle(fontSize: 16.sp)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 15.w,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.priLightColor,
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Kitchen",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Bathroom",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Lighting",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ComColors.lightGrey,
                      ),
                      child: Text(
                        "Living room",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ),
                  ],
                ),
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
        child: Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ComColors.lightGrey,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Reset Filter",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: ComColors.priLightColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ComColors.priLightColor,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
