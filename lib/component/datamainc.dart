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
          "totale balance",
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
        Text("20%",
            style: TextStyle(
                fontFamily: 'Lexend', fontSize: 10, color: Colors.white)),
        SizedBox(
          width: 290,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        )
      ]),
    );
  }
}
