import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/news/data/repositories/article_repo_implementaion.dart';
import 'package:news_app/features/news/domain/repositories/article_repo.dart';
import 'package:news_app/features/news/domain/usecases/article_usecases.dart';

final locator = GetIt.instance;

/// [ArticleRepo] is registered as a singleton with the [GetIt] package
/// [Dio] is registered as a singleton with the [GetIt] package

class ServiceLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => ArticleUsecases());
    locator.registerSingleton<ArticleRepo>(ArticlesRepoImplementation());
    locator.registerSingleton<Dio>(Dio());
  }
}
