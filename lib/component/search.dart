import 'package:app/component/textfield.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  
  Color background  ; 
  Color colors ; 
  String hint ; 
  IconData icon ; 
   searchbar({super.key,required this.colors ,required this.hint , required this.icon,required this.background });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: background,
          prefixIconColor: background,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: colors), //<-- SEE HERE
            borderRadius: BorderRadius.circular(40.0),
          ),
            prefixIcon: Icon(
              icon,
              color: colors,
            ),
          labelText: hint,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 12,
              color: colors,
              fontFamily: 'Lexend'),
        ),
      ),
    );
  }
}
