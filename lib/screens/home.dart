import 'package:article/bloc/article/articlebloc_bloc.dart';
import 'package:article/components/articlewidget.dart';
import 'package:article/screens/article_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:article/bloc/article/articlebloc_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ArticleblocBloc>(context).add(GettingArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: BlocBuilder<ArticleblocBloc, ArticleblocState>(
        builder: (context, state) {
          if (state is ArticleblocInitial || state is ArticleblocLoading) {
            return buildProgressBar(context);
          } else if (state is ArticleblocSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: GestureDetector(
                    child: ArticleItemWidget(state.articleList[index]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetail(state.articleList[index])));
                    },
                  ),
                );
              },
              itemCount: state.articleList.length,
            );
          } else if (state is ArticleblocFailed) {
            return Text(state.errorMessage);
          }
        },
      ),
    );
  }

  Widget buildProgressBar(context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
