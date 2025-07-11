import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/model/contactus_data.dart';

class ContactusWidget extends StatelessWidget {
  const ContactusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.all(color: ComColors.lightGrey, width: 1.3.r),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ExpansionTile(
              // expandedAlignment: Alignment.centerLeft,
              collapsedIconColor: ComColors.priLightColor,
              shape: const Border(),
              collapsedShape: const Border(),
              iconColor: ComColors.priLightColor,

              childrenPadding: EdgeInsets.symmetric(horizontal: 30.w),
              // leading: Brand(Brands.instagram),
              leading: Icon(contactData[index].icon),
              title: Text(contactData[index].title),
              children: [
                Divider(color: ComColors.lightGrey, height: 1),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "• ${contactData[index].value}",
                      style: const TextStyle(color: Colors.grey),
                    ),
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
