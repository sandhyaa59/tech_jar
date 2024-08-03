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
      bottomNavigationBar:  BottomNavBar(),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(Routes.POST_DETAIL,
                        arguments: postController.postList[index]);
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
                                    child: Icon(Icons.person)),
                                ],
                              ),
                      title: Text(
                        postController.postList[index].title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            postController.postList[index].body ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10.0)
,                          Row(
                            children: [
                            const  Icon(Icons.mode_comment_rounded,size: 14.0,),
                              Text(postController.commentsList.length.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
