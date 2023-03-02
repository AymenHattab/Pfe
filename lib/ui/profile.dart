// ignore_for_file: prefer_const_constructors

import 'package:app/component/Objectifs.dart';
import 'package:app/component/historique.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: null,
              radius: 45,
            ),
            Text("foulen fouleni ",
                style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
          height: 230,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 102, 255, 1),
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(89.0),
                bottomRight: const Radius.circular(89.0),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Objectif",
                style: TextStyle(
                    color: Colors.blue, fontFamily: "Lexend", fontSize: 13),
              ),
              Text(
                "Historique",
                style: TextStyle(
                    color: Colors.blue, fontFamily: "Lexend", fontSize: 13),
              ),
              Text(
                "Statistiue",
                style: TextStyle(
                    color: Colors.blue, fontFamily: "Lexend", fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: PageView(children: [Objectif(), historique()]),
        )
      ],
    );
  }
}
