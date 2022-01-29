import 'dart:convert';

import 'package:http/http.dart';
import 'package:newss_app/models/news_model.dart';

class ApiService {
  Future<List<Article>> getArticle({String cat}) async {
    final endPointUrl =
        "https://newsapi.org/v2/top-headlines?country=eg&category=$cat&apiKey=046b77deeb1b41e9b9d9b2e8559efd7f";
    var newsModel = null;
    try {
      Response res = await get(Uri.parse(endPointUrl));
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        List<dynamic> body = json['articles'];


        List<Article> newsModel =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        return newsModel;
      }
    } catch (Exception) {
      return newsModel;
    }


  }
}
