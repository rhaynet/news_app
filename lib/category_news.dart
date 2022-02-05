import 'package:flutter/material.dart';
import 'package:news_app/components/blog_list.dart';
import 'package:news_app/models/article_model.dart';
import 'helper/news.dart';


class CategoryNews extends StatefulWidget {
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  final String category;
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.blue
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Icon(Icons.save, color: Colors.white,),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Article>>(
          future: getCategoryNews(widget.category),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? BlogList(articles: snapshot.data!)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
