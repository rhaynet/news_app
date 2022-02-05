import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

const String API_KEY = '3944deee85a041298c3c6cc73c31da70';

Future<List<Article>> getNews() async {
  String url =
      "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy="
      "publishedAt&language=en&apiKey=$API_KEY";

  final response = await http.get(Uri.parse(url));

  // jsonData['status'] == 'ok'
  if (response.statusCode == 200) {
    Iterable jsonData = jsonDecode(response.body)['articles'];
    List<Article> news =
        jsonData.map((element) => Article.fromJson(element)).toList();

    return news;
  } else {
    throw Exception('Failed to load news');
    // print('Failed to load new data');
    // return [];
  }
}

Future<List<Article>> getCategoryNews(String category) async {
  String url =
      "http://newsapi.org/v2/top-headlines?category=$category&country=ng&excludeDomains=stackoverflow.com&sortBy="
      "publishedAt&language=en&apiKey=$API_KEY";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Iterable jsonData = jsonDecode(response.body)['articles'];
    List<Article> news =
    jsonData.map((element) => Article.fromJson(element)).toList();
    return news;

  } else {
    throw Exception('Failed to load news');

  }
}
