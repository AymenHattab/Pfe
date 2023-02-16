// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 23,
        width: 79,
        child: const Center(
            child: Text(
          "SIGN-UP ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'SpaceGrotesk',
          ),
        )),
        decoration: BoxDecoration(
            // color: Color.fromRGBO(8, 239, 163, 1),
            border: Border.all(
          color: Color.fromRGBO(8, 239, 163, 1),
          width: 1,
        )),
      ),
    );
  }
}
