

import 'package:sqflite/sqflite.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/utils/database_helper.dart';

class PostDatabase{
  final DatabaseHelper databaseHelper=DatabaseHelper();

  
static   Future<dynamic> insertPost(Post post) async {
   clearPosts();
    final db = await DatabaseHelper().database;
   return await db.insert('posts', post.toJson());
        
  }
static  Future<dynamic> insertPosts(List<Post> posts) async {
    clearPosts();
    final db = await DatabaseHelper().database;

    Batch batch = db.batch();
    for (Post post in posts) {
      batch.insert('posts', post.toJson());
    }
    await batch.commit(noResult: true);
  }

 static Future<List<Post>> getPosts() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('posts');
    return List.generate(maps.length, (i) {
      return Post.fromJson(maps[i]);
    });
  }

 

 static Future<void> clearPosts() async {
    final db = await DatabaseHelper().database;
    await db.delete('posts');
  }

}

