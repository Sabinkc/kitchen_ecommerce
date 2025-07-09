import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/manage_address_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Settings")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.asset(
                          "assets/images/profile.jpeg",
                          height: 100.r,
                          width: 100.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.r),
                            color: ComColors.priLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Text("Sabin K.C.", style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 5.h),

              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                      size: 25.r,
                      color: ComColors.priLightColor,
                    ),
                    title: Text(
                      "Your Profile",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ComColors.priLightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Divider(color: ComColors.lightGrey, height: 0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ManageAddressScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        size: 25.r,
                        color: ComColors.priLightColor,
                      ),
                      title: Text(
                        "Manage Address",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                        color: ComColors.priLightColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Divider(color: ComColors.lightGrey, height: 0),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.payment_outlined,
                      size: 25.r,
                      color: ComColors.priLightColor,
                    ),
                    title: Text(
                      "Payment Methods",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ComColors.priLightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Divider(color: ComColors.lightGrey, height: 0),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25.r,
                      color: ComColors.priLightColor,
                    ),
                    title: Text("My Orders", style: TextStyle(fontSize: 17.sp)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ComColors.priLightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Divider(color: ComColors.lightGrey, height: 0),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      size: 25.r,
                      color: ComColors.priLightColor,
                    ),
                    title: Text(
                      "Help Center",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ComColors.priLightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Divider(color: ComColors.lightGrey, height: 0),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      size: 25.r,
                      color: ComColors.priLightColor,
                    ),
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ComColors.priLightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
