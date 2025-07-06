import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/category_detail_screen.dart';

class SubcategoryScreen extends ConsumerWidget {
  final int ind;
  const SubcategoryScreen({super.key, required this.ind});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catRef = ref.watch(catProdController);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: Text(
          categoryDetail[ind]["name"],
          style: const TextStyle(fontWeight: FontWeight.w500),
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: GridView.builder(
          itemCount: categoryDetail[ind]["subcategory"].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  catRef.loadProductDetail(
                    categoryDetail[ind]["subcategory"][index]["name"],
                  );

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CategoryDetailScreen(
                        category:
                            categoryDetail[ind]["subcategory"][index]["name"],
                      ),
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
                          categoryDetail[ind]["subcategory"][index]["icon"],
                          size: 30.h,
                          color: ComColors.priLightColor,
                        ),
                      ),
                    ),
                    Text(
                      categoryDetail[ind]["subcategory"][index]["name"],
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
    );
  }
}
