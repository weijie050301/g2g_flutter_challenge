

import 'dart:convert';

import 'package:challenge/models/Product.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<GameModel?> readJson() async {
    try {
      final String response = await rootBundle.loadString('games.json');
      final data = await json.decode(response);
      GameModel model = GameModel.fromJson(data);
      return model;
    } catch (e, stacktrace) {
      print("readJsonStacktrace:");
      print(stacktrace);
      return null;
    }
  }
  Future<GameModel?> fetchAlbum(url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      final data = await json.decode(response.body);
      GameModel model = GameModel.fromJson(data);
      return model;
    } catch (e, stacktrace) {
      print("readJsonStacktrace:");
      print(stacktrace);
      return null;
    }
  }
}