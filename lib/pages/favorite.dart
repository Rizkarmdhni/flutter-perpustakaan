import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              // decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ),
                    ),
                    Image.asset(
                      'images/applogo.png',
                      width: 100,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "My favorite",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          width: 410,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/kakaen_1.jpg",
                                    height: 120,
                                    width: 150,
                                  ),
                                ),
                              ),
                              Container(
                                width: 190,
                                height: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "KKN Di Desa Penari",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Simpleman",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(200, 104, 104, 104),
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 4,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 18,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(255, 255, 185, 5)),
                                      onRatingUpdate: (index) {},
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Color.fromARGB(
                                                255, 255, 115, 116),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
