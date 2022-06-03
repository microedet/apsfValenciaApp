// To parse this JSON data, do
//
//     final apiPrueba = apiPruebaFromJson(jsonString);

import 'dart:convert';

ApiPrueba apiPruebaFromJson(String str) => ApiPrueba.fromJson(json.decode(str));

String apiPruebaToJson(ApiPrueba data) => json.encode(data.toJson());

class ApiPrueba {
    ApiPrueba({
        required this.id,
        required this.campouno,
        required this.campodos,
    });

    int id;
    String campouno;
    String campodos;

    factory ApiPrueba.fromJson(Map<String, dynamic> json) => ApiPrueba(
        id: json["id"],
        campouno: json["campouno"],
        campodos: json["campodos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "campouno": campouno,
        "campodos": campodos,
    };
}


