part of 'get_articles_bloc.dart';

sealed class GetArticlesEvent extends Equatable {
  const GetArticlesEvent();

  @override
  List<Object> get props => [];
}

final class GetArticles extends GetArticlesEvent {
  const GetArticles();

  @override
  List<Object> get props => [];
}
