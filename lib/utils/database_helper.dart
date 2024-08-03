import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tech_jar/models/comments_list.dart';
import 'package:tech_jar/models/post_list.dart';
import 'package:tech_jar/models/user_list.dart'; // Import the User model

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tech_jar.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)',
    );
    await db.execute(
      'CREATE TABLE comments(id INTEGER PRIMARY KEY, postId INTEGER, name TEXT, body TEXT)',
    );
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
    );
  }

  // Post CRUD operations
  // Future<void> insertPost(Post post) async {
  //   final db = await database;
  //   await db.insert('posts', post.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<void> insertComment(Comments comment) async {
  //   final db = await database;
  //   await db.insert('comments', comment.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<List<Post>> getPosts() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('posts');
  //   return List.generate(maps.length, (i) {
  //     return Post.fromJson(maps[i]);
  //   });
  // }

  // Future<List<Comments>> getComments() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('comments');
  //   return List.generate(maps.length, (i) {
  //     return Comments.fromJson(maps[i]);
  //   });
  // }

  // Future<void> clearPosts() async {
  //   final db = await database;
  //   await db.delete('posts');
  // }

  // Future<void> clearComments() async {
  //   final db = await database;
  //   await db.delete('comments');
  // }

  // User CRUD operations
  Future<void> insertUser(Users user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toJson(),
    );
  }

  Future<List<Users>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return Users.fromJson(maps[i]);
    });
  }

  Future<void> clearUsers() async {
    final db = await database;
    await db.delete('users');
  }
}
