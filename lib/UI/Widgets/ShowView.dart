import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_imdb/Logic/API/Models/showModel.dart';
import 'package:my_imdb/UI/Screens/MovieDetails.dart';

class ShowView extends StatelessWidget {
  final ShowModel model;

  ShowView(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetailes(model));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            model.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "font",
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${model.imDbRating} /10 ⭐️ ',
                            style: TextStyle(
                              fontFamily: "font",
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
