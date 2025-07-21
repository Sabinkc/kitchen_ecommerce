import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:badges/badges.dart' as b;
import 'package:kitchen_ecommerce/features/settings/view/screens/notification_screen.dart';
import 'package:kitchen_ecommerce/test_screen.dart';

class HomeTopbar extends StatelessWidget {
  const HomeTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      pinned: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.w,
        children: [
          const SizedBox(width: 0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const TestScreen()),
              );
            },
            child: Container(
              height: 35.r,
              width: 35.r,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/profile.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "Sabin K.C.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            child: Container(
              height: 35.r,
              width: 35.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ComColors.lightGrey,
              ),
              child: b.Badge(
                badgeStyle: const b.BadgeStyle(padding: EdgeInsets.all(4)),
                position: b.BadgePosition.topEnd(top: 10, end: 10),
                child: const Center(child: Icon(Icons.notifications_outlined)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
