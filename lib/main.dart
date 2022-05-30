import 'package:flutter/material.dart';
import 'package:fluttercatalog/pages/cart_page.dart';
import 'package:fluttercatalog/utils/routes.dart';
import 'package:fluttercatalog/widgets/theme.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => loginpage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => loginpage(),
        MyRoutes.cartRoute: (context) => cartpage(),
      },
    );
  }
}
