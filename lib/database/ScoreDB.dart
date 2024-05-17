import 'package:kidsapp/database/databaseService.dart';
import 'package:sqflite/sqflite.dart';

class ScoreDB {
  final tableName = 'scores';

  Future<void> createTable(Database database) async {
    try {
      await database.execute("""
        CREATE TABLE IF NOT EXISTS $tableName (
          "gameName" TEXT PRIMARY KEY,
          "score" INTEGER NOT NULL
        )""");
    } catch (e) {
      print("Error creating table: $e");
      // Handle the error as per your application's requirements
    }
  }

  Future<int> create({required String gameName}) async {
    try {
      final database = await DatabaseService().database;
      return await database.rawInsert(
        '''INSERT INTO $tableName(gameName, score) VALUES (?, ?)''',
        [gameName, 0],
      );
    } catch (e) {
      print("Error inserting data: $e");
      // Handle the error as per your application's requirements
      return -1; // Return an error code or throw an exception
    }
  }

  Future<void> updateScore({required String gameName, required int newScore}) async {
    try {
      final database = await DatabaseService().database;
      await database.rawUpdate(
        'UPDATE $tableName SET score = ? WHERE gameName = ?',
        [newScore, gameName],
      );
    } catch (e) {
      print("Error updating score: $e");
      // Handle the error as per your application's requirements
    }
  }
}
