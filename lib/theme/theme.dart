import 'package:flutter/material.dart';

final ThemeData monoDarkBlueTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(error: Color(0xFFB00020)),
  primaryColor: Color(0xFF0D1B2A),
  scaffoldBackgroundColor: Color(0xFF1B263B),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF0D1B2A),
    foregroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Color(0xFF0D1B2A),
    elevation: 0
    /* backgroundColor: Color(0xFF0D1B2A),
    foregroundColor: Colors.white,
    centerTitle: true,
    elevation: 0, */
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF415A77),
    foregroundColor: Colors.white,
  ),

  /* inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1B263B),
    hintStyle: TextStyle(color: Colors.white38),
    labelStyle: TextStyle(color: Colors.white70),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFF415A77)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFFB00020)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFFB00020)),
    ),
  ), */
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      color: Color(0xFFB0BCCF), // softer bluish-white tone
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  cardColor: Color(0xFF415A77),
  iconTheme: IconThemeData(color: Colors.white70),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(
        0xFFB0BCCF,
      ), // cancel gibi şeyler için yumuşak mavi-gri
      textStyle: TextStyle(fontWeight: FontWeight.w500),
    ),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Color(0xFF415A77),
    textColor: Colors.white,
    iconColor: Colors.white,
  ),
);

