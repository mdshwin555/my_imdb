import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/Logic/API/Models/Search.dart';
import 'package:my_imdb/UI/Screens/ViewAll.dart';
import 'package:lottie/lottie.dart';
import 'package:my_imdb/UI/Screens/ViewAllMovies.dart';
import 'package:my_imdb/UI/Widgets/ShowList.dart';
import '../../Logic/API/Controllers/showController.dart';
import '../../Logic/API/Models/showModel.dart';
import '../Widgets/Search/SearchTitle.dart';
import '../Widgets/ShowView.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sw = false;
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(CupertinoIcons.person_alt_circle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "IMDB",
                        // style: GoogleFonts.bilbo(
                        //   fontSize: 30,
                        //   color: Colors.white,
                        // ),
                        // TextStyle(
                        //   color: Colors.white,
                        //   fontSize: 20,
                        // ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Dark mode"),
              leading: Icon(CupertinoIcons.sun_min),
              trailing: CupertinoSwitch(
                onChanged: (bool value) {
                  setState(() {
                    sw = value;
                    value
                        ? Get.changeTheme(customThemes.customDark)
                        : Get.changeTheme(customThemes.customLight);
                  });
                },
                value: sw,
              ),
            ),
            ListTile(
              leading: Icon(Icons.movie_creation_outlined),
              title: Text('Movies'),
              onTap: () => Get.to(ViewAllMovies()),
            ),
            ListTile(
              leading: Icon(Icons.movie_creation_outlined),
              title: Text('TVs'),
              onTap: () => Get.to(ViewAllTVs()),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('IMDB'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchTitle());
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ShowModel>>(
        future: ShowController.get250Movies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData)
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top 250 Movies',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: "font",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ViewAllTVs());
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: "mmm",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, i) {
                            return ShowView(snapshot.data[i]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Popular Series',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: "mmm",
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, i) {
                            return ShowList(snapshot.data[i]);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          if (snapshot.hasError)
            return Center(child: Text('${snapshot.error}'));
          return Center(
            child: Lottie.asset(
              'Images/97570-loading.json',
              repeat: true,
            ),
          );
        },
      ),
    );
  }
}

class customThemes {
  static ThemeData customDark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            AppBar().preferredSize.height * 0.5,
          ),
        ),
      ),
    ),
    primaryColor: Colors.red,
  );
  static ThemeData customLight = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            AppBar().preferredSize.height * 0.5,
          ),
        ),
      ),
    ),
    primaryColor: Colors.red,
  );
}
