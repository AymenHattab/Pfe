import 'package:flutter/material.dart';

class data extends StatelessWidget {
  String montant;
  data({super.key, required this.montant});

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Title"),
              content: Text("Content"),
            );
          },
        );

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 35),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "totale balance",
              style: TextStyle(
                  fontFamily: 'Lexend', fontSize: 13, color: Colors.white),
            ),
            IconButton(
                onPressed: () => openDialog(),
                icon: Icon(
                  Icons.notifications,
                  size: 20,
                  color: Colors.white,
                ))
          ],
        ),
        Text(montant,
            style: TextStyle(
                height: 0.7,
                fontFamily: 'Lexend',
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Text("20%",
            style: TextStyle(
                fontFamily: 'Lexend', fontSize: 10, color: Colors.white)),
      ]),
    );
  }
}
