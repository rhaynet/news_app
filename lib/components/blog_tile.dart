import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/article_view.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  }) : super(key: key);

  final String imageUrl, title, desc, url;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(imageUrl),
                borderRadius: BorderRadius.circular(6),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(desc,
                  style: const TextStyle(
                    color: Colors.black54,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
