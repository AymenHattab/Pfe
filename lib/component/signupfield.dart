import 'package:flutter/material.dart';

class signuptextfield extends StatelessWidget {
  final String hint;
  final controlle;
  const signuptextfield({
    super.key,
    required this.hint,
    required this.controlle,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return SizedBox(
      width: 150,
      height: 30,
      child: TextFormField(
        controller: controlle,
        validator: (value) {
          if (value == null) return "sa7it";
        },
        textAlign: TextAlign.center,
        cursorColor: Color.fromRGBO(0, 85, 211, 1),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 9,
              color: Color.fromRGBO(0, 85, 211, 1),
              fontFamily: 'Lexend'),
          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),

          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),

          // ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: Color.fromRGBO(0, 85, 211, 1)), //<-- SEE HERE
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
