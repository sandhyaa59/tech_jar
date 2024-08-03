import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/services/post_services.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  var postList = <Post>[].obs;
  var list = Post().obs;
var postId = 0;
  var commentsList = <Comments>[].obs;
  var comment = Comments().obs;
  @override
  void onInit() {
    fetchPosts();
    fetchComment();
    super.onInit();
  }

  fetchPosts() async {
    try {
      isLoading.value = true;

      postList.value = await PostService.fetchPost();
      isLoading.value = false;
      if (postList.isNotEmpty) {
        return postList;
      }
    
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  fetchComment() async {
    try {
      isLoading.value = true;
      commentsList.value = await PostService.fetchComments();
       isLoading.value = false;
      if (commentsList.isNotEmpty) {
        return commentsList;
      }
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void addComment(String name, String body) async {
    try {
      isLoading(true);
      var comment = await PostService.addComments(postId, name, body);
      if (comment != null) {
        commentsList.add(comment);
      }
    } finally {
      isLoading(false);
    }
  }
}



// class PostController extends GetxController {
//   var isLoading = false.obs;
//   var postList = <Post>[].obs;
//   var commentsList = <Comments>[].obs;
//   var postId = 0;
//   var comment = Comments().obs;

//   final DatabaseHelper _dbHelper = DatabaseHelper();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPosts();
//     fetchComments();
//   }

//   Future<void> fetchPosts() async {
//     try {
//       isLoading.value = true;
//       postList.value = await _dbHelper.getPosts();
//       if (postList.isEmpty) {
//         var postsFromApi = await PostService.fetchPost();
//         if (postsFromApi.isNotEmpty) {
//           postList.value = postsFromApi;
//           for (var post in postsFromApi) {
//             await _dbHelper.insertPost(post);
//           }
//         }
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchComments() async {
//     try {
//       isLoading.value = true;
//       commentsList.value = await _dbHelper.getComments();
//       if (commentsList.isEmpty) {
//         var commentsFromApi = await PostService.fetchComments();
//         if (commentsFromApi.isNotEmpty) {
//           commentsList.value = commentsFromApi;
//           for (var comment in commentsFromApi) {
//             await _dbHelper.insertComment(comment);
//           }
//         }
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> addComment(String name, String body) async {
//     try {
//       isLoading.value = true;
//       var newComment = await PostService.addComments(postId, name, body);
//       if (newComment != null) {
//         commentsList.add(newComment);
//         await _dbHelper.insertComment(newComment);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
