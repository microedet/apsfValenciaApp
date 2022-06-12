import '../models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiPreguntaServices {
  String _baseUrl = 'apsvalencia.pythonanywhere.com';

  Future<List<ApiPregunta>> getAll() async {
    var url = Uri.https(_baseUrl, '/api/preguntafrecuente', {});
    final response = await http.get(url);
    var lst = <ApiPregunta>[];
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);

      print(decoded);

      for (var apipregunta in decoded) {
        var api = new ApiPregunta.fromJson(apipregunta);
        lst.add(api);
      }
      return lst;
    }

    return [];
  }
}
