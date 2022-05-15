// To parse this JSON data, do
//
//     final articlesBlogResponse = articlesBlogResponseFromMap(jsonString);

import 'dart:convert';

class ArticlesBlogResponse {
  String? title;
  String? content;
  String? published;
  String? image;
  int? author;
  List<int>? categories;
  String? status;

  ArticlesBlogResponse(
      {this.title,
      this.content,
      this.published,
      this.image,
      this.author,
      this.categories,
      this.status});

  factory ArticlesBlogResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesBlogResponse(
        title: json['title'],
        content: json['content'],
        published: json['published'],
        image: json['image'],
        author: json['author'],
        categories: json[['categories']].cast<int>(),
        status: json['status']);
  }
}
