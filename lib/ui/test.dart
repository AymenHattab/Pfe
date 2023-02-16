import 'package:app/drawer.dart';
import 'package:flutter/material.dart';

class MyHomePagetest extends StatefulWidget {
  const MyHomePagetest({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagetest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(children: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(Icons.menu),
            iconSize: 40,
          )
        ]),
        drawer: mydrawer());
  }
}
