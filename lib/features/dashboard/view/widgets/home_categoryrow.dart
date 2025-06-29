import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/model_list.dart';

class HomeCategoryrow extends StatelessWidget {
  const HomeCategoryrow({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: height * 0.02,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("See all"),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  spacing: 5,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ComColors.lightGrey,
                      ),
                      padding: const EdgeInsets.all(20),

                      child: Center(
                        child: Icon(
                          categoryIcons[index],
                          size: 35,
                          color: ComColors.priLightColor,
                        ),
                      ),
                    ),
                    Text(
                      categoryList[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
