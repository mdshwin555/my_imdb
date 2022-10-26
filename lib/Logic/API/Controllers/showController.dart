import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_imdb/Logic/API/Models/showModel.dart';

class ShowController {
  static Future<List<ShowModel>> get250Movies() async {
    var response = await http
        .get(Uri.parse("https://www.jsonkeeper.com/b/QJY3"));
    Map<String, dynamic> json = jsonDecode(response.body);
    List<ShowModel> models = [];
    for (var j in json['items']) models.add(ShowModel.fromJson(j));
    return models;
  }

  static Future<List<ShowModel>> getSeries() async {
    var response = await http
        .get(Uri.parse("https://www.imdb-api.com/en/API/Top250TVs/k_4md8v569"));
    Map<String, dynamic> json = jsonDecode(response.body);
    List<ShowModel> models = [];
    for (var j in json['items']) models.add(ShowModel.fromJson(j));
    return models;
  }
}
