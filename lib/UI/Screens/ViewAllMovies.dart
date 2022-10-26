import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/Logic/API/Controllers/showController.dart';
import 'package:my_imdb/UI/Widgets/ShowView.dart';
import '../../Logic/API/Models/showModel.dart';
import 'package:lottie/lottie.dart';

class ViewAllMovies extends StatelessWidget {
  // List<ShowModel>? models;

//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMDB'),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: FutureBuilder<List<ShowModel>>(
        future: ShowController.get250Movies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData)
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 5,
                // mainAxisSpacing: 5,
                childAspectRatio: 0.75,
              ),
              itemBuilder: ( c,  i) {
                return ShowView(snapshot.data[i]);
              },
            );
          //   ListView.separated(
          //   itemCount: snapshot.data!.length, itemBuilder: (c, i) {
          //   return ShowView(snapshot.data[i]);
          // }, separatorBuilder: (BuildContext context, int index) {
          //   return Divider(thickness: 2,);
          // },);
          if (snapshot.hasError) return Text('${snapshot.error}');
          return Center(
              child: Lottie.asset('Images/97570-loading.json')
          );
        },
      ),
      // widget.models == null
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: widget.models!.length,
      //         itemBuilder: (c,i){
      //           return ShowView(widget.models![i]);
      //         },
      //       ),
    );
  }

// @override
// void initState() {
//  getData();
// }
// void getData() async {
//   widget.models= await ShowController.get250Movies();
//   setState(() {});
// }
}
