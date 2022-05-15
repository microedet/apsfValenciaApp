import 'dart:collection';

import 'package:apfsvalencia/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticlesProvider extends ChangeNotifier {
  String _baseUrl = 'apsvalencia.pythonanywhere.com';
  ArticlesProvider() {
    print('ArticlesProvider Inicializado');

    this.getOnDisplayArticles();
  }

  getOnDisplayArticles() async {
    var url = Uri.https(_baseUrl, '/api/blog', {});
    // var url =Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<ArticlesBlogResponse> article = [];
      for (var v in jsonData) {
        ArticlesBlogResponse art1 = ArticlesBlogResponse(
            title: v['title'],
            content: v['content'],
            published: v['published'],
            image: v['image'],
            author: v['author'],
            categories: v[['categories']],
            status: v['status']);
        article.add(art1);

        /* int total = article.length;
      for (var i =0; i<total;i++) {
        print(article[i].image); */
      }
      return article;
      notifyListeners();
    } else {
      throw Exception('No es posible cargar el blog');
    }
  }
}
