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
    return  SafeArea(
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
          elevation: 1.0,
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
                    physics: const ScrollPhysics(),
                    itemCount: postController.postList.length,
                    itemBuilder: (context, index) {
                      var post = postController.postList[index];
                      var commentsCount = postController.commentsList
                          .where((comment) => comment.postId == post.id)
                          .length;
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.POST_DETAIL,
                              arguments: postController.postList[index]);
                        },
                        child: Card(
                          margin: const EdgeInsets.all(12.0),
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
                                   style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  postController.postList[index].body ?? "",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: Colors.blue.shade50
                                                )
                                              ),
                                              child: Text('Add Comment',
                                              style: Theme.of(context).textTheme.labelMedium),
                                            ))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.comment,
                                          size: 16.0,
                                        ),
                                        Text(
                                          ' $commentsCount comments',
                                            style: Theme.of(context).textTheme.bodySmall,
                                         
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          }
        }),
      ),
    );
  }
}
