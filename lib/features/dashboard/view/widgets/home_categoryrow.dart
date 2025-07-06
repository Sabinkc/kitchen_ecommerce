import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/all_category_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/subcategory_screen.dart';

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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const AllCategoryScreen(),
                  ),
                );
              },
              child: Text("See all", style: TextStyle(fontSize: 14.sp)),
            ),
          ],
        ),
        SizedBox(
          height: 80.h,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryDetail.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SubcategoryScreen(ind: index),
                        ),
                      );
                    },
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
                              categoryDetail[index]["icon"],
                              size: 30.h,
                              color: ComColors.priLightColor,
                            ),
                          ),
                        ),
                        Text(
                          categoryDetail[index]["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
