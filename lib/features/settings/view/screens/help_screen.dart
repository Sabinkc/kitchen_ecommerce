import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/contactus_widget.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/faq_widget.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const Text(
              "Help Center",
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
                    border: Border.all(
                      color: ComColors.lightGrey,
                      width: 1.3.r,
                    ),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              spacing: 10.h,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: ComColors.priLightColor,
                      size: 25.r,
                    ),
                    hintText: "Search..",

                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15.r),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: ComColors.lightGrey,
                        width: 1.7.r,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: ComColors.secColor,
                        width: 1.5.r,
                      ),
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: ComColors.priLightColor,
                  dividerColor: ComColors.lightGrey,
                  labelColor: ComColors.priLightColor,
                  labelStyle: TextStyle(fontSize: 15.r),
                  unselectedLabelStyle: const TextStyle(color: Colors.grey),
                  indicatorWeight: 4.r,
                  indicatorSize: TabBarIndicatorSize.tab,

                  tabs: [
                    const Tab(text: "FAQ"),

                    const Tab(text: "Contact Us"),
                  ],
                ),
                const Expanded(
                  child: TabBarView(children: [FaqWidget(), ContactusWidget()]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
