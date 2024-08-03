import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/utils/constants.dart';
import 'package:tech_jar/widget/formfields.dart';

class PostDetailScreen extends StatelessWidget {
  final postController = Get.find<PostController>();
  final Post post = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${post.title} \' post',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 1.0,
          // backgroundColor: Colors.red,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: customFormField(
            
              hintText: 'Comment...',
              iconButton: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(
                    Icons.send_sharp,
                    color: Colors.blue,
                    size: 16.0,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [details()],
          ),
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
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Comments',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: Get.size.height,
            child: ListView.builder(
              itemCount: postController.commentsList.length,
              itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postController.commentsList[index].name ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14.0),
                  ),
                  const SizedBox(height: 5.0),
                  Text(postController.commentsList[index].body ?? ""),
                  const SizedBox(height: 5.0),
                  const Divider(),
                  const SizedBox(height: 5.0),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
