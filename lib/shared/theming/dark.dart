import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:road_runner_rider/shared/shared.dart';

//FONTS
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.tribeIndigo,
    textTheme: TextTheme(
      // headline1: const TextStyle(fontSize: 102.0, fontWeight: FontWeight.bold),
      // headline6: const TextStyle(fontSize: 306.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        color: AppColors.fairlyWhite,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.fairlyWhite,
      size: 24.0,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
      accentColor: AppColors.solidOrange,
      brightness: Brightness.dark,
      backgroundColor: AppColors.navyBlue,
    ).copyWith(
      secondary: AppColors.navyBlue,
    ));
