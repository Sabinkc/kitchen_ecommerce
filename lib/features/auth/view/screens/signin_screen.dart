import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/auth_passwordfield.dart';
import 'package:kitchen_ecommerce/common/auth_textfield.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/forgot_password_screen.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/signup_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/landing_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
                  bottom: height * 0.5,
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
                  top: height * 0.20,
                  bottom: height * 0.20,
                  left: 30,
                  right: 30,
                  child: LayoutBuilder(
                    builder: (context, contCons) {
                      final conHeight = contCons.maxHeight;
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ComColors.priColor,
                              offset: const Offset(0, 0),
                              spreadRadius: -4,
                              blurRadius: 10,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              spacing: conHeight * 0.02,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sign in with your account!",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: conHeight * 0.01),
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: ComColors.secColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
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
                                    name: "Sign In",
                                  ),
                                ),
                                SizedBox(height: conHeight * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const SignupScreen(),
                                        ),
                                      ),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ComColors.secColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
