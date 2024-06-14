import 'package:sqflite/sqflite.dart';

import '../../db/db.dart';

class DBBase {
  DBBase({
    required this.tableName,
    this.conflictAlgorithm = ConflictAlgorithm.replace,
  }) {
    appDatabase = AppDatabase.get();
  }

  final String tableName;
  late final AppDatabase appDatabase;
  final ConflictAlgorithm conflictAlgorithm;

  Future<int> insert(
    Map<String, dynamic> data, {
    ConflictAlgorithm? conflictAlgorithm = ConflictAlgorithm.replace,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      return db.insert(
        tableName,
        data,
        conflictAlgorithm: conflictAlgorithm,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> insertList(
    List<Map<String, dynamic>> dataList, {
    ConflictAlgorithm? conflictAlgorithm = ConflictAlgorithm.replace,
  }) async {
    try {
      if (dataList.isEmpty) return;
      Database? db = await appDatabase.getDb();
      final batch = db.batch();
      for (final item in dataList) {
        batch.insert(
          tableName,
          item,
          conflictAlgorithm: conflictAlgorithm,
        );
      }
      await batch.commit(noResult: true);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> update(
    Map<String, dynamic> data, {
    String? where,
    List<Object>? whereArgs,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      return db.update(
        tableName,
        data,
        conflictAlgorithm: conflictAlgorithm,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> rawUpdate(
    Map<String, dynamic> setData, {
    required String where,
    required List<Object> whereArgs,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      String setQuery = setData.keys
          .toList()
          .map(
            (e) => ("$e = ?, "),
          )
          .toList()
          .join();
      setQuery = setQuery.substring(0, setQuery.length - 2);
      return db.rawUpdate(
        'UPDATE $tableName SET '
        '$setQuery'
        ' WHERE $where',
        [...setData.values.toList(), ...whereArgs],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> query({
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      return db.query(
        tableName,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> rawQuery(
    String sql, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      if (where != null) {
        sql = '$sql $where';
      }
      return db.rawQuery(sql, whereArgs);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> deleteTable({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      Database? db = await appDatabase.getDb();
      return db.delete(
        tableName,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
