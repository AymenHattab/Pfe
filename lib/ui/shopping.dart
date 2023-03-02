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

class shopping extends StatefulWidget {
  const shopping({super.key});

  @override
  State<shopping> createState() => _shoppingState();
}

Produitbloc _produitbloc = Produitbloc();

class _shoppingState extends State<shopping> {
  @override
  void initState() {
    _produitbloc = BlocProvider.of<Produitbloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          searchbar(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.factory,
                    color: Colors.blue,
                  )),
              IconButton(onPressed: null, icon: Icon(Icons.factory)),
              IconButton(onPressed: null, icon: Icon(Icons.factory))
            ],
          ),
          mybutton(
            Ontap: (() => _produitbloc.add(Produitloadingevent())),
            text: 'Login',
          ),
          Expanded(
            child: BlocBuilder<Produitbloc, ProduitState>(
              builder: ((context, state) {
                if (state is ProduitLoaded) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200),
                    itemCount: state.pr.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: containerproduct(
                            Titre: state.pr.data![index].color!),
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
    ));
  }
}
