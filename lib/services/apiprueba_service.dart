import 'dart:convert';

import 'package:apfsvalencia/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class ApiPruebaServices {
  String _baseUrl = 'apsvalencia.pythonanywhere.com';

  Future<List<ApiPrueba>> getAll() async {
    var url = Uri.https(_baseUrl, '/api/apiprueba', {});
    final response = await http.get(url);
    var lst = <ApiPrueba>[];
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);

      print(decoded);

      for (var apiprueba in decoded) {
        var api = new ApiPrueba.fromJson(apiprueba);
        lst.add(api);
      }
      return lst;
    }

    return [];
  }
}
