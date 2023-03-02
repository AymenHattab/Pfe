import 'package:app/component/map.dart';
import 'package:app/component/navbar.dart';
import 'package:app/component/particles/circle.dart';
import 'package:app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../component/datamainc.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  montant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var test = await prefs.getString('montant') ?? "0DT";
    return test;
  }

  @override
  void initState() {
    super.initState();

    montant().then(
      (value) => setState(() {
        textFromServer = value;
      }),
    );
  }

  String? textFromServer;
  @override
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, "/shop");
      //   },
      //   child: Icon(Icons.shop),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     print(index);
      //     setState(() {
      //       _currentIndex = index;
      //       if (_currentIndex == 1) {
      //         Navigator.pushNamed(context, "/profile");
      //       }
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       backgroundColor: Colors.blue,
      //       label: "Text",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "hello")
      //   ],
      // ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Stack(children: [
                  Positioned(
                      top: -30,
                      left: MediaQuery.of(context).size.width - 80,
                      child: circle()),
                  data(montant: "0"),
                ]),
                height: 177,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 1],
                      colors: [
                        Color.fromRGBO(32, 150, 255, 1),
                        Color.fromRGBO(0, 95, 236, 1),
                      ],
                    ),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(16.0),
                      bottomRight: const Radius.circular(16.0),
                    )),
              )
            ],
          ),
          Flexible(
            child: map(),
          ),
        ],
      ),
    );
  }
}
