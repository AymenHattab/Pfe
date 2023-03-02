import 'package:app/component/textfield.dart';
import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 29,
        width: 228,
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(0, 85, 211, 1)), //<-- SEE HERE
              borderRadius: BorderRadius.circular(40.0),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
            labelText: "rechercher un produit ",
            labelStyle: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Color.fromRGBO(0, 85, 211, 1),
                fontFamily: 'Lexend'),
          ),
        ),
      ),
    );
  }
}
