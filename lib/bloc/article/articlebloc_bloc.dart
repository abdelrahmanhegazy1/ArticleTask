import 'dart:async';
import 'dart:convert';

import 'package:article/model/article.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'articlebloc_event.dart';
part 'articlebloc_state.dart';

class ArticleblocBloc extends Bloc<ArticleblocEvent, ArticleblocState> {
  ArticleblocBloc() : super(ArticleblocInitial());
  final String url = "api.nytimes.com";
  final String secondPart = "/svc/topstories/v2/home.json";

  @override
  Stream<ArticleblocState> mapEventToState(
    ArticleblocEvent event,
  ) async* {
    if (event is GettingArticles) {
      yield ArticleblocLoading();

      http.Response response = await http.get(Uri.https(
          url, secondPart, {"api-key": "3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9"}));
      print(response.request);
      print(response.statusCode);

      if (response.statusCode == 200) {
        dynamic json = jsonDecode(response.body);
        List<Article> listOfArticles = [];
        for (int i = 0; i < json["results"].length; i++) {
          Article article = Article.fromJson(json, i);
          listOfArticles.add(article);
        }
        yield ArticleblocSuccess(listOfArticles);
      } else
        yield ArticleblocFailed("Site is not Available Now try later");
    }
  }
}
