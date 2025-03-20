import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          fontSize: 25),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 17),
      bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
    ));
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 17),
      bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
    ));
