import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:road_runner_rider/shared/shared.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.fairlyWhite,
  textTheme: TextTheme(
    // headline1: const TextStyle(fontSize: 102.0, fontWeight: FontWeight.bold),
    // headline6: const TextStyle(fontSize: 306.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      color: AppColors.navyBlue,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.navyBlue,
    size: 24,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
    accentColor: AppColors.solidOrange,
    brightness: Brightness.light,
    backgroundColor: AppColors.fairlyWhite,
  ).copyWith(
    secondary: AppColors.tangoOrange,
  ),
);
