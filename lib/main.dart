import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/features/auth/presentation/screens/signin_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SigninScreen(),
      ),
    );
  }
}
