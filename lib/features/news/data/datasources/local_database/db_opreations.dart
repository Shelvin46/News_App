import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/exceptions/exception_handler.dart';
import 'package:news_app/core/failures/failures.dart';
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
    log("Database path: $path");
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
        // Assuming 'id' is a unique identifier for each article
        final existingArticle = await txn.query(
          'news',
          where: 'title = ?',
          whereArgs: [article.title],
        );

        if (existingArticle.isEmpty) {
          var id = await txn.insert(
            'news',
            article.toJson(),
          );
          if (id > 0) {
            count++;
          }
        }
      }
    });
    return count;
  }

  Future<Either<Failure, List<Article>>> getNews() async {
    try {
      final db = await database;
      List<Map> maps = await db.query('news');

      final articles = List.generate(maps.length, (i) {
        return Article(
          id: i,
          author: maps[i]['author'],
          content: maps[i]['content'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          url: maps[i]['url'],
          urlToImage: maps[i]['urlToImage'],
          publishedAt: DateTime.parse(maps[i]['publishedAt']),
        );
      });

      return Right(articles);
    } catch (e) {
      return Left(CustomExceptionHandler.handleException(e as DioException));
    }
  }

  Future<int> deleteNews(int id) async {
    final db = await database;
    return await db.delete('news', where: "id = ?", whereArgs: [id]);
  }
}
