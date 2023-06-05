import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        email TEXT PRIMARY KEY,
        password TEXT,
        loginCount INTEGER
      )
    ''');
  }

  Future<void> insert(String email, String password, int loginCount) async {
    final db = await instance.database;
    await db.insert(
      'my_table',
      {
        'email': email,
        'password': password,
        'loginCount': loginCount,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> isUserStored(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'my_table',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      final loginCount = result.first['loginCount'] as int;
      final updatedLoginCount = loginCount + 1;
      await db.update(
        'my_table',
        {'loginCount': updatedLoginCount},
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      return {'exists': true, 'data': updatedLoginCount};
    } else {
      insert(email, password, 1);
      return {'exists': false};
    }
  }

}
