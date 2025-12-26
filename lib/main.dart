import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:remainder_app_offline/bindings/remainder_bindings.dart';
import 'package:remainder_app_offline/core/constants/app_colors.dart';
import 'package:remainder_app_offline/data/models/remainder_model.dart';
import 'package:remainder_app_offline/ui/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 Hive.registerAdapter(RemainderModelAdapter());
 await Hive.openBox<RemainderModel>('remainders');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RemainderBindings(),
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
