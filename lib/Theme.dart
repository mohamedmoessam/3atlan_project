
import 'package:flutter/material.dart';

class MyTheme{
  static Color PrimaryLight=Color(0xffd5d5da);
  static Color BlackLight=Color(0xff000000);
  static Color GreenLight=Color(0xff00AF26);
  static Color OrangeLight=Color(0xffF39422);
  static Color BabyBlueLight=Color(0xff537EC5);
  static Color DarkBlueLight=Color(0xff010038);
  static Color DarkGreyLight=Color(0xffc0bfbf);
  static Color WhiteLight=Color(0xffffffff);
  static ThemeData LightMode = ThemeData(
    primaryColor: PrimaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor:MyTheme.WhiteLight ,
      unselectedItemColor: MyTheme.OrangeLight,

    ),
    textTheme: TextTheme(
        titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24,
            color: MyTheme.BlackLight
        ),
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyTheme.BlackLight
        ),
        titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: MyTheme.BlackLight
        ),
        bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyTheme.BlackLight
        )
    ),


  );


}