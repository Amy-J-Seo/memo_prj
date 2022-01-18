
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'data_form.dart';

final String TableName = 'memos';

class DBHelper {
  var _db;

  //Create db if there no db already
  Future<Database> get database async {
    if(_db !=null) return _db;
    _db = openDatabase(
      //set up the path
      join(await getDatabasesPath(), 'memos.db'),
      onCreate: (db, version){
        return db.execute('''
        CREATE TABLE memos(id INTEGER PRIMARY KEY, title TEXT, text TEXT, createdTime TEXT, editTime TEXT)
        ''');
      },
      version: 1,
    );
    return _db;
  }

  //Create add Memo method
  Future<void> insertMemo(Memo memo) async{
    final db = await database;

    await db.insert(TableName, memo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //getAllMemoList method
  Future<List<Memo>> getTotalListMemo() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('memos');

    return List.generate(maps.length, (i) {
        return Memo(
          id:int.parse(maps[i]['id']),
          title: maps[i]['title'],
          text: maps[i]['text'],
          createdTime: maps[i]['createdTime'],
          editTime: maps[i]['editTime']
      );
    });
  }

  //create update method
  Future<void> updateMemo(Memo memo) async {
    final db = await database;

   await db.update(
      TableName, memo.toMap(), where: 'id=?', whereArgs:[memo.id]
    );
  }

  //create delete method
  Future<void> deleteMemo(int id) async {
    final db = await database;

    await db.delete(
      TableName, where: 'id=?', whereArgs: [id]
    );
  }
}
