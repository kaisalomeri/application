import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor =
      Color(0xFF354B9F); // Your specified primary color

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: Color(0xFFDBF4EA), // Example secondary color
        background: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Button background color
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
        primary: primaryColor,
        secondary: Colors.tealAccent, // Example secondary color for dark theme
        background: Colors.grey[900],
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Button background color
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }
}
