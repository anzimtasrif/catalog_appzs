import 'package:catalog_appzs/pages/cart_page.dart';
import 'package:catalog_appzs/pages/email_page.dart';
import 'package:catalog_appzs/pages/home_page.dart';
import 'package:catalog_appzs/pages/login_page.dart';
import 'package:catalog_appzs/pages/profile_page.dart';
import 'package:catalog_appzs/pages/signup_page.dart';
import 'package:catalog_appzs/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.signUpRoute: (context) => const SignUpPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.emailRoute: (context) => EmailPage(),
      },
    );
  }
}
