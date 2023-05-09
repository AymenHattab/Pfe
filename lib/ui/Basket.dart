import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/bloc/BasketBloc/BasketState.dart';
import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/clientbloc/states.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BasketBloc/BasketEvent.dart';
import '../bloc/FactureBloc/FactureBloc.dart';
import '../bloc/clientbloc/events.dart';
import '../model/PanierModel.dart';
import 'clientMangement.dart';

final List<panier> Panier = [];

String somme = "0";

class Basket extends StatefulWidget {
  double lat;
  double long;
  bool state;
  Basket(
      {super.key, required this.state, required this.lat, required this.long});
  @override
  State<Basket> createState() => _BasketState();
}


BaskecontenttBloc showcontent = BaskecontenttBloc();
BaskecontenttBloc Numbercontent = BaskecontenttBloc();
Facturedraggable draggable = Facturedraggable();
String id = "";

@override
class _BasketState extends State<Basket> {

  Future<void> _showMyDialog(String message ) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(message),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  void initState() {
    draggable = BlocProvider.of<Facturedraggable>(context);
    Numbercontent = BlocProvider.of<BaskecontenttBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<clientselect, clientState>(
      listener: (context, state) {
        if (state is clientselectedState) {
          id = state.id;
        }
      },
      child: BlocListener<BaskecontenttBloc,BasketState>(
        listener: (context, state) {
          print("state basket =$state");
        if (state is BasketMessage) {
          _showMyDialog(state.msg);
        }else {
          // Navigator.pop(context);
        }
      },
        child: Material(
            child: Column(children: [
          BlocBuilder<BaskecontenttBloc, BasketState>(
            builder: (context, state) {
              if (state is BasketcontentList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.ListPanier.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Stack(
                              children: [
                                Image(
                                    width: 150,
                                    image: AssetImage(state
                                        .ListPanier[index].image
                                        .toString())),
                                Positioned(
                                    left: 100,
                                    top: 50,
                                    child: Text(
                                        state.ListPanier[index].qte.toString())),
                              ],
                            ),
                            Text(state.ListPanier[index].nom.toString())
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
              return Container();
            },
          ),
          GestureDetector(
            onTap: () {
              if (widget.state == true) {
                draggable.add(Dragdown());
              } else {
                draggable.add(Dragup());
              }
            },
            child: Align(alignment: Alignment(0, 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 85, 255, 0.548),
                        offset: Offset(1, -5),
                        blurRadius: 20.0)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color.fromRGBO(0, 85, 255, 1),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              widget.state
                                  ? Icons.arrow_upward_outlined
                                  : Icons.arrow_downward_sharp,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            )),
                        Row(
                          children: [
                            Icon(
                              Icons.price_change_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                            BlocBuilder<BaskecontenttBloc, BasketState>(
                              builder: (context, state) {
                                if (state is BasketcontentList) {
                                  somme = state.somme.toString();
                                  return Text(
                                    state.somme.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: "Lexend"),
                                  );
                                }
                                return Container();
                              },
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                  blurRadius: 50.0)
                            ],
                          ),
                          onPressed: () {
                            print("on pressed button");
                            print(somme);
                            Numbercontent.add(
                                Passcommand(id, widget.lat, widget.long, 2, somme));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ])),
      ),
    );
    // );
  }
}
