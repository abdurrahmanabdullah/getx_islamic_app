import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('book.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    // Check if the database already exists
    final exists = await databaseExists(path);

    if (!exists) {
      // If it does not exist, copy from asset
      try {
        ByteData data = await rootBundle.load('assets/$fileName');
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        throw Exception('Error copying database: $e');
      }
    }

    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> fetchSections() async {
    final db = await database;
    final result = await db.query('section'); // adjust table name if needed
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchHadith() async {
    final db = await database;
    final result = await db.query('hadith'); // adjust table name if needed
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchBooks() async {
    final db = await database;
    final result = await db.query('books'); // adjust table name if needed
    return result;
  }
}
