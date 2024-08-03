

import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/utils/database_helper.dart';

class PostDatabase{

  
  

  Future<void> insertComment(Comments comment) async {
    final db = await DatabaseHelper().database;
    await db.insert('comments', comment.toJson());
       
  }
  Future<List<Comments>> getComments() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('comments');
    return List.generate(maps.length, (i) {
      return Comments.fromJson(maps[i]);
    });
  }


  Future<void> clearComments() async {
    final db = await DatabaseHelper().database;
    await db.delete('comments');
  }

}