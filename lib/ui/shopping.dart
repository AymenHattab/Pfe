import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/bloc/produitbloc/produitbloc.dart';
import 'package:app/bloc/produitbloc/produitsevents.dart';
import 'package:app/bloc/produitbloc/produitstates.dart';
import 'package:app/component/search.dart';
import 'package:app/component/signupfield.dart';
import 'package:app/component/textfield.dart';
import 'package:app/model/Produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Produitbloc _produitbloc = Produitbloc(Produitloadingevent());
  void initState() {
    _produitbloc = BlocProvider.of<Produitbloc>(context);
    _produitbloc.add(Produitloadingevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
  

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
              height: 20,
            ),
            searchbar(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        color: Color.fromARGB(0, 224, 224, 224),
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.factory,
                          color: Colors.blue,
                        )),
                  ),
                  IconButton(onPressed: null, icon: Icon(Icons.house)),
                  IconButton(onPressed: null, icon: Icon(Icons.pets))
                ],
              ),
            ),
            SizedBox(
              height: 30,
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
                              onAddToCart: (newCart) {
                                setState(() {
                                  var cart = newCart;
                                  print(cart);
                                });
                              },
                              Titre: state.pr[index].data![index].color!),
                        );
                      },
                    );
                  }
                  return Container();
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
