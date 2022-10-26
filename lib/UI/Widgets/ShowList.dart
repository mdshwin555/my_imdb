import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/Logic/API/Models/showModel.dart';
import 'package:my_imdb/UI/Screens/MovieDetails.dart';

class ShowList extends StatelessWidget {
  final ShowModel model;

  ShowList(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetailes(model));
      },
      child: Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 8,
          child: ListTile(
            // leading: Container(
            //   child: Image.network(
            //     model.image,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            title: Row(
              children: [
                Image.network(
                  model.image,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: 300,
                      padding: EdgeInsets.only(
                        left: 22,
                      ),
                      child: Text(
                        model.title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "mmm",
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 22, top: 10),
                        width: 300,
                        child: Text(
                          model.crew,
                          maxLines: 2,
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
              ],
            ),
            //subtitle: Text(model.crew),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
