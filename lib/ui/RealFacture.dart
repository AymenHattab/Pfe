import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BasketBloc/BasketBloc.dart';
import '../bloc/BasketBloc/BasketEvent.dart';
import '../bloc/BasketBloc/BasketState.dart';
import '../model/FactureModel.dart';
import '../resources/produitApi.dart';

class RealFacture extends StatefulWidget {
  int id;
  RealFacture({super.key, required this.id});

  @override
  State<RealFacture> createState() => _RealFactureState();
}

class _RealFactureState extends State<RealFacture> {
  BaskecontenttBloc Facturedisplay = BaskecontenttBloc();
  @override
  void initState() {
    var Facturedisplay = BlocProvider.of<BaskecontenttBloc>(context);
    Facturedisplay.add(FactureEvent(widget.id));

    super.initState();
  }

  Widget TextStyling(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromRGBO(0, 85, 255, 1),
          fontFamily: "Lexend",
          decoration: TextDecoration.none,
          fontSize: 15,
          fontWeight: FontWeight.w100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white10,
          child: BlocBuilder<BaskecontenttBloc, BasketState>(
            builder: (context, state) {
              if (state is FactureLoadedState) {
                return Container(
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemCount: state.Facture.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime =
                          DateTime.parse(state.Facture[index].facture!.date!);
                      String Total =
                          state.Facture[index].facture!.montant.toString();
                      String outputDateString =
                          "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                      String nom = state.Facture[index].client!.nom.toString();
                      String prenom =
                          state.Facture[index].client!.prenom.toString();
                      var cartitem = state.Facture[index].card!.cardItem!;
                      return Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_sharp)),
                          const Text(
                            "Facture",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 85, 255, 1),
                              fontFamily: "Lexend",
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            "Client : $nom $prenom",
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 85, 255, 1),
                                fontFamily: "Lexend",
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                fontWeight: FontWeight.w100),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextStyling("commande"),
                                    TextStyling("Date")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextStyling(
                                        state.Facture[index].comId.toString()),
                                    TextStyling(outputDateString)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            color: Color.fromARGB(255, 28, 43, 255),
                            indent: 20,
                            endIndent: 20,
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount:
                                  state.Facture[index].card!.cardItem!.length,
                              itemBuilder: (context, index) {
                                String produit =cartitem[index].produit!.nom.toString();
                                String qte =cartitem[index].qteProduit.toString();
                                String prix =cartitem[index].produit!.prix.toString();
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "$produit ($qte)" , 
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 85, 255, 1)),
                                      ),
                                      TextStyling("$prix dt"),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Total $Total Dt",
                                style: const TextStyle(
                                    color: Color.fromRGBO(0, 85, 255, 1),
                                    fontFamily: "Lexend",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      );
                    },
                  ),
                );
              }
              return Text("error ");
            },
          ),
        ),
      ),
    );
  }
}
