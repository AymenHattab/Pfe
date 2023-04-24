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

double somme = 0;

class Basket extends StatefulWidget {
  bool state;
  Basket({super.key, required this.state});
  @override
  State<Basket> createState() => _BasketState();
}

BaskecontenttBloc showcontent = BaskecontenttBloc();
BasketBloc Numbercontent = BasketBloc();
Facturedraggable draggable = Facturedraggable();

@override
class _BasketState extends State<Basket> {
  void initState() {
    draggable = BlocProvider.of<Facturedraggable>(context);
    Numbercontent = BlocProvider.of<BasketBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                                image: AssetImage(
                                    state.ListPanier[index].image.toString())),
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
        // onVerticalDragUpdate: (details) => {
        //   if (widget.state == true )
        //     {draggable.add(Dragdown())}
        //   else
        //     {draggable.add(Dragup())}
        // },

        onTap: () {
          if (widget.state == true) {
            draggable.add(Dragdown());
          } else {
            draggable.add(Dragup());
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color:Color.fromRGBO(0, 85, 255, 0.548) ,
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
                      Text(
                        "242.3 DT",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: "Lexend"),
                      ),
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
                      Numbercontent.add(DeleteBasket());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
    // );
  }
}
