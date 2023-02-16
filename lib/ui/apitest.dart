import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/component/buildcart.dart';
import 'package:app/ui/mainpage.dart';
import 'package:app/ui/profile.dart';
import 'package:app/ui/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/navbar.dart';
import '../model/modelTest.dart';

class apitest extends StatefulWidget {
  const apitest({super.key});

  @override
  State<apitest> createState() => _apitestState();
}

class _apitestState extends State<apitest> {
  final clientbloc _bloc = clientbloc();

  @override
  void initState() {
    super.initState();
  }

  final tabs = [
    const mainpage(),
    const profile(),
    const shopping(),
  ];
  int _currentIndex = 0;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              i = 2;
            });
          },
          child: Icon(Icons.shop),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
              i = _currentIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              label: "Text",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "hello"),
          ],
        ),
        body: tabs[i]);
  }
}
