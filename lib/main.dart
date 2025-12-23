import 'package:flutter/material.dart';
import 'package:remainder_app_offline/core/app_colors.dart';
import 'package:remainder_app_offline/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
      home: HomePage(),
    );
  }
}
