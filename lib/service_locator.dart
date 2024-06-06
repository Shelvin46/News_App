import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/news/data/datasources/local_database/db_opreations.dart';
import 'package:news_app/features/news/data/repositories/article_repo_implementation.dart';
import 'package:news_app/features/news/domain/repositories/article_repo.dart';
import 'package:news_app/features/news/domain/usecases/article_usecases.dart';
import 'package:news_app/features/news/infrastructure/connectivity_manager.dart';

final locator = GetIt.instance;

/// [ArticleRepo] is registered as a singleton with the [GetIt] package
/// [Dio] is registered as a singleton with the [GetIt] package

class ServiceLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => ArticleUsecases());
    locator.registerSingleton<ArticleRepo>(ArticlesRepoImplementation());
    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<SQLiteOperations>(SQLiteOperations());
    locator.registerSingleton<Connectivity>(Connectivity());
  }
}
