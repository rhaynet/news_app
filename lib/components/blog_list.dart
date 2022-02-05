import 'package:flutter/material.dart';
import 'package:news_app/components/blog_tile.dart';
import 'package:news_app/models/article_model.dart';

import '../home.dart';

class BlogList extends StatelessWidget {
  const BlogList({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: articles.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return BlogTile(
            imageUrl: articles[index].urlToImage,
            title: articles[index].title,
            desc: articles[index].description,
            url: articles[index].url,
          );
        },
      ),
    );
  }
}