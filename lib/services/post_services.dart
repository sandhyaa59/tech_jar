import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/utils/endpoints.dart';
import 'package:tech_jar/utils/helper.dart';
import 'dart:convert';

class PostService {
  static Future<dynamic> fetchPost() async {
    try {
      final response = await http.get(Uri.parse(EndPoints.postsUrl));

      List<Post> responseList = [];
      var res = handleResponse(response);
      if (res != null) {
        for (var element in jsonDecode(res)) {
          Post post = Post.fromJson(element);
          responseList.add(post);
        }
        return responseList;
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<dynamic> fetchComments() async {
    try {
      final response = await http.get(Uri.parse(EndPoints.commentsUrl));

      List<Comments> responseList = [];
      var res = handleResponse(response);
      if (res != null) {
        for (var element in jsonDecode(res)) {
          Comments comments = Comments.fromJson(element);
          responseList.add(comments);
        }
        return responseList;
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<dynamic> addComments(int postId, String comment) async {
    final response = await http.post(
      Uri.parse('${EndPoints.addCommentsUrl}/$postId/comments'),
      body: jsonEncode({
        'userId': 2,
        'body': comment,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    var res = handleResponse(response);
    if (res != null) {
      return Comments.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add comment');
    }
  }
}
