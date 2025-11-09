import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService.instance;
  static Database? _db;

  final String _tasksTableName = 'tasks';
  final String _tasksIdColumnName = "id";
  final String _tasksContentColumnName = "content";
  final String _tasksStatusColumnName = "status";

  DatabaseService._constructor();
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databseDirPath = await getDatabasesPath();
    final databasePath = join(databseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute(''' 
        CREATE TABLE $_tasksTableName(
          $_tasksIdColumnName INTEGER PRIMARY KEY,
          $_tasksContentColumnName TEXT NOT NULL,
          $_tasksStatusColumnName INTEGER NOT NUL
        )
        ''');
      },
    );
    return database;
  }
}
