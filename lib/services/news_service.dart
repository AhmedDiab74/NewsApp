import 'package:dio/dio.dart';
import 'package:newsapp/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(
    this.dio,
  );

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response res = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=7a1a8180e956408d8f2484a4ea2aa850&category=$category");
      Map<String, dynamic> jsonData = res.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
