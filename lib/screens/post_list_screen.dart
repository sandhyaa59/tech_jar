import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/utils/route.dart';
import 'package:tech_jar/widget/appbar.dart';
import 'package:tech_jar/widget/comment_bottomsheet.dart';
import 'package:tech_jar/widget/navigation_bar.dart';

class PostListScreen extends StatelessWidget {
  final PostController postController = Get.find<PostController>();
  final Map<int, bool> _likedPosts = {};
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Posts',
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
                var postId = post.id;
                if (postId != null && !_likedPosts.containsKey(postId)) {
                  _likedPosts[postId] = false;
                }

                return Card(
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
                          post.title ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 6.0),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.POST_DETAIL, arguments: post);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.body ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 6.0),
                              if ((post.body ?? "").length > 100)
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.POST_DETAIL,
                                          arguments: post);
                                    },
                                    child: const Text(
                                      'more',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _likedPosts[postId] ?? false
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: (_likedPosts[postId] ?? false)
                                        ? Colors.red
                                        : null,
                                  ),
                                  onPressed: () {
                                    if (postId != null) {
                                      _likedPosts[postId] =
                                          !(_likedPosts[postId] ?? false);

                                      (context as Element).markNeedsBuild();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.comment),
                                  onPressed: () {
                                    postController.selectedPost.value =
                                        postController.postList[index];
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.bookmark_border),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                   shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft:  Radius.circular(22.0),
                                    topRight: Radius.circular(22.0))
                                   ),
                                    context: context,
                                    isDismissible: true,
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    builder: (context) => CommentsBottomSheet(postId: postId!),
                                  );
                                },
                                child: Text(
                                  'View all ${postController.commentsList.where((comment) => comment.postId == post.id).length} comments',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              if (postController.selectedPost.value == post)
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _commentController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(6.0),
                                          hintText: 'Add a comment...',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.send),
                                      onPressed: () {
                                        if (_commentController
                                            .text.isNotEmpty) {
                                          postController.addComment(
                                              postId!, _commentController.text);
                                          _commentController.clear();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                            ],
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
