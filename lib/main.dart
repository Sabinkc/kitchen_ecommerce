import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/signin_screen.dart';

void main(List<String> args) {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, index) {
        return ProviderScope(
          child: SafeArea(
            top: false,
            bottom: true,
            child: MaterialApp(
              theme: ThemeData(
                appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
                textTheme: GoogleFonts.latoTextTheme(
                  Theme.of(context).textTheme,
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              home: const SigninScreen(),
            ),
          ),
        );
      },
    ),
  );
}
