import 'package:flutter/material.dart';
import 'package:news_application/data/api/api_manager.dart';
import 'package:news_application/data/model/ArticlesResponse.dart';
import 'package:news_application/widgets/article_widget.dart';
import 'package:news_application/widgets/error_view.dart';
import 'package:news_application/widgets/loading_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: ApiManager.getArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildArticlesListView(snapshot.data!);
        } else if (snapshot.hasError) {
          return ErrorView(message: snapshot.error.toString());
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget buildArticlesListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleWidget(
            article: articles[index],
          );
        });
  }
}
