import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        accentColor: darkbluishColor,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creemColor,
        buttonColor: darkbluishColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontFamily: GoogleFonts.lato().fontFamily),
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        //  primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreemColor,
        buttonColor: lightbluishColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontFamily: GoogleFonts.lato().fontFamily),
        ),
      );
  static Color creemColor = Color(0xfff5f5f5);
  static Color darkcreemColor = Vx.gray900;
  static Color darkbluishColor = Color(0xff403b58);
  static Color lightbluishColor = Vx.indigo500;
}
