import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/themes/themes.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeData get lightTheme => AppThemes.lightTheme;
  ThemeData get darkTheme => AppThemes.darkTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
