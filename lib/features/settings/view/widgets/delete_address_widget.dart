import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/address_controller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DeleteAddressWidget extends ConsumerWidget {
  final int index;
  const DeleteAddressWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addRefR = ref.read(addressController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Column(
        spacing: 10.h,
        children: [
          Text(
            "Delete address?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          Divider(color: ComColors.lightGrey, height: 20.h),

          Text(
            "Are you sure you want to delete this address?",
            style: TextStyle(color: Colors.grey, fontSize: 16.sp),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 30.w,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 37.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ComColors.lightGrey,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ComColors.priLightColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 37.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ComColors.priLightColor,
                      elevation: 0,
                    ),
                    onPressed: () {
                      addRefR.deleteLocation(index);
                      Navigator.pop(context);
                      showTopSnackBar(
                        displayDuration: const Duration(milliseconds: 500),
                        Overlay.of(context),
                        CustomSnackBar.success(
                          backgroundColor: ComColors.priLightColor,

                          message: "Address deleted successfullly!",
                        ),
                      );
                    },
                    child: const Text(
                      "Yes, Delete",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
