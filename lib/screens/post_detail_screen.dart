import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/utils/constants.dart';
import 'package:tech_jar/widget/appbar.dart';
import 'package:tech_jar/widget/dialog.dart';
import 'package:tech_jar/widget/formfields.dart';

class PostDetailScreen extends StatelessWidget {
  final postController = Get.find<PostController>();
  final Post post = Get.arguments;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${post.title}\'s post',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: details(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(6.0),
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // if (commentController
                      //     .text.isNotEmpty) {
                      //   postController.addComment(
                      //       po!, _commentController.text);
                      //   _commentController.clear();
                      // }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget details() {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.size.width,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color(0xff939185))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title ?? "",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  post.body ?? "",
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'All Comments',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: Get.size.height,
            child: Obx(() {
              var postComments = postController.commentsList
                  .where((comment) => comment.postId == post.id)
                  .toList();
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: postComments.length,
                itemBuilder: (context, index) {
                  var comment = postComments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      elevation: 5.0,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue.shade50),
                        borderRadius: BorderRadius.circular(12.0),
                        // border:
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(kPadding),
                        decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Colors.white)],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.blue.shade50)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.name ?? "",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 6.0),
                              Text(comment.body ?? ""),
                              const SizedBox(height: 6.0),
                            ]),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
