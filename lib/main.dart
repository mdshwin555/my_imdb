import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/UI/Screens/Home.dart';
import 'package:my_imdb/UI/Screens/ViewAll.dart';
import 'UI/Screens/MovieDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(color: Colors.red),
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Colors.red),
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/Home', page: () => Home()),
        //GetPage(name: '/MovieDetailes', page:()=> MovieDetailes()),
      ],
      initialRoute: '/Home',
    );
  }
}
