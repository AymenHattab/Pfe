// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 10],
            colors: [
              Color.fromRGBO(27, 135, 235, 1),
              Color.fromRGBO(17, 99, 191, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 46,
            ),
            Container(
              width: 340,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: Color.fromRGBO(17, 99, 191, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 80,
                      width: 75,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.a.transfermarkt.technology/portrait/big/28003-1671435885.jpg?lm=1"),
                        backgroundColor: Colors.cyan[100],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Loe Messi',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Lexend',
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          'id:15',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lexend',
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          'Benefit actuelle',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Lexend',
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 320,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(17, 99, 191, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "data",
                        style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 13,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 320,
                height: 396,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(17, 99, 191, 1),
                ),
                child: Text('data'))
          ],
        ));
  }
}
