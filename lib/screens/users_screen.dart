import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/user_controller.dart';
import 'package:tech_jar/widget/appbar.dart';
import 'package:tech_jar/widget/navigation_bar.dart';

class UserScreen extends StatelessWidget {
  final userController=Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'USers'
      ),
      bottomNavigationBar: BottomNavBar(),
     body: Obx(() {
          if (userController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: const EdgeInsets.all(12.0),
              height: Get.size.height,
              child: ListView.builder(

                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: userController.userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        // Get.toNamed(Routes.POST_DETAIL,
                        // arguments: postController.postList[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignCenter,
                              color: Colors.grey, style: BorderStyle.solid)),
                              leading: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: const Icon(Icons.person)),
                                ],
                              ),
                      title: Text(
                        userController.userList[index].name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            userController.userList[index].email ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
    );
  }
}
