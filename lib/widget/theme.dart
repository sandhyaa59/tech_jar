import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.amber,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.amber,
        elevation: 1.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 14.0),
        bodySmall: TextStyle(color: Colors.black, fontSize: 12.0),
        bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        buttonColor: Colors.amber,
      ),
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
    );
  }
}
