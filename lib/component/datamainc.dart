import 'package:flutter/material.dart';

class data extends StatelessWidget {
  String montant;
  data({super.key, required this.montant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "solde total",
          style: TextStyle(
              fontFamily: 'Lexend', fontSize: 13, color: Colors.white),
        ),
        Text(montant,
            style: TextStyle(
                height: 1,
                fontFamily: 'Lexend',
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Text("0%",
            style: TextStyle(
                fontFamily: 'Lexend', fontSize: 10, color: Colors.white)),
        SizedBox(
          width: 290,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
