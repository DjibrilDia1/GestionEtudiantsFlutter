import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gestion_des_etudiants_flut/Models/students.dart';

class DatabaseHelper {
  final databaseName = "students.db";

  String users =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT, usrEmail TEXT UNIQUE)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(users);
      },
    );
  }

  // Méthode pour obtenir le chemin complet de la base de données
  Future<String> getDatabasePath() async {
    final databasePath = await getDatabasesPath();
    return join(databasePath, databaseName);
  }

  //login method
  Future<bool> login(Students user) async {
    final Database db = await initDB();

    var result = await db.query(
      'users',
      where: 'usrEmail = ? AND usrPassword = ?',
      whereArgs: [user.usrEmail, user.usrPassword],
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> signup(Students user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }
}
