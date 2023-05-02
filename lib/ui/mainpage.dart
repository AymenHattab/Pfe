import 'package:app/component/map.dart';
import 'package:app/component/navbar.dart';
import 'package:app/component/particles/circle.dart';
import 'package:app/drawer.dart';
import 'package:app/ui/clientMangement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../component/datamainc.dart';
import '../model/modelTest.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

List<clientModel> test = [];
var displayMapbutton= true; 
class _mainpageState extends State<mainpage> {
  @override
  CommercantProfileBloc displayHistoric = CommercantProfileBloc(secondState());
  void initState() {
    displayHistoric = BlocProvider.of<CommercantProfileBloc>(context);
    displayHistoric.add(CommercantLogged());
    super.initState();
  }

  montant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var test = await prefs.getString('montant') ?? "0DT";
    return test;
  }

  // @override
  // void initState() {
  //   super.initState();

  //   montant().then(
  //     (value) => setState(() {
  //       textFromServer = value;
  //     }),
  //   );
  // }

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
                // ignore: sort_child_properties_last
                child: Stack(children: [
                  // Positioned(top: 150, child: clientsSidebar()),
                  Positioned(
                      top: -30,
                      left: MediaQuery.of(context).size.width - 80,
                      child: circle()),
                  BlocBuilder<CommercantProfileBloc, commercantState>(
                    builder: (context, state) {
                      print("state $state");
                      if (state is Commercant) {
                        print('aaa');
                        return data(
                            montant:
                                state.commercant[0].montantActuelle.toString());
                      }
                      return Container(child: Text("test"));
                    },
                  ),
                  // ListView.builder(itemCount:cm.commercant.length,itemBuilder:(context, index) {
                  //   print(index);
                  //    return data(montant: cm.commercant[index].montantActuelle.toString());
                  // }, )
                ]),
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 1],
                    colors: [
                      Color.fromRGBO(8, 115, 209, 1),
                      Color.fromRGBO(0, 95, 236, 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // IconButton(onPressed: ()=>displayHistoric.add(CommercantLogin("yosri@gmail.com","azerty")), icon: Icon(Icons.add)),

          Flexible(
              child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          )),
        ],
      ),
    );
  }
}
