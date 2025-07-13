import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 4.h, bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      height: 165.h,
      width: double.infinity,
      child: Column(
        spacing: 5.h,
        children: [
          SizedBox(
            width: 100.w,
            child: Divider(color: ComColors.lightGrey, thickness: 3.h),
          ),
          Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          Divider(color: ComColors.lightGrey, thickness: 1.3.h),
          Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontSize: 15.sp, color: ComColors.priLightColor),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 15.w,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 37.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ComColors.priLightColor),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ComColors.priLightColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 37.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ComColors.priLightColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ComColors.priLightColor),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Yes, Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
