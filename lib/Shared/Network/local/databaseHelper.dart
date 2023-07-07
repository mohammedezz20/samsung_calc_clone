import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/HistoryModel.dart';

class DatabaseHelper {
  Future<Database> database() async {

    return openDatabase(
      "CalculatorHistory.db",
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, input TEXT, output TEXT)',
        ).then((value){
          print("database Created");
        });
      },
    ).then((value) {
      print('database Opened');
      return value;
    });
  }

  Future<void> addToDatabase(CalculatorHistory calculatorHistory) async {
    final db = await database();
    await db.insert(
      'history',
      calculatorHistory.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<CalculatorHistory>> getHistory() async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query('history', orderBy: 'id ASC');
    return List.generate(maps.length, (index) {
      CalculatorHistory history=CalculatorHistory(
        id: maps[index]['id'],
        input: maps[index]['input'],
        output: maps[index]['output'],
      );
      print(history.toMap().toString());
      return history;
    });
  }


  Future<void> deleteAllHistory() async {
    final db = await database();
    await db.delete('history');
  }

}
