import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/model/faq_data.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: ComColors.lightGrey, width: 1.3.r),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ExpansionTile(
              collapsedIconColor: ComColors.priLightColor,
              shape: const Border(),
              collapsedShape: const Border(),
              iconColor: ComColors.priLightColor,
              childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
              title: Text(faqData[index].title),
              children: [
                Divider(color: ComColors.lightGrey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    faqData[index].desc,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
