import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../Models/Search.dart';

class SearchController {
  static Future<List<Search>> searchTitle(val) async {
    var responce = await http.get(Uri.parse('https://imdb-api.com/en/API/Search/k_4md8v569/$val'));
    Map<String,dynamic> json=jsonDecode(responce.body);
    List<Search> models=[];
    for(var j in json['results'])
      models.add(
        Search.fromJSON(j),
      );
    return models;
  }
}
