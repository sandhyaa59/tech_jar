import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/todo_controller.dart';
import 'package:tech_jar/utils/loading_overlay.dart';
import 'package:tech_jar/widget/appbar.dart';
import 'package:tech_jar/widget/navigation_bar.dart';

class TodoScreen extends StatelessWidget {
  final todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Todo'),
      bottomNavigationBar: BottomNavBar(),
      body: Obx(() {
        return LoadingOverlay(
            isLoading: todoController.isLoading.value,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: Get.size.height,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: todoController.todoList.length,
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
                              color: Colors.grey,
                              style: BorderStyle.solid)),
                      title: Text(
                        todoController.todoList[index].title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                              todoController.todoList[index].completed == true
                                  ? "Done"
                                  : "Pending",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: todoController
                                              .todoList[index].completed ==
                                          true
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 14.0)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
      }),
    );
  }
}
