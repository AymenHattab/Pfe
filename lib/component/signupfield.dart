import 'package:flutter/material.dart';

class signuptextfield extends StatelessWidget {
  final String hint;

  const signuptextfield({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return SizedBox(
      width: 150,
      child: Flexible(
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Color.fromRGBO(0, 85, 211, 1),
                fontFamily: 'Lexend'),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.0),

            // ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 85, 211, 1)), //<-- SEE HERE
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ),
    );
  }
}
