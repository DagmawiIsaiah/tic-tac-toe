import 'package:flutter/material.dart';

class CustomColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color lightPurple = Color.fromARGB(255, 169, 105, 227);
  static const Color darkPurple = Color.fromARGB(255, 112, 75, 206);
}

class CustomTheme {
  static const TextTheme darkTextTheme = TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );

  static ThemeData customTheme = ThemeData(
    textTheme: darkTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomColors.darkPurple,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     foregroundColor: CustomColors.darkPurple,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   )
    // ),
  );
}
