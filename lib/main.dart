import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: _getTheme
    ),
  );
}

get _getTheme=>ThemeData.light().copyWith(
  primaryColor: AppColors.white,
  // accentColor: AppColors.black,
  // backgroundColor: AppColors.black,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme:AppBarTheme(
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(
      color: AppColors.pink
    )
  ),
);