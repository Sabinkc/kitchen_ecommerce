import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';

class HomeCategoryrow extends StatelessWidget {
  const HomeCategoryrow({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: height * 0.02,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Text("See all", style: TextStyle(fontSize: 14.sp)),
          ],
        ),
        SizedBox(
          height: 90.h,
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
                      padding: EdgeInsets.all(13.r),

                      child: Center(
                        child: Icon(
                          categoryIcons[index],
                          size: 30.r,
                          color: ComColors.priLightColor,
                        ),
                      ),
                    ),
                    Text(
                      categoryList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
