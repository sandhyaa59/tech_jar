import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/utils/route.dart';
import 'package:tech_jar/widget/navigation_bar.dart';

class PostListScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        // elevation: 1.0,
        // backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
              padding: const EdgeInsets.all(12.0),
              height: Get.size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: postController.postList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.toNamed(Routes.POST_DETAIL,arguments: postController.postList[index]);
                      },
                      child: Card(
                        margin:const EdgeInsets.all(12.0),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postController.postList[index].title ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                postController.postList[index].title ?? "",
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.comment,
                                    size: 16.0,
                                  ),
                                  Text(
                                    ' ${postController.commentsList.length.toString()} comments',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
        }
      }),
    ));
  }
}
