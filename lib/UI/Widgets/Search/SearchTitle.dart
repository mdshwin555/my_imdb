import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/Logic/API/Controllers/SearchController.dart';

import '../../../Logic/API/Models/Search.dart';

class SearchTitle extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Search>(
      future: SearchController.searchTitle(query),
      builder: (c,snapShot) {
        if(snapShot.hasData)
          return ;
        if(snapShot.hasError)
          return Center(child:Text('${snapShot.error}'),);
        else
          return Center(child: ,);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
