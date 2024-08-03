import 'package:sqflite/sqflite.dart';
import 'package:tech_jar/models/user_list.dart';
import 'package:tech_jar/utils/database_helper.dart';

class UserDatabase{

 static Future<void> insertUser(Users user) async {
    final db = await  DatabaseHelper().database;
    await db.insert(
      'users',
      user.toJson(),
    );
  }

static  Future<dynamic> insertUsers(List<Users> users) async {
    clearUsers();
    final db = await DatabaseHelper().database;

    Batch batch = db.batch();
    for (Users user in users) {
      batch.insert('users', user.toJson());
    }
    await batch.commit(noResult: true);
  }

  
 static Future<List<Users>> getUsers() async {
    final db = await  DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return Users.fromJsonDb(maps[i]);
    });
  }

 static Future<void> clearUsers() async {
    final db = await  DatabaseHelper().database;
    await db.delete('users');
  }
}