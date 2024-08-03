

import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/utils/database_helper.dart';

class PostDatabase{
  final DatabaseHelper databaseHelper=DatabaseHelper();

  
   Future<dynamic> insertPost(Post post) async {
   clearPosts();
    final db = await DatabaseHelper().database;
   return await db.insert('posts', post.toJson());
        
  }


  Future<List<Post>> getPosts() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('posts');
    return List.generate(maps.length, (i) {
      return Post.fromJson(maps[i]);
    });
  }

 

  Future<void> clearPosts() async {
    final db = await DatabaseHelper().database;
    await db.delete('posts');
  }

}

