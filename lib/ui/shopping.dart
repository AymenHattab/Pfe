import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/bloc/produitbloc/produitbloc.dart';
import 'package:app/bloc/produitbloc/produitsevents.dart';
import 'package:app/bloc/produitbloc/produitstates.dart';
import 'package:app/component/search.dart';
import 'package:app/component/signupfield.dart';
import 'package:app/component/textfield.dart';
import 'package:app/main.dart';
import 'package:app/model/Produit.dart';
import 'package:app/ui/clientMangement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BasketBloc/BasketState.dart';
import '../bloc/FactureBloc/FactureBloc.dart';
import '../bloc/clientbloc/states.dart';
import '../component/button.dart';
import '../component/productcontainer.dart';
import '../model/PanierModel.dart';

final List P = [];

class shopping extends StatefulWidget {
  shopping({super.key});

  @override
  State<shopping> createState() => _shoppingState();
}

class _shoppingState extends State<shopping> {
  final password = TextEditingController();

  Produitbloc _produitbloc = Produitbloc(Produitloadingevent(4));
  @override
  BasketBloc Numbercontent = BasketBloc();
Facturedraggable draggable = Facturedraggable();
  void initState() {
    _produitbloc = BlocProvider.of<Produitbloc>(context);
    _produitbloc.add(Produitloadingevent(4));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pressed = 0;
    return Scaffold(
        body: BlocListener<Produitbloc, ProduitState>(
      listener: (context, state) {
        if (state is ProduitLoading) {
          CircularProgressIndicator();
        }
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // Container(
            //   height:150 ,
            //   child :clientsSidebar(),
            //   color : Color.fromRGBO(0, 95, 236, 1),
            // ),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                clientsSidebar(),
                // Icon(Image.asset(é)),

                // add some space between the icon and the text field
                SizedBox(width: 10),
                searchbar(
                  background: Color.fromARGB(0, 244, 67, 54),
                  colors: Colors.blue,
                  hint: "recherche un produit",
                  icon: Icons.search,
                ),
              
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: BlocBuilder<Produitbloc, ProduitState>(
                builder: ((context, state) {
                  if (state is ProduitLoaded) {
                    return ListView.builder(
                      clipBehavior: Clip.hardEdge,
                      scrollDirection: Axis.horizontal,
                      itemExtent: MediaQuery.of(context).size.width /
                          state.categrory.length,
                      itemCount: state.categrory.length,
                      itemBuilder: (BuildContext context, int index) {
                        String iconName =
                            state.categrory[0].category![index].category!;
                        IconData iconData = IconData(int.parse('$iconName'),
                            fontFamily: 'MaterialIcons');
                        return IconButton(
                          onPressed: () {
                            _produitbloc.add(Produitloadingevent(state.categrory[0].category![index].id!));
                            setState(() {
                              pressed = index;
                            });
                            print(" on pressed $pressed");
                          },
                          icon: Icon(
                            iconData,
                            color: pressed == index ? Colors.blue : Colors.grey,
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
              ),
            ),

            // mybutton(
            //   Ontap: (() => _produitbloc.add(Produitloadingevent())),
            //   text: 'Login',
            // ),

            Expanded(
              child: BlocBuilder<Produitbloc, ProduitState>(
                builder: ((context, state) {
                  if (state is ProduitLoaded) {
                    return GridView.builder(
                      clipBehavior: Clip.hardEdge,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 15,
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: state.pr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: containerproduct(
                            idProduct  : state.pr[index].produit![index].id!,
                              image: state.pr[index].produit![index].image!,
                              prize: state.pr[index].produit![index].prix!,
                              color: state.pr[index].produit![index].color!,
                              onAddToCart: (newCart) {
                                setState(() {
                                  var cart = newCart;
                                  print(cart);
                                });
                              },
                              Titre: state.pr[index].produit![index].nom!),
                        );
                      },
                    );
                  }
                  return Container(height : 10,width: 10 , child: CircularProgressIndicator(),);
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
