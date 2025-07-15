import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, dynamic>> todayNotifications = [
    {
      "title": "Order Shipped",
      "icon": Icons.local_shipping_outlined, // physical delivery
    },
    {
      "title": "Flash Sale Alert",
      "icon": Icons
          .discount_outlined, // discount tag icon :contentReference[oaicite:0]{index=0}
    },
    {
      "title": "Product Review Request",
      "icon": Icons.rate_review_outlined, // review
    },
  ];

  List<Map> yesterdayNotifications = [
    {
      "title": "New PayPal Added",
      "icon": Icons
          .paypal_outlined, // PayPal logo :contentReference[oaicite:1]{index=1}
    },
    {
      "title": "Newsletter Subscription",
      "icon": Icons.email_outlined, // email
    },
    {
      "title": "App Update Available",
      "icon": Icons.system_update_outlined, // system update
    },
    {
      "title": "Security Alert",
      "icon": Icons.security_outlined, // security shield
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: const Text(
          "Notifications",
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
        actions: [
          Padding(
            padding: const EdgeInsetsGeometry.only(right: 12),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: ComColors.priLightColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: const Text("2 NEW", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TODAY",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    Text(
                      "Mark all as read",
                      style: TextStyle(
                        color: ComColors.priLightColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todayNotifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 7.h,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          spacing: 15.w,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: ComColors.lightGrey,
                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                todayNotifications[index]["icon"],
                                color: ComColors.priLightColor,
                                size: 26.r,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 5.h,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        todayNotifications[index]["title"],
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      Text(
                                        "1h",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ComColors.priLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index != 2)
                        Divider(color: ComColors.lightGrey, thickness: 1.5.r),
                    ],
                  );
                },
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "YESTERDAY",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    Text(
                      "Mark all as read",
                      style: TextStyle(
                        color: ComColors.priLightColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: yesterdayNotifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 7.h,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          spacing: 15.w,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: ComColors.lightGrey,
                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                yesterdayNotifications[index]["icon"],
                                color: ComColors.priLightColor,
                                size: 26.r,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 5.h,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        yesterdayNotifications[index]["title"],
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      Text(
                                        "1d",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ComColors.priLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index != 3)
                        Divider(color: ComColors.lightGrey, thickness: 1.5.r),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
