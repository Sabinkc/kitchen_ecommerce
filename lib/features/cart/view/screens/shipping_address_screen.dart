import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/address_controller.dart';
import 'package:kitchen_ecommerce/features/settings/model/address_data.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/add_address_widget.dart';
import 'package:kitchen_ecommerce/features/settings/view/widgets/delete_address_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:developer' as logger;

class ShippingAddressScreen extends ConsumerStatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  ConsumerState<ShippingAddressScreen> createState() =>
      _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends ConsumerState<ShippingAddressScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final addRefR = ref.read(addressController);
      logger.log("selected ind: ${addRefR.selctedInd}");
      logger.log("selected location ind: ${addRefR.selectedLocationInd}");
      logger.log("selected location: ${addRefR.selectedLocation}");
      addRefR.resetSelectedInd();
      logger.log(
        "selected location ind after reset: ${addRefR.selectedLocationInd}",
      );
      logger.log("selected location after reset: ${addRefR.selectedLocation}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addRef = ref.watch(addressController);
    final addRefR = ref.read(addressController);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Shipping Address",
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
      body: Column(
        spacing: 10.h,
        children: [
          SizedBox(height: 5.h),
          Expanded(
            child: addRef.locations.isEmpty
                ? const Center(
                    child: Text("No shipping address added till now"),
                  )
                : ListView.builder(
                    itemCount: addRef.locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 3.w,
                                  children: [
                                    Icon(
                                      Icons.place_outlined,
                                      color: ComColors.priLightColor,
                                    ),
                                    Text(
                                      addRef.locations[index].place,
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.r),
                                                topRight: Radius.circular(10.r),
                                              ),
                                            ),
                                            height: 200.h,
                                            child: DeleteAddressWidget(
                                              index: index,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(
                                      MingCute.delete_2_line,
                                      color: ComColors.priLightColor,
                                      size: 20.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 15.w,
                              children: [
                                Expanded(
                                  child: Row(
                                    spacing: 3.w,
                                    children: [
                                      const Icon(
                                        Icons.place_outlined,
                                        color: Colors.transparent,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${addRef.locations[index].completeAddress},${addRef.locations[index].floor},${addRef.locations[index].landmark}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    addRefR.updateSelectedIndex(index);
                                  },
                                  child: Container(
                                    height: 20.r,
                                    width: 20.r,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ComColors.priLightColor,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: index == addRef.selctedInd
                                          ? Container(
                                              decoration: BoxDecoration(
                                                color: ComColors.priLightColor,
                                                shape: BoxShape.circle,
                                              ),

                                              height: 10.r,
                                              width: 10.r,
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            if (index != addresses.length - 1)
                              Divider(color: ComColors.lightGrey),
                          ],
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [4, 4],
                strokeWidth: 1.5.r,
                color: ComColors.priLightColor,
                radius: Radius.circular(10.r),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const AddAddressWidget();
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ComColors.lightGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: ComColors.priLightColor),
                      Text(
                        "Add New Shippping Address",
                        style: TextStyle(color: ComColors.priLightColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // const Spacer(),
          if (addRef.locations.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              height: 70.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ComColors.priLightColor,
                ),
                onPressed: () {
                  addRefR.updateLocation(addRefR.selctedInd);
                  Navigator.pop(context);
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
                    Overlay.of(context),
                    CustomSnackBar.success(
                      backgroundColor: ComColors.priLightColor,

                      message: "Shipping Address updated successfully!",
                    ),
                  );
                },
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
