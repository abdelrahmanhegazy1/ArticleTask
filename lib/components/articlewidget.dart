import 'package:article/model/article.dart';
import 'package:flutter/material.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  ArticleItemWidget(this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Column(
        children: [
          Hero(
            tag: "image" + article.title,
            child: Image.network(
              article.urlImage,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Hero(
                      tag: article.abstractArticle,
                      child: Text(article.abstractArticle,
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(article.publishingDate,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.green[200],
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(article.creatingDate,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.green[200],
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
