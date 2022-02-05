import 'package:flutter/material.dart';
import 'package:news_app/components/blog_list.dart';
import 'package:news_app/components/blog_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/helper/news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categories = [];


  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: categories[index].categorieName,
                      imageUrl: categories[index].imageAssetUrl,
                    );
                  },
                ),
              ),

              FutureBuilder<List<Article>>(
                future: getNews(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? BlogList(articles: snapshot.data!)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
