import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              // leading: Padding(
              //   padding: const EdgeInsetsGeometry.only(left: 12),
              //   child: InkWell(
              //     onTap: () => Navigator.pop(context),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.white,
              //         border: Border.all(
              //           color: ComColors.lightGrey,
              //           width: 1.3.r,
              //         ),
              //       ),
              //       child: const Icon(Icons.arrow_back),
              //     ),
              //   ),
              // ),
              actions: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 12.w),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(7.r),
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
                SizedBox(width: 15.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: ComColors.lightGrey,
                          filled: true,
                          hintText: "Search.....",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.search, size: 27.r),
                          prefixIconColor: ComColors.priLightColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),

                            borderSide: BorderSide(
                              width: 2,
                              color: ComColors.secColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),

                            borderSide: BorderSide(
                              width: 2,
                              color: ComColors.lightGrey,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
