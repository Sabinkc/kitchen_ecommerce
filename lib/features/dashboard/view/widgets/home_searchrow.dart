import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/filter_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/search_screen.dart';

class HomeSearchRow extends StatelessWidget {
  const HomeSearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Flexible(
          flex: 5,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Container(
              height: 40.h,
              // width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ComColors.lightGrey,
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(),
                  Icon(
                    Icons.search_outlined,
                    color: ComColors.priLightColor,
                    size: 30,
                  ),
                  const Text(
                    "Search items",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: InkWell(
            onTap: () {
              // logger.log("button pressed");
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const FilterScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ComColors.priLightColor,
              ),
              height: 40.h,
              child: const Icon(Icons.filter_list, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
