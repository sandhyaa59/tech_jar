import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      'CREATE TABLE comments(id INTEGER PRIMARY KEY,email TEXT, postId INTEGER, name TEXT, body TEXT)',
    );
    await db.execute(
      'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE NOT NULL,name TEXT,email TEXT UNIQUE,address TEXT,website TEXT,company TEXT,phone TEXT)' 
    );
  }
}
