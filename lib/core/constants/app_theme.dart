import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  final Color primaryLight = Color(0xFF663399);
  final Color secondaryLight = Color(0xFFb1a8b9);
  final Color tertiaryLight = Color(0xFFfee9ff);

  final Color primaryDark = Color(0xFFfdf7ff);
  final Color secondaryDark = Color(0xFFbda0d3);
  final Color tertiariDark = Color(0xFF663399);

  ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.comfortaaTextTheme(
      Theme.of(context).textTheme.apply(bodyColor: Color(0xFF364955)),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryLight,
      secondary: secondaryLight,
      tertiary: tertiaryLight,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(primaryLight)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(secondaryDark),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      labelStyle: TextStyle(
        color: primaryLight,
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
      ),
      errorStyle: TextStyle(color: primaryLight),
      filled: true,
      fillColor: tertiaryLight,
      contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
    ),
    cardTheme: CardThemeData(elevation: 6.sp, shadowColor: primaryLight),
    snackBarTheme: SnackBarThemeData(backgroundColor: primaryLight),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    iconTheme: IconThemeData(color: primaryLight),
    listTileTheme: ListTileThemeData(
      iconColor: primaryLight,
      textColor: Color(0xFF364955),
      style: ListTileStyle.drawer,
    ),
  );

  ThemeData dark(BuildContext context) => ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.comfortaaTextTheme(
      Theme.of(context).textTheme.apply(bodyColor: tertiaryLight),
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryDark,
      secondary: secondaryDark,
      tertiary: tertiariDark,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(primaryDark)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(tertiariDark)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      labelStyle: TextStyle(
        color: primaryDark,
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
      ),
      errorStyle: TextStyle(color: primaryDark),
      filled: true,
      fillColor: secondaryLight,
    ),
    cardTheme: CardThemeData(
      color: tertiariDark,
      elevation: 6.sp,
      shadowColor: primaryDark,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryLight,
      contentTextStyle: TextStyle(color: primaryDark),
    ),
    iconTheme: IconThemeData(color: primaryDark),
    listTileTheme: ListTileThemeData(
      iconColor: primaryDark,
      textColor: tertiaryLight,
      style: ListTileStyle.drawer,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
