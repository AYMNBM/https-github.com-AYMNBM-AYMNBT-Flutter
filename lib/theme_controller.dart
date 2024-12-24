// TODO Implement this library.
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // الحالة الحالية للثيم
  var isDarkMode = false.obs;

  // دالة لتبديل الثيم
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  // دالة للحصول على الثيم المناسب
  ThemeData get themeData {
    return isDarkMode.value ? ThemeData.dark() : ThemeData.light();
  }
}
