import 'package:kidsapp/database/ScoreDB.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseService {
  Database? _database;
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'score.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    try {
      var database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await create(db, version);
        },
        singleInstance: true,
      );
      return database;
    } catch (e) {
      print('Error initializing database: $e');
      // Handle the error as per your application's requirements
      rethrow; // Rethrow the error to indicate failure
    }
  }

  Future<void> create(Database database, int version) async {
    await ScoreDB().createTable(database);
  }
}
