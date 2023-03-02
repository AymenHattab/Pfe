// ignore_for_file: prefer_const_constructors

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
                    color: Colors.white))
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
        SizedBox(
          height: 10,
        ),
        Text(
          "les Objectif actuelle ",
          style: TextStyle(
              color: Color.fromRGBO(0, 102, 255, 1),
              fontSize: 20,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
