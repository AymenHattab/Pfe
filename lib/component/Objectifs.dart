import 'package:flutter/material.dart';

class Objectif extends StatelessWidget {
  const Objectif({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 102, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Text(
                      'objectif 1 ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lexend",
                          fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  '5/50',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Lexend", fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 102, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 50,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'objectif 2 ',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Lexend", fontSize: 20),
                ),
                Text(
                  '5/50',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Lexend", fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
