import 'dart:io';

import 'package:islamic_app/app/data/models/todo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ?? await _initDatabase();

  /// database  jodi get na kore tobe initdatabase  call

  ///logically kono variable bitore data inser korte getter setter use kora hoi

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    /// path ta ciniye deoa

    String path = join(documentDirectory.path, 'customer.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""

  CREATE TABLE customer(
    id INTEGER PRIMARY KEY,
   title TEXT,
   description TEXT
  )

  """);
    print("Table created");
  }

  /// data  insert  korar jonne => to json
  /// data read korar jonne => from json
  /// Save data
  Future<int> addTodos(TodoModels todoData) async {
    Database db = await instance.database;
    return await db.insert("customer", todoData.toJson());
  }

  ///Fetch Data
  Future<List<TodoModels>> getTodos() async {
    Database db = await instance.database;
    var todos = await db.query('customer', orderBy: "id");
    List<TodoModels> todo = todos.isNotEmpty
        ? todos.map((e) => TodoModels.fromJson(e)).toList()
        : [];
    return todo;
  }

  ///Delete
  Future deleteTodo(int? id) async {
    Database db = await instance.database;
    return await db.delete("customer", where: 'id=?', whereArgs: [id]);
  }

  ///update

  Future updateToDo(TodoModels todo) async {
    Database db = await instance.database;
    return await db
        .update('customer', todo.toJson(), where: "id=?", whereArgs: [todo.id]);
  }
}
