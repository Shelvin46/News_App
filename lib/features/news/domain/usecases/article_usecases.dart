import 'package:dartz/dartz.dart';
import 'package:news_app/core/failures/failures.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/repositories/article_repo.dart';
import 'package:news_app/service_locator.dart';

class ArticleUsecases {
  Future<Either<Failure, Articles>> getArticles() async {
    return await locator<ArticleRepo>().getArticles();
  }
}
