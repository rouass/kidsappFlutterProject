import 'dart:async';
import 'package:kidsapp/model/Score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static late DatabaseFactory dbFactory;
  static Database? _database;

  DatabaseService._init() {
    dbFactory = databaseFactoryFfi;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('scores.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableScores (
  ${ScoreFields.id} $idType,
  ${ScoreFields.gameName} $textType,
  ${ScoreFields.score} $integerType
)
''');

    await db.execute('''
CREATE TABLE gameState (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  attempts INTEGER NOT NULL,
  score INTEGER NOT NULL,
  randomNumber1 INTEGER,
  randomNumber2 INTEGER,
  symbol TEXT
)
''');
  }

  Future<Score> create(Score score) async {
    final db = await instance.database;
    final id = await db.insert(tableScores, score.toJson());
    return score.copy(id: id);
  }

  Future<Score?> readScore(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableScores,
      columns: ScoreFields.values,
      where: '${ScoreFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Score.fromJson(maps.first);
    } else {
      return null;
    }
  }
  Future<void> initializeGameScore(String gameName) async {
    final db = await instance.database;
    final maps = await db.query(
      tableScores,
      where: '${ScoreFields.gameName} = ?',
      whereArgs: [gameName],
    );

    if (maps.isEmpty) {
      await create(Score(gameName: gameName, score: 0, id: 0));
    } else {
      print('Score entry for $gameName already exists.');
    }
  }



  Future<void> saveGameState(int attempts, int score, int? randomNumber1, int? randomNumber2, String? symbol) async {
    final db = await instance.database;
    await db.insert('gameState', {
      'attempts': attempts,
      'score': score,
      'randomNumber1': randomNumber1,
      'randomNumber2': randomNumber2,
      'symbol': symbol
    });
  }

  Future<Map<String, dynamic>?> loadGameState() async {
    final db = await instance.database;
    final maps = await db.query('gameState', limit: 1, orderBy: 'id DESC');
    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  Future<void> clearGameState() async {
    final db = await instance.database;
    await db.delete('gameState');
  }

  Future<void> updateScore(int id, int scoreIncrement) async {
    final db = await instance.database;
    final score = await readScore(id);
    if (score != null) {
      final updatedScore = score.copy(score: score.score + scoreIncrement);
      await db.update(tableScores, updatedScore.toJson(), where: '${ScoreFields.id} = ?', whereArgs: [score.id]);
    }
  }

}
