import 'package:flutter/material.dart';
import '../model/modelTest.dart';
import '../model/singelclient.dart';

class buildcard extends StatelessWidget {
  sclient model;
  buildcard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("hello: ${model.data!.firstName}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
