import 'package:dio/dio.dart';
import 'package:newsapp/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      Response res = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=7a1a8180e956408d8f2484a4ea2aa850");
      Map<String, dynamic> jsonData = res.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (int i = 0; i < articles.length; i++) {
        articlesList.add(ArticleModel(
            image: articles[i]['urlToImage'],
            title: articles[i]['title'],
            subTitle: articles[i]['author']));
      }
      return articlesList;
    } catch (e) {
  
      return [];
    }
  }
}
