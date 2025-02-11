import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.whiteColor,
      indicatorColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(centerTitle: true,
      backgroundColor:AppColors.whiteColor ),
      textTheme: TextTheme(headlineLarge: AppStyles.bold16black,
      headlineMedium: AppStyles.mediam14black,
      headlineSmall: AppStyles.mediam20black));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      primaryColor: AppColors.blackColor,
      indicatorColor: AppColors.whiteColor,

      appBarTheme: AppBarTheme(centerTitle: true,
          backgroundColor:AppColors.blackColor),
      textTheme: TextTheme(headlineLarge: AppStyles.bold16white,
          headlineMedium: AppStyles.mediam14White,headlineSmall: AppStyles.mediam20white));
}
