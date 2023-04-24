import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mybutton extends StatelessWidget {
  final Function()? Ontap;
  final _formKey = GlobalKey<FormState>();
  final String text;
  final double size;
  mybutton({super.key, required this.Ontap, required this.text, required,required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        height: 50,
        width: size,
        decoration: BoxDecoration(
            color:  Color.fromRGBO(0, 85, 211, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SpaceGrotesk',
          ),
        )),
      ),
    );
  }
}
