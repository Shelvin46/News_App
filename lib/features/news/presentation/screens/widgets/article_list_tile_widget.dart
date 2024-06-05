import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:svg_flutter/svg.dart';

class ArticleListTileWidget extends StatelessWidget {
  const ArticleListTileWidget({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                article.title ?? "Unknown title",
                style: context.textTheme.titleLarge,
              ).flexible(flex: 3),
              5.heightBox,
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                article.description ?? "Unknown description",
                style: context.textTheme.titleSmall,
              ).flexible(),
            ],
          ).expanded(),
          10.widthBox,
          SizedBox(
            height: 75,
            width: 75,

            // color: Colors.red,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => SvgPicture.asset(
                'assets/images/image_not_found.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
