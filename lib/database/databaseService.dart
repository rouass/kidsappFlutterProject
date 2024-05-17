import 'dart:async';
import 'package:kidsapp/model/Score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' ;
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
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('scores.db');
    return _database!;
  }
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath , filePath);
    return await openDatabase(path , version: 1 , onCreate: _createDB );
  }
 Future  _createDB(Database db, int version) async {
  final idType ='INTEGER PRIMARY KEY AUTOINCREMENT';
  final textType ='TEXT NOT NULL';
  final integerType ='INTEGER NOT NULL';


  await db.execute('''
CREATE TABLE $tableScores(
${ScoreFields.id} $idType,
${ScoreFields.gameName} $textType,
${ScoreFields.score} $integerType,
)
''');
  }

  Future<Score> create(Score score) async{
    final db = await instance.database ;
    //final json = score.toJson();
   // final columns = '${ScoreFields.gameName} , ${ScoreFields.score}' ;
    //final values= '${json[ScoreFields.gameName]} , ${json[ScoreFields.score]}' ;

    //final id = await db
    //.rawInsert('INSERT INTO ') ;
    final id = await db.insert(tableScores, score.toJson()) ;
    return score.copy(id : id);

  }
  Future<Score?> readScore(int id)async{
    final db = await instance.database;
    final maps = await db.query(
      tableScores,
      columns: ScoreFields.values,
      where: '${ScoreFields.id} =  ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty){
      return Score.fromJson(maps.first);
    } else {
     return null ;
    }
  }

  Future<List<Score>> readAllScores() async {
    final db = await instance.database ;
    final result = await db.query(tableScores );
    return result.map((json)=> Score.fromJson(json)).toList();
  }

   Future close() async {
    final db = await instance.database ;
    db.close();
  }

  Future<String> get fullPath async {
    const name = 'score.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }
    Future<void> updateScore(int scoreIncrement) async {
    final db = await instance.database;
    final score = await readScore(1); // Assuming the score entry has ID 1
    if (score != null) {
      final updatedScore = score.copy(score: score.score + scoreIncrement);
      await db.update(tableScores, updatedScore.toJson(),
          where: '${ScoreFields.id} = ?', whereArgs: [score.id]);
    }
  }
}