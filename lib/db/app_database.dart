import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../db/db.dart';

class AppDatabase {
  static final AppDatabase _appDatabase = AppDatabase._internal();

  //private internal constructor to make it singleton
  AppDatabase._internal();

  late Database _database;

  static const dbName = 'login.db';

  static AppDatabase get() {
    return _appDatabase;
  }

  bool didInit = false;

  /// Use this method to access the database
  Future<Database> getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  Future _init() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    print('path : $path');
    _database = await openDatabase(
      path,
      // version: migrationScripts.length + 1,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      /*  onCreate: (Database db, int version) async {
        await _createUserTable(db);
        await _createFormTable(db);
        await _createMonitoringTable(db);
        await _createReferenceDataTable(db);
      },
      // I have added this onUpgrade method to handle the new version
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion < 2) {
          // Perform migration from version 1 to version 2
          await db.execute(
              "ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbEmail} TEXT");
          await db.execute(
              "ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbTotalChklst} TEXT");
        }
      },*/
    );
    didInit = true;
  }

  // Future _onCreate(Database db, int version) async {
  //   // AppDatabase.initScript.forEach((script) async {
  //   initScript.forEach((script) async {
  //     await db.execute(script);
  //   });
  // }

  Future _onCreate(Database db, int version) async {
    print('Creating User table...');
    await db.execute('''
      CREATE TABLE ${UserTable.tblUser} (
        ${UserTable.dbUserId} TEXT PRIMARY KEY,
        ${UserTable.dbUsername} TEXT,
        ${UserTable.dbPassword} TEXT
      )
    ''');
    print('User table created.');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // for (var i = oldVersion - 1; i < newVersion - 1; i++) {
    //   await db.execute(migrationScripts[i]);
    // }
  }
  // static const initScript = [
  //   '''CREATE TABLE ${UserTable.tblUser} (
  //     ${UserTable.dbId} TEXT PRIMARY KEY,
  //     ${UserTable.dbUsername} TEXT,
  //     ${UserTable.dbPassword} TEXT,
  //     ${UserTable.dbName} TEXT,
  //      ${UserTable.dbEmail} TEXT
  //     )''',
  // ];

  static const migrationScripts = [
    // 'ALTER TABLE ${UserTable.tblUser} ADD COLUMN ${UserTable.dbEmail} TEXT',
  ];
}
