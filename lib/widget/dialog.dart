import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';

class CommentDialog {
  static void show() {
    final TextEditingController commentController = TextEditingController();
    final PostController postController = Get.find<PostController>();

    Get.dialog(
      AlertDialog(
        title: const Text('Add Comment'),
        content: TextFormField(
          controller: commentController,
          validator: 
       (value) {
            if (value!.isEmpty) {
              return 'Enter Comment';
            } else {
              return null;
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async{
              Get.back();
                    await  postController.addComment(
                        postController.selectedPost.value.id!,
                        commentController.text,
                      );
                    
                  
                  },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
