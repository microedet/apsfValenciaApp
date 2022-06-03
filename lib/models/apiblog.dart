// To parse this JSON data, do
//
//     final apiBlog = apiBlogFromJson(jsonString);

import 'dart:convert';

ApiBlog apiBlogFromJson(String str) => ApiBlog.fromJson(json.decode(str));

String apiBlogToJson(ApiBlog data) => json.encode(data.toJson());

class ApiBlog {
    ApiBlog({
        required this.title,
        required this.content,
        required this.published,
        required this.image,
        required this.author,
        required this.status,
    });

    String title;
    String content;
    DateTime published;
    String image;
    int author;
    String status;

    factory ApiBlog.fromJson(Map<String, dynamic> json) => ApiBlog(
        title: json["title"],
        content: json["content"],
        published: DateTime.parse(json["published"]),
        image: json["image"],
        author: json["author"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "published": published.toIso8601String(),
        "image": image,
        "author": author,
        "status": status,
    };
}
