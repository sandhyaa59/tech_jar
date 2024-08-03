import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/navigation_controller.dart';
import 'package:tech_jar/utils/route.dart';

class BottomNavBar extends StatelessWidget {
   

  BottomNavBar({super.key});
NavigationController navigationController = Get.find<NavigationController>();
  void _onItemTapped(int index) {
    navigationController.changeIndex(index);
    switch (index) {
      case 0:
        Get.offAndToNamed(Routes.POST_LIST);
        
      case 1:
        Get.offAndToNamed(Routes.PHOTO);
        
      case 2:
        Get.offAndToNamed(Routes.USER_LIST);
        
      case 3:
        Get.offAndToNamed(Routes.TODO);
        
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationBar(
        onDestinationSelected: (int index) {
          _onItemTapped(index);
        },
       
        selectedIndex: navigationController.selectedIndex.value,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            label: 'Todo',
          ),
        ],
      );
    });
  }
}
