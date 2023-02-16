import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mybutton extends StatelessWidget {
  final Function()? Ontap;
  final String text;
  const mybutton({super.key, required this.Ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: Container(
          height: 30,
          width: 154,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(8, 85, 211, 1),
              borderRadius: BorderRadius.circular(24)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'SpaceGrotesk',
            ),
          )),
        ),
      ),
    );
  }
}
