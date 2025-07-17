import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/auth_passwordfield.dart';
import 'package:kitchen_ecommerce/common/auth_textfield.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/signin_screen.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/terms_and_condition_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/landing_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: height * 0.7,
                  child: Container(color: ComColors.priColor),
                ),
                Positioned(
                  top: height * 0.02,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/icons/k_logo.png",
                    height: height * 0.2,
                    width: height * 0.2,
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LayoutBuilder(
                    builder: (context, conConst) {
                      final conHeight = conConst.maxHeight;
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            // top: 10,
                            left: 30,
                            right: 30,
                            // bottom: 30,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              spacing: conHeight * 0.02,
                              children: [
                                // const SizedBox(height: 1),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign up with your account!",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: conHeight * 0.001),
                                Text(
                                  "Full Name",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  child: const AuthTextfield(
                                    hintText: "Full Name",
                                    prefixIcon: Icons.person_2_outlined,
                                  ),
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  child: const AuthTextfield(
                                    hintText: "Email",
                                    prefixIcon: Icons.email_outlined,
                                  ),
                                ),

                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(
                                  height: 50.h,
                                  child: const AuthPasswordfield(
                                    hintText: "Password",
                                  ),
                                ),
                                Text(
                                  "Min, 8 char, inc 1 uppercase and lowercase letter, 1 number and 1 special character",
                                  style: TextStyle(
                                    // color: Colors.grey,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  child: const AuthPasswordfield(
                                    hintText: "Confirm Password",
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 5),
                                    Text(
                                      "I agree to the ",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionsScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Terms & Conditions",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ComColors.secColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: conHeight * 0.01),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50.h,
                                  child: ComButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const LandingScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    name: "Sign Up",
                                  ),
                                ),

                                SizedBox(height: conHeight * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const SigninScreen(),
                                        ),
                                      ),
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ComColors.secColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
