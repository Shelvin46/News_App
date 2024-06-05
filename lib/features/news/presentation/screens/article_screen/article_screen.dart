import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/base_bloc_states.dart';
import 'package:news_app/features/news/presentation/blocs/get_articles/get_articles_bloc.dart';
import 'package:news_app/features/news/presentation/screens/widgets/article_category_widget.dart';
import 'package:news_app/features/news/presentation/screens/widgets/article_list_tile_widget.dart';
import 'package:news_app/features/news/presentation/screens/widgets/custom_divider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<ArticleCategoriesModel> articleCategories = [
    const ArticleCategoriesModel(
      title: "Apple",
      imageUrl: "assets/article/apple-black-logo-svgrepo-com.svg",
    ),
    const ArticleCategoriesModel(
      title: "Tesla",
      imageUrl: "assets/article/tesla.svg",
    ),
    const ArticleCategoriesModel(
      title: "TechCrunch",
      imageUrl: "assets/article/techcrunch.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.heightBox,
        ArticleCategoriesWidget(articleCategories: articleCategories),
        const CustomDivider(),
        BlocBuilder<GetArticlesBloc, BaseState>(
          builder: (context, state) {
            if (state is GetArticlesState) {
              return ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final article = state.articles[index];
                    return ArticleListTileWidget(
                      article: article,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const CustomDivider();
                  },
                  itemCount: state.articles.length);
            } else if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is TimeoutErrorState) {
              return Text(
                "Timeout Error try again later",
                style: context.textTheme.titleLarge,
              ).toCenter();
            } else if (state is ParsingErrorState) {
              return Text(
                "Parsing error try again later",
                style: context.textTheme.titleLarge,
              ).toCenter();
            } else if (state is ServerErrorState) {
              return Text(
                "Something went wrong please try again later",
                style: context.textTheme.titleLarge,
              ).toCenter();
            } else if (state is NoInternetState) {
              return Text(
                "Check your internet connection",
                style: context.textTheme.titleLarge,
              ).toCenter();
            } else if (state is FormatExceptionState) {
              return Text(
                "Format error try again later",
                style: context.textTheme.titleLarge,
              ).toCenter();
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ).expanded()
      ],
    );
  }
}

class ArticleCategoriesModel extends Equatable {
  final String title;
  final String imageUrl;

  const ArticleCategoriesModel({
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [title, imageUrl];
}
