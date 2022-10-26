import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Logic/API/Models/showModel.dart';

class MovieDetailes extends StatelessWidget {
  final ShowModel model;

  MovieDetailes(this.model);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          // fit: StackFit.passthrough,
          children: [
            Column(
              children: [
                Container(
                  height: 700,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        model.image,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 650,
              left: size.width / 2.5,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 10,
                      offset: Offset(9, 9),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Icon(
                    Icons.play_arrow,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              right: size.width / 7,
              left: size.width / 7,
              top: 770,
              child: Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'font'),
              ),
            ),
            Positioned(
              right: size.width / 7,
              left: size.width / 7,
              top: 830,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.year,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontFamily: 'font',
                      ),
                    ),
                    Text(
                      model.imDbRating,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontFamily: 'font',
                      ),
                    ),
                    Text(
                      model.rank,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontFamily: 'font',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
