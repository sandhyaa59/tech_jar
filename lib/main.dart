import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/navigation_controller.dart';
import 'package:tech_jar/utils/route.dart';
import 'package:tech_jar/widget/theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
NavigationController navigationController = Get.put(NavigationController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: 'Tech Jar',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL_LOAD,
      getPages: AppPages.pages,
    );
  }
}