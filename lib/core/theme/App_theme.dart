import 'package:evently/core/theme/App_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.lightBgColor,
    primaryColor: AppColor.lightPrimaryColor,
    dividerColor: AppColor.lightDividerColor,
    primaryColorLight: AppColor.lightPrimaryColor,
    primaryColorDark: Colors.white,
    inputDecorationTheme: InputDecorationThemeData(
      prefixIconColor:Color(0xff686868) ,
      hintStyle: TextStyle(
        color: Color(0xff686868),
        fontSize: 14 ,
        fontWeight: FontWeight.w400,
      ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xffF0F0F0),
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xffF0F0F0),
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xffF0F0F0),
          )
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedItemColor: AppColor.lightPrimaryColor,
    ),
    textTheme: TextTheme(
      titleSmall:  TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: AppColor.lightPrimaryColor),
      titleLarge: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: AppColor.lightTextColor),
      titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.lightPrimaryColor,),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.lightGrayColor),

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
          foregroundColor: Colors.white,
          backgroundColor: AppColor.lightPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
          padding: EdgeInsets.all(10),
          elevation: 0
      ),
    )
  );

  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.darkBgColor,
      primaryColor: AppColor.darkPrimaryColor,
      dividerColor: AppColor.darkDividerColor,
      primaryColorLight: Colors.white,
      primaryColorDark: Color(0xff001440) ,
      inputDecorationTheme: InputDecorationThemeData(
        prefixIconColor:Color(0xffD6D6D6) ,
        hintStyle: TextStyle(
          color: Color(0xffD6D6D6),
          fontSize: 14 ,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Color(0xff001440),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xff002D8F),
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xff002D8F),
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xff002D8F),
            )
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkBgColor,
        elevation: 0,
        selectedItemColor: AppColor.darkPrimaryColor,
        unselectedItemColor: Color(0xffB9B9B9),
      ),
      textTheme: TextTheme(
        titleSmall:  TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),
        titleLarge: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: AppColor.darkTextColor),
        titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.darkPrimaryColor,),
        bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.darkGrayColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
            foregroundColor: Colors.white,
            backgroundColor: AppColor.lightPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
            padding: EdgeInsets.all(10),
            elevation: 0
        ),
      )
  );
}