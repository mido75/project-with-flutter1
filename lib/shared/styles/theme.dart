

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/shared/styles/color.dart';

ThemeData lighttheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  /*
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

   */
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:  defualtColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  /*
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      height: 1.3,
    ),

  ),

   */
  fontFamily: 'jannah',
);
