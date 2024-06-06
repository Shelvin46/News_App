import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/base_bloc_states.dart';
import 'package:news_app/core/exceptions/exception_handler.dart';
import 'package:news_app/features/news/data/datasources/local_database/db_opreations.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/usecases/article_usecases.dart';
import 'package:news_app/service_locator.dart';
part 'get_articles_event.dart';
part 'get_articles_state.dart';

///[GetArticlesBloc] is a [Bloc] class that is used to manage the state of the [ArticleScreen]
///[GetArticlesBloc] extends [Bloc] class and takes [GetArticlesEvent] and [BaseState] as parameters
///[GetArticlesBloc] is used to get the articles from the API
///[GetArticlesBloc] is used to manage the state of the [ArticleScreen]
///
///
/// After

class GetArticlesBloc extends Bloc<GetArticlesEvent, BaseState> {
  GetArticlesBloc() : super(GetArticlesInitial()) {
    on<GetArticles>((event, emit) async {
      emit(LoadingState());

      final articles = await locator<ArticleUsecases>().getArticles();

      articles.fold((left) {
        final failureMessage = CustomExceptionHandler.handleExceptionToMap(
          left,
        );

        final state =
            CustomExceptionHandler.exceptions[failureMessage["error"]];

        return emit(state);
      }, (right) {
        return emit(
          GetArticlesState(articles: right.articles),
        );
      });
    });

    on<GetArticlesFormLocalDb>((event, emit) async {
      emit(LoadingState());

      final articles = await locator<SQLiteOperations>().getNews();

      articles.fold((left) {
        final failureMessage = CustomExceptionHandler.handleExceptionToMap(
          left,
        );

        final state =
            CustomExceptionHandler.exceptions[failureMessage["error"]];

        return emit(state);
      }, (right) {
        return emit(
          GetArticlesState(articles: right),
        );
      });
    });
  }
}
