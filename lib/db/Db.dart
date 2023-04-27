import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/UserModel.dart';
class Database{
 
  // Open the database and store the reference.
  Future openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'user.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  // Define a function that inserts dogs into the database
  Future<void> insertUser(UserModel user) async {
    // Get a reference to the database.
    final db = await openDB();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'user',
      user.toMap()
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // var fido = const UserModel(
  //   id: 1,
  //   username: '23',
  //   password: "2s12321ads",
  // );

  // await insertUser(fido);

  Future<List<UserModel>> users() async {
    // Get a reference to the database.
    final db = await openDB();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('user');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return UserModel(
        id: maps[i]['id'],
        username: maps[i]['username'],
        password: maps[i]['password'],
      );
    });

  }
  Future<List<UserModel>> getUser(int user) async {
    final db = await openDB();

    final List<Map<String, dynamic>> userDb = await db.query('user', where:'id = ?', whereArgs:[user]);
    return List.generate(userDb.length, (i) {
      return UserModel(
        id: userDb[i]['id'],
        username: userDb[i]['username'],
        password: userDb[i]['password'],
      );
    });
  }
}