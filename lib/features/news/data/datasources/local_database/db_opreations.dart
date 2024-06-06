import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteOperations {
  final Future<Database> _database = _initDB();

  static Future<Database> _initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "news.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<Database> get database async {
    return _database;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE news(id INTEGER PRIMARY KEY, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT, author TEXT, content TEXT)",
    );
  }

  Future<int> insertNews(List<Article> news) async {
    final db = await database;
    int count = 0;

    await db.transaction((txn) async {
      for (var article in news) {
        count = count +
            await txn.insert(
              'news',
              article.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
      }
    });
    return count;
  }

  Future<List<Article>> getNews() async {
    final db = await database;
    List<Map> maps = await db.query('news');
    return List.generate(maps.length, (i) {
      return Article(
        id: i,
        author: maps[i]['author'],
        content: maps[i]['content'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        url: maps[i]['url'],
        urlToImage: maps[i]['urlToImage'],
        publishedAt: maps[i]['publishedAt'],
      );
    });
  }

  Future<int> deleteNews(int id) async {
    final db = await database;
    return await db.delete('news', where: "id = ?", whereArgs: [id]);
  }
}
