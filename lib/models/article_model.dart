class Article {
  late String author;
  late String title;
  late String description;
  late String urlToImage;
  late String url;
  late String content;


  // late DateTime publishedAt;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.content,
    // required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
      content: json['content']?? '',
      // publishedAt: element['publishedAt'],
    );
  }
}
