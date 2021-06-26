import 'package:article/model/article.dart';
import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  ArticleDetail(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: "image" + article.title,
            child: Image.network(
              article.urlImage,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Hero(
            tag: article.abstractArticle,
            child: Text(article.abstractArticle,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
