import 'package:app/main.dart';
import 'package:flutter/material.dart';

class Objectif extends StatelessWidget {
  const Objectif({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5,vertical: 15),
      child: ListView(
        children: [
            Container(
              height: 100,
              width:  MediaQuery.of(context).size.width-10,
            )
        ],
      ),
    );
  }
}
