import '../models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBlogServices {
  String _baseUrl = 'apsvalencia.pythonanywhere.com';

  Future<List<ApiBlog>> getAll() async {
    var url = Uri.https(_baseUrl, '/api/blog', {});
    final response = await http.get(url);
    var lst = <ApiBlog>[];
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);

      print(decoded);

      for (var apiblog in decoded) {
        var api = new ApiBlog.fromJson(apiblog);
        lst.add(api);
      }
      return lst;
    }

    return [];
  }
}