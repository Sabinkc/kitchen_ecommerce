import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/cart/controller/address_controller.dart';
import 'package:kitchen_ecommerce/features/settings/controller/add_address_controller.dart';
import 'package:kitchen_ecommerce/features/settings/model/address_data.dart';
import 'package:kitchen_ecommerce/features/settings/model/address_item_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddAddressWidget extends ConsumerStatefulWidget {
  const AddAddressWidget({super.key});

  @override
  ConsumerState<AddAddressWidget> createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends ConsumerState<AddAddressWidget> {
  final TextEditingController compAddressCont = TextEditingController();
  final TextEditingController floorCont = TextEditingController();
  final TextEditingController landMarkCont = TextEditingController();

  @override
  void dispose() {
    compAddressCont.dispose();
    floorCont.dispose();
    landMarkCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final addAddRef = ref.watch(addAddressController);
    final addAddRefR = ref.read(addAddressController);
    final addRefR = ref.read(addressController);

    return KeyboardDismisser(
      child: Container(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 10.h,
          bottom: 15.h,
        ),
        height: height * 0.7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),

        child: Column(
          spacing: 7.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel, color: Colors.grey, size: 25.r),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 7.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Save address as *",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: InkWell(
                              onTap: () {
                                addAddRefR.updateSelctedIdnex(index);
                                addAddRefR.updateSelectedPlace(places[index]);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == addAddRef.selectedIndex
                                      ? ComColors.priLightColor
                                      : ComColors.lightGrey,
                                ),

                                child: Center(
                                  child: Text(
                                    places[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: index == addAddRef.selectedIndex
                                          ? Colors.white
                                          : ComColors.priLightColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text("Complete address", style: TextStyle(fontSize: 17.sp)),
                    TextField(
                      controller: compAddressCont,
                      decoration: InputDecoration(
                        hintText: "Enter address*",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        fillColor: ComColors.lightGrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: ComColors.secColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      maxLines: 3,
                    ),

                    Text("Floor", style: TextStyle(fontSize: 17.sp)),
                    TextField(
                      controller: floorCont,
                      decoration: InputDecoration(
                        hintText: "Enter Floor",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        fillColor: ComColors.lightGrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: ComColors.secColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Text("Landmark", style: TextStyle(fontSize: 17.sp)),
                    TextField(
                      controller: landMarkCont,
                      decoration: InputDecoration(
                        hintText: "Enter Landmark",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        fillColor: ComColors.lightGrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: ComColors.secColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ComColors.priLightColor,
                ),
                onPressed: () {
                  if (floorCont.text.trim().isEmpty ||
                      landMarkCont.text.trim().isEmpty ||
                      compAddressCont.text.trim().isEmpty) {
                    showTopSnackBar(
                      displayDuration: const Duration(milliseconds: 500),
                      Overlay.of(context),
                      CustomSnackBar.error(
                        backgroundColor: ComColors.darkRed,
                        message: "All fields are required!",
                      ),
                    );
                    return;
                  }
                  if (addRefR.locations.length > 4) {
                    showTopSnackBar(
                      displayDuration: const Duration(milliseconds: 500),
                      Overlay.of(context),
                      CustomSnackBar.error(
                        backgroundColor: ComColors.darkRed,
                        message:
                            "You cannot add more than 5 addresses! Delete some first.",
                      ),
                    );
                    return;
                  }
                  addRefR.addLocation(
                    AddressItemModel(
                      place: addAddRefR.selectedPlace,
                      floor: floorCont.text.trim(),
                      landmark: landMarkCont.text.trim(),
                      completeAddress: compAddressCont.text.trim(),
                    ),
                  );
                  Navigator.pop(context);
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 500),
                    Overlay.of(context),
                    CustomSnackBar.success(
                      backgroundColor: ComColors.priLightColor,

                      message: "Address added successfully!",
                    ),
                  );
                },
                child: Text(
                  "Save address",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
