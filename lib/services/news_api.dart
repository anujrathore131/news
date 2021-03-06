import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/main.dart';

import '../model/article_model.dart';


class ApiService extends NewsData {
  final endPointUrl = "newsapi.org";
  final client = http.Client();


  Future<List<Article>> getArticle(String category, String query) async {


    final queryParameters = {
      'country': 'in',
      'category': category,
      'q': query,
      'apiKey': 'd7fed47f46b74313b732837394c3d093'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}