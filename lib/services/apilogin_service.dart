import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class ApiLogin extends ChangeNotifier {
  final String _baseUrl = "https://apsvalencia.pythonanywhere.com";

  //para encriptar el token
  final storage = new FlutterSecureStorage();

  Future<String?> createUser(String username,String email, String password) async {
    final Map<String, dynamic> authData = {
      'username'
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url =
        Uri.https(_baseUrl,"/api/authentication/login/", {});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('key')) {
      await storage.write(key: 'key', value: decodedResp['key']);

      return null;
    } else {
      return decodedResp['error']['message'];
    }
    print(decodedResp);
  }

  //si devuelve algo es un error si no todo es correcto
  Future<String?> login(String username,String email, String password) async {
    final Map<String, dynamic> authData = {
      'username': username,
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseUrl,"/api/authentication/login/", {});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('key')) {
      await storage.write(key: 'key', value: decodedResp['key']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'key');
    return null;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'key') ?? '';
  }

  
}
