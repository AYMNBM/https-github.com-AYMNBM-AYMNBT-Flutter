import 'package:aymnwork/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX AYMN',
        theme: themeController.themeData, // استخدام الثيم من ThemeController
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX AYMN'),
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkMode.value
                ? Icons.wb_sunny
                : Icons.nightlight_round),
            onPressed: () {
              themeController.toggleTheme(); // تبديل الثيم عند الضغط على الزر
            },
          ),
        ],
      ),
      body: Center(
        // استخدام Center لتوسيع الزر إلى وسط الشاشة
        child: ElevatedButton(
          onPressed: () {
            themeController.toggleTheme(); // تبديل الثيم عند الضغط على الزر
          },
          child: Text('تبديل الثيم'),
        ),
      ),
    );
  }
}
