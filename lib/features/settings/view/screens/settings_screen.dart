import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/notification_screen.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/password_manager_screen.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/delete_account_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Settings",
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.notifications_outlined,
                  size: 25.r,
                  color: ComColors.priLightColor,
                ),
                title: Text(
                  "Notification Settings",
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PasswordManagerScreen(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.key_outlined,
                  size: 25.r,
                  color: ComColors.priLightColor,
                ),
                title: Text(
                  "Password Manager",
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

            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DeleteAccountWidget();
                  },
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.card_membership_outlined,
                  size: 25.r,
                  color: ComColors.priLightColor,
                ),
                title: Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 17.sp),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.r,
                  color: ComColors.priLightColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
