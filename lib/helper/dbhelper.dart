import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  /// Returns the database instance.
  ///
  /// If the database has not been initialized, it will be initialized first.
  /// Returns the initialized database.
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  /// Initializes the database.
  ///
  /// Returns the initialized database.
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  /// Creates the database tables and schema.
  ///
  /// [db] - The database instance.
  /// [version] - The database version.
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        email TEXT PRIMARY KEY,
        password TEXT,
        loginCount INTEGER
      )
    ''');
  }

  /// Inserts user data into the database.
  ///
  /// [email] - The email of the user.
  /// [password] - The password of the user.
  /// [loginCount] - The login count of the user.
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

  /// Checks if a user with the given email and password exists in the database.
  ///
  /// [email] - The email of the user.
  /// [password] - The password of the user.
  ///
  /// Returns a map with the following keys:
  /// - 'exists' (bool): Indicates if the user exists in the database.
  /// - 'data' (int): The updated login count if the user exists.
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
