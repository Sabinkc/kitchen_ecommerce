import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/active_order_tabview.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/cancelled_order_tabview.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/completed_order_tabview.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,

          title: const Text(
            "My Orders",
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
              TabBar(
                indicatorColor: ComColors.priLightColor,
                dividerColor: ComColors.lightGrey,
                labelColor: ComColors.priLightColor,
                labelStyle: TextStyle(fontSize: 15.r),
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                indicatorWeight: 3.r,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  const Tab(text: "Active"),
                  const Tab(text: "Completed"),
                  const Tab(text: "Cancelled"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ActiveOrderTabview(),
                    CompletedOrderTabview(),
                    CancelledOrderTabview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
