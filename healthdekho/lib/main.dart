import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:healthdekho/common/app_theme.dart';
import 'package:healthdekho/presentation/controllers/theme_controller.dart';
import 'package:healthdekho/routes/app_routes.dart';

void main() async{

WidgetsFlutterBinding.ensureInitialized();

Get.put(ThemeController());

 runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetBuilder<ThemeController>(
      builder:(_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.blueAccent,
          title: 'Health Dekho',
          initialRoute: '/',
          getPages: AppRoutes.routes,
          theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeController.theme,
        );
      },
    );
  }
}