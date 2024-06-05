part of 'get_articles_bloc.dart';

class GetArticlesState extends BaseState {
  final List<Article> articles;

  const GetArticlesState({required this.articles});

  @override
  List<Object> get props => [articles];
}

final class GetArticlesInitial extends GetArticlesState {
  GetArticlesInitial() : super(articles: []);
}
