import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/services/database/comment_database.dart';
import 'package:tech_jar/services/database/post_database.dart';
import 'package:tech_jar/services/post_services.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  var postList = <Post>[].obs;
  var commentsList = <Comments>[].obs;
  var selectedPost= Post().obs;

var post=Post().obs;
  @override
  void onInit() {
    fetchPosts();
    fetchComments();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      postList.value = await PostService.fetchPost();
      if (postList.isEmpty) {
        PostDatabase.getPosts();
      } else {
        PostDatabase.insertPosts(postList);
      }
    } catch (e) {
      postList.value = await PostDatabase.getPosts();
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchComments() async {
    try {
      isLoading.value = true;
      commentsList.value = await PostService.fetchComments();
      if (commentsList.isEmpty) {
        CommentDatabase.getComments();
      } else {
        CommentDatabase.insertComments(commentsList);
      }
    } catch (e) {
      commentsList.value = await CommentDatabase.getComments();
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addComment(int id, String comment) async {
    try {
      isLoading.value = true;
     await PostService.addComments(id, comment);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }



  
}
    // const SizedBox(height: 8.0),
    //                           if (postController.selectedPost.value == post)
    //                             Row(
    //                               children: [
    //                                 Expanded(
    //                                   child: TextFormField(
    //                                     controller: _commentController,
    //                                     decoration: const InputDecoration(
    //                                       contentPadding: EdgeInsets.all(6.0),
    //                                       hintText: 'Add a comment...',
    //                                       hintStyle:
    //                                           TextStyle(color: Colors.grey),
    //                                       border: InputBorder.none,
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 IconButton(
    //                                   icon: const Icon(Icons.send),
    //                                   onPressed: () {
    //                                     if (_commentController
    //                                         .text.isNotEmpty) {
    //                                       postController.addComment(
    //                                           postId!, _commentController.text);
    //                                       _commentController.clear();
    //                                     }
    //                                   },
    //                                 ),
    //                               ],
    //                             ),