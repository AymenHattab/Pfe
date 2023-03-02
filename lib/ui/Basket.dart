import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/bloc/BasketBloc/BasketState.dart';
import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/clientbloc/states.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BasketBloc/BasketEvent.dart';
import '../bloc/clientbloc/events.dart';
import '../model/PanierModel.dart';

final List<panier> Panier = [];

double somme = 0;

class Basket extends StatefulWidget {
  Basket({super.key});
  @override
  State<Basket> createState() => _BasketState();

  // void test(data) {
  //   Panier.add(data);
  //   Panier.forEach((item) {});
  // }
}


BaskecontenttBloc showcontent = BaskecontenttBloc();
BasketBloc Numbercontent = BasketBloc();
@override
class _BasketState extends State<Basket> {
  void initState() {

    Numbercontent = BlocProvider.of<BasketBloc>(context);
      
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromRGBO(0, 102, 255, 1),
                  )),
              IconButton(
                  onPressed: (() => setState(() {
                        Panier.clear();
                      })),
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ))
            ],
          )),

          // SizedBox(
          //   height: 20,
          // ),
          BlocBuilder<BaskecontenttBloc,BasketState>(builder: (context, state) {
            if (state is BasketcontentList){
              return Expanded(
                child: ListView.builder(
                  itemCount: state.ListPanier.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Text(state.ListPanier[index].qte.toString()),
                          Text(state.ListPanier[index].image.toString()),
                        ],
                      ),
                    );
                  }) ,
                ),
              );
            }
            return Container();
          },),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: Panier.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       panier person = Panier[index];
          //       // setState(() {
          //       //   somme = somme + person.qte;
          //       // });
          //       return ListTile(
          //         title: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 IconButton(
          //                     onPressed: (() => setState(() {
          //                           Panier.clear();
          //                         })),
          //                     icon: Icon(
          //                       Icons.edit,
          //                       color: Colors.green,
          //                       size: 15,
          //                     )),
          //                 IconButton(
          //                     onPressed: (() {
          //                       setState(() {
          //                         Panier.removeAt(index);
          //                       });
          //                     }),
          //                     icon: Icon(
          //                       Icons.remove_circle,
          //                       color: Colors.red,
          //                       size: 15,
          //                     )),
          //               ],
          //             ),
          //             Row(
          //               children: <Widget>[
          //                 Image.asset(width: 100, person.image),
          //                 Text(person.image),
          //               ],
          //             ),
          //           ],
          //         ),
          //         subtitle: Text('qte: ${person.qte}'),
          //       );
          //     },
          //   ),
          // ),

          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        "somme",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("$somme"),
                    ],
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                        Numbercontent.add(DeleteBasket());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
