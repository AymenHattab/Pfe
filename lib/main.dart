import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/produitbloc/produitbloc.dart';
import 'package:app/component/basket.dart';
import 'package:app/component/notification.dart';
import 'package:app/ui/apitest.dart';
import 'package:app/ui/profile.dart';
import 'package:app/ui/signup.dart';
import 'package:app/ui/login.dart';
import 'package:app/ui/mainpage.dart';
import 'package:app/ui/shopping.dart';
import 'package:app/ui/test.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
import 'package:http/http.dart';

import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<clientbloc>(create: (context) => clientbloc()),
        BlocProvider<Produitbloc>(create: (context) => Produitbloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/login": (context) => login(),
          "/mainpage": (context) => mainpage(),
          "/shop": (context) => shopping(),
          "/signup": (context) => signup(),
          "/profile": (context) => profile(),
          "/apitest": (context) => apitest(),
          "/test": (context) => MyHomePagetest(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

final tabs = [
  const mainpage(),
  const shopping(),
  const profile(),
];
final icon = [
  const notification(),
  const basket(),
  const notification(),
];
final color = [
  Colors.white,
  Colors.blue,
  Colors.white,
];
int _currentIndex = 0;
int i = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      key: _scaffoldKey,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       i = 2;
      //     });
      //   },
      //   child: Icon(Icons.shop),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          color: Color.fromRGBO(0, 102, 255, 1),
          backgroundColor: Colors.transparent,
          height: 49,
          // currentIndex: _currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
              i = _currentIndex;
            });
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(Icons.shop, color: Colors.white, semanticLabel: "azdza"),
            ImageIcon(null)
          ],
        ),
      ),
      drawer: mydrawer(),
      body: Stack(children: [
        tabs[i],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: Icon(
                Icons.menu,
                color: color[i],
              ),
              iconSize: 30,
            ),
            icon[i]
          ],
        ),
      ]),
    );
  }
}
