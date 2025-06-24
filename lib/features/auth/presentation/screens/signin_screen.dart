import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/auth_passwordfield.dart';
import 'package:kitchen_ecommerce/common/auth_textfield.dart';
import 'package:kitchen_ecommerce/common/colors.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                top: height * 0.23,
                bottom: height * 0.23,
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
                            offset: Offset(0, 0),
                            spreadRadius: -4,
                            blurRadius: 10,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: conHeight * 0.02,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Sign up with your account!",
                                style: TextStyle(
                                  fontSize: conHeight * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: conHeight * 0.01),
                            Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            AuthTextfield(hintText: "Email"),

                            Text(
                              "Password",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            AuthPasswordfield(hintText: "Password"),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: ComColors.secColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: conHeight * 0.02),
                            SizedBox(
                              width: double.infinity,
                              height: conHeight * 0.1,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ComColors.priColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: conHeight * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Text("Don't have an account?"),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: ComColors.secColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}
