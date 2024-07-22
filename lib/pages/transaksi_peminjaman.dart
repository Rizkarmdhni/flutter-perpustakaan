import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/transaksi_pengembalian.dart';

class peminjaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
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
        GestureDetector(
          onTap: () {
            // Navigator.pop(
            //   context,
            //   MaterialPageRoute(builder: (context) => transaksi_pengembalian()),
            // );
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => pengembalian()));
          },
          child: Container(
            width: 303,
            height: 48,
            child: Stack(
              children: [
                Positioned(
                  left: 109,
                  top: 0,
                  child: Container(
                    width: 194,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 194,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 68,
                          top: 16,
                          child: SizedBox(
                            width: 99,
                            height: 17,
                            child: Text(
                              'Pengembalian',
                              style: TextStyle(
                                color: Color(0xFF6E6E6E),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 158,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 158,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFCAFFEF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 31,
                          top: 16,
                          child: SizedBox(
                            width: 84,
                            height: 17,
                            child: Text(
                              'Peminjaman',
                              style: TextStyle(
                                color: Color(0xFF3ABD95),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "images/kakaen_1.jpg",
                            height: 120,
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Simpleman',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 140, 140, 140),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "KKN Di Desa Penari",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter",
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "(Horror)",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter",
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Status:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter",
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Menunggu Konfirmasi",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter",
                                        color: Color(0xFF3ABD95)),
                                  ),
                                ],
                              ),
                              Container(
                                width: 200,
                                height: 19,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 142,
                                        height: 19,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFE7E7E7),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 63,
                                        height: 19,
                                        decoration: ShapeDecoration(
                                          color: Color.fromARGB(
                                              255, 158, 245, 220),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(70),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 4,
                                      top: 5,
                                      child: Text(
                                        'Pengambilan',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 58, 189, 149),
                                          fontSize: 7,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 142,
                                      height: 19,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFE7E7E7),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        width: 63,
                                        height: 19,
                                        decoration: ShapeDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 115, 116),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(70),
                                            ))),
                                      ),
                                    ),
                                    Positioned(
                                      left: 4,
                                      top: 5,
                                      child: Text(
                                        "Pengambilan",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            100,
                                            20,
                                            20,
                                          ),
                                          fontSize: 7,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
