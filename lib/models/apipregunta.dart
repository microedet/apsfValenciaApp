// To parse this JSON data, do
//
//     final apiPregunta = apiPreguntaFromJson(jsonString);

import 'dart:convert';

ApiPregunta apiPreguntaFromJson(String str) => ApiPregunta.fromJson(json.decode(str));

String apiPreguntaToJson(ApiPregunta data) => json.encode(data.toJson());

class ApiPregunta {
    ApiPregunta({
        required this.tituloPregunta,
        required this.respuestaPregunta,
    });

    String tituloPregunta;
    String respuestaPregunta;

    factory ApiPregunta.fromJson(Map<String, dynamic> json) => ApiPregunta(
        tituloPregunta: json["tituloPregunta"],
        respuestaPregunta: json["respuestaPregunta"],
    );

    Map<String, dynamic> toJson() => {
        "tituloPregunta": tituloPregunta,
        "respuestaPregunta": respuestaPregunta,
    };
}

