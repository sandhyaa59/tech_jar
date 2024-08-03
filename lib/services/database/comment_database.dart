

import 'package:sqflite/sqflite.dart';
import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/utils/database_helper.dart';

class CommentDatabase{

  
  

 static Future<void> insertComment(Comments comment) async {
    final db = await DatabaseHelper().database;
    await db.insert('comments', comment.toJson());
       
  }



static  Future<dynamic> insertComments(List<Comments> comments) async {
    clearComments();
    final db = await DatabaseHelper().database;

    Batch batch = db.batch();
    for (Comments comment in comments) {
      batch.insert('comments', comment.toJson());
    }
    await batch.commit(noResult: true);
  }

  
 static Future<List<Comments>> getComments() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('comments');
    return List.generate(maps.length, (i) {
      return Comments.fromJson(maps[i]);
    });
  }


static  Future<void> clearComments() async {
    final db = await DatabaseHelper().database;
    await db.delete('comments');
  }

}