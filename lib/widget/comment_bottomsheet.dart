import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/utils/constants.dart';

class CommentsBottomSheet extends StatelessWidget {
  final int postId;
  final TextEditingController commentController = TextEditingController();
  final PostController postController = Get.find<PostController>();

  CommentsBottomSheet({required this.postId});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      initialChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Comments',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    ...postController.commentsList
                        .where((comment) => comment.postId == postId)
                        .map((comment) => Padding(
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
                  ))
                        .toList(),
                    const Divider(),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (commentController.text.isNotEmpty) {
                        postController.addComment(
                            postId, commentController.text);
                        commentController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
