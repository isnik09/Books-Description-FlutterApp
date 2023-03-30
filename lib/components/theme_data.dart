import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_books_app/components/colors.dart';

ThemeData AppTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.vartaTextTheme(Theme.of(context).textTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.accent,
        elevation: 0,
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
