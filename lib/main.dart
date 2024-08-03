import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/navigation_controller.dart';
import 'package:tech_jar/utils/route.dart';

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
       theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: const Color(0xff596cff),
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
      debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL_LOAD,
      getPages: AppPages.pages,
    );
  }
}