import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/bloc/CommercantBloc/commercantState.dart';
import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/produitbloc/produitbloc.dart';
import 'package:app/bloc/verification/blocverification.dart';
import 'package:app/component/basket.dart';
import 'package:app/component/notification.dart';
import 'package:app/resources/verficationMethod.dart';
import 'package:app/ui/Basket.dart';
import 'package:app/ui/Facture.dart';
import 'package:app/ui/SignupAndsingin.dart';
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

import '../bloc/BasketBloc/BasketState.dart';
import '../blocbuilderManagment.dart/commercantManagement.dart';
import '../drawer.dart';




class mainview extends StatefulWidget {

  const mainview({super.key});

  @override
  State<mainview> createState() => _MyAppState();
}

class _MyAppState extends State<mainview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          subtitle1: TextStyle(
              color: Color.fromRGBO(0, 85, 211, 1),
              fontFamily: "Lexend",
              fontSize: 15),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final tabs = [
  const mainpage(),
  shopping(),
  const profile(),
];

final icon = [
  const notification(),
  Stack(children: [
    Positioned(
        left: 5,
        top: 5,
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketcontentNumber) {
              return Text(
                state.Number.toString(),
                style: TextStyle(color: Colors.blue),
              );
            }
            return Container();
          },
        )),
    const basket()
  ]),
  const notification(),
];
final color = [
  Colors.white,
  Colors.blue,  Colors.white,
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

      commercantManagement CM = commercantManagement(); 
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { 
    return SafeArea(
      child: Scaffold(
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
              Icon(Icons.add_shopping_cart_sharp,
                  color: Colors.white, semanticLabel: "azdza"),
              SizedBox(height: 30,child: CM.Image)
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
      ),
    );
  }
}
