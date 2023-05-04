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
var displayMapbutton = true;
bool menudrag = false;

class _mainpageState extends State<mainpage> {
  @override
  CommercantProfileBloc displayHistoric = CommercantProfileBloc(secondState());
  void initState() {
    // displayHistoric = BlocProvider.of<CommercantProfileBloc>(context);
    // displayHistoric.add(CommercantLogged(context));
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
   
      body: Stack(
        children: [
          const Flexible(child: map()),
          AnimatedContainer(
            clipBehavior: Clip.none,
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                BlocBuilder<CommercantProfileBloc, commercantState>(
                  builder: (context, state) {
                    print("state $state");
                    if (state is Commercant) {
                      print('aaa');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data(
                              montant: state.commercant[0].montantActuelle
                                  .toString()),
                          AnimatedContainer(
                            
                            duration: Duration(seconds: 1),
                            height: menudrag ? 250 : 0,
                            curve: Curves.decelerate,
                            child: ListView.builder(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                itemCount: state.commande[0].commande!.length,
                                itemBuilder: (context, index) {
                                  var name = state.commande[0].commande![index].client!.nom.toString();
                                  var lastname = state.commande[0].commande![index].client!.prenom.toString();
                                  var date = state.commande[0].commande![index].facture?.date.toString(); 
                                  if (date == null ){
                                    date ="";
                                  }
                                  return Container(
                                    height: 50,
                                    width: 100,
                                    color: Colors.white10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "$name  $lastname", style: TextStyle(color: Colors.white,fontSize: 15, fontFamily: "lexend"),),
                                        Text(
                                            date, style: TextStyle(color: Colors.white,fontSize: 15, fontFamily: "lexend"),),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }
                    return Container(child: const Text("test"));
                  },
                ),
                  Flexible(
                    child: Align(alignment: Alignment(0, 1),child: IconButton(onPressed: (){
                                  if (menudrag == false ){
                    setState(() {
                    menudrag = true ; 
                    });
                                  }else {setState(() {
                    menudrag = false  ; 
                    }); }
                                }, icon: Icon(Icons.maximize_outlined, color: Colors.white, size: 40,))),
                  )

              ],
            ),
            height: menudrag ? 400 : 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 1],
                colors: [
                  Color.fromRGBO(8, 115, 209, 1),
                  Color.fromRGBO(0, 95, 236, 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
