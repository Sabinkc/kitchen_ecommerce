import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/auth_passwordfield.dart';
import 'package:kitchen_ecommerce/common/auth_textfield.dart';
import 'package:kitchen_ecommerce/common/button.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/presentation/screens/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: conHeight * 0.02,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Sign up with your account!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: conHeight * 0.001),
                            Text(
                              "Full Name",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            AuthTextfield(hintText: "Full Name"),
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
                            Text(
                              "Confirm Password",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            AuthPasswordfield(hintText: "Confirm Password"),

                            SizedBox(height: conHeight * 0.01),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ComButton(),
                            ),
                            SizedBox(height: conHeight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Text("Already have an account?"),
                                InkWell(
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => SigninScreen(),
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
