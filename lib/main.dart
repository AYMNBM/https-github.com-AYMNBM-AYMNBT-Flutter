import 'package:flutter/material.dart';
import 'dart:math';
import 'widgets/aymnbt.dart';
import 'constants/app_colors.dart';
import 'screens/aymn_form_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نموذج أيمن',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      home: const AYMNFormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Offset buttonPosition;
  Color currentColor = AppColors.defaultButtonColor;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    // بداية في وسط الشاشة
    buttonPosition = const Offset(0, 0);
  }

  void _updateButtonPosition(Size screenSize) {
    // حساب موقع عشوائي جديد مع مراعاة حجم الزر
    final double maxX = screenSize.width - 100;
    final double maxY = screenSize.height - 100;
    
    setState(() {
      buttonPosition = Offset(
        random.nextDouble() * maxX,
        random.nextDouble() * maxY,
      );
      // تغيير اللون بشكل عشوائي
      currentColor = AppColors.buttonColors[
        random.nextInt(AppColors.buttonColors.length)
      ];
    });

    // إظهار رسالة عند تغيير المكان واللون
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تم تغيير مكان ولون الزر'),
        backgroundColor: currentColor,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('زر AYMNBT المتحرك'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: buttonPosition.dx,
            top: buttonPosition.dy,
            child: AYMNBT(
              text: 'انقر للتغيير\nالمكان',
              backgroundColor: currentColor,
              onPressed: () => _updateButtonPosition(screenSize),
            ),
          ),
        ],
      ),
    );
  }
}