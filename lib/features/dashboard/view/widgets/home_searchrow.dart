import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

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
          child: Container(
            height: 50,
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
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ComColors.priLightColor,
            ),
            height: 50,
            child: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
