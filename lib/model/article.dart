class Article {
  String title;
  String abstractArticle;
  List<dynamic> multimedia;
  String urlImage;
  String publishingDate;
  String creatingDate;
  String url;

  Article(
      {this.url,
      this.abstractArticle,
      this.multimedia,
      this.title,
      this.urlImage,
      this.creatingDate,
      this.publishingDate});

  factory Article.fromJson(Map<String, dynamic> json, int index) {
    return Article(
        abstractArticle: json["results"][index]["abstract"],
        title: json["results"][index]["title"],
        urlImage: json["results"][index]["multimedia"][0]["url"],
        url: json["results"][index]["url"],
        publishingDate: json["results"][index]["published_date"],
        creatingDate: json["results"][index]["created_date"]);
  }
}
