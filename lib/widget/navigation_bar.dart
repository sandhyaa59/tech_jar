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
        break;
      case 1:
        Get.offAndToNamed(Routes.PHOTO);
        break;
      case 2:
        Get.offAndToNamed(Routes.USER_LIST);
        break;
      case 3:
        Get.offAndToNamed(Routes.TODO);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorShape: RoundedRectangleBorder(
          
            borderRadius: BorderRadius.circular(6.0)),
       indicatorColor: Colors.amber,
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
            selectedIcon: Icon(Icons.photo),
            icon: Icon(Icons.photo_album_outlined),
            label: 'Photos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: 'User',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.today),
            icon: Icon(Icons.today_outlined),
            label: 'Todo',
          ),
        ],
      );
    });
  }
}
