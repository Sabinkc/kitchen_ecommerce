import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:kitchen_ecommerce/common/auth_passwordfield.dart';
import 'package:kitchen_ecommerce/common/auth_textfield.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/signin_screen.dart';
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign up with your account!",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: conHeight * 0.001),
                                const Text(
                                  "Full Name",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const AuthTextfield(
                                  hintText: "Full Name",
                                  prefixIcon: Icons.person_2_outlined,
                                ),
                                const Text(
                                  "Email",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const AuthTextfield(
                                  hintText: "Email",
                                  prefixIcon: Icons.email_outlined,
                                ),

                                const Text(
                                  "Password",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),

                                const AuthPasswordfield(hintText: "Password"),
                                const Text(
                                  "Min, 8 char, inc 1 uppercase and lowercase letter, 1 number and 1 special character",
                                  style: TextStyle(
                                    // color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Text(
                                  "Confirm Password",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const AuthPasswordfield(
                                  hintText: "Confirm Password",
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "I agree to the ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                        color: ComColors.secColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: conHeight * 0.01),
                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ComButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => const LandingScreen(),
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
                                    const Text("Already have an account?"),
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
