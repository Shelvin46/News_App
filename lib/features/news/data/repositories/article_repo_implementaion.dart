import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/config/api_keys.dart';
import 'package:news_app/core/exceptions/exception_handler.dart';
import 'package:news_app/core/failures/failures.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/repositories/article_repo.dart';
import 'package:news_app/service_locator.dart';

class ArticlesRepoImplementation implements ArticleRepo {
  @override
  Future<Either<Failure, Articles>> getArticles() async {
    final queryParameters = {
      'q': 'apple',
      'from': '2024-05-16',
      'to': '2024-05-16',
      'sortBy': 'popularity',
      'apiKey': ApiKeys.articleApiKey,
    };
    try {
      // api call will happen here
      final response = await locator<Dio>().get(
        "https://newsapi.org/v2/everything",
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Right(Articles.fromJson(response.data));
      } else {
        return Left(Failure(message: response.statusMessage ?? ""));
      }
    } catch (e) {
      return Left(CustomExceptionHandler.handleException(e as DioException));
    }
  }
}
