import 'package:app/bloc/BasketBloc/BasketBloc.dart';
import 'package:app/component/particles/circle.dart';
import 'package:app/main.dart';
import 'package:app/ui/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BasketBloc/BasketEvent.dart';
import '../model/PanierModel.dart';
import '../ui/Basket.dart';
import '../ui/apitest.dart';

class containerproduct extends StatefulWidget {
  Function(List<panier>) onAddToCart;
  int idProduct ; 
  String Titre;
  String color;
  String image ; 
  int prize ; 
  
  containerproduct({Key? key,required this.idProduct, required this.Titre,required this.image,required this.prize,required this.color, required this.onAddToCart})
      : super(key: key);
  @override
  State<containerproduct> createState() => _containerproductState();
}

class _containerproductState extends State<containerproduct> {

  BaskecontenttBloc addcontent = BaskecontenttBloc();
  BasketBloc Numbercontent = BasketBloc();
  @override
  void initState() {

    addcontent = BlocProvider.of<BaskecontenttBloc>(context);
    Numbercontent = BlocProvider.of<BasketBloc>(context);
    
    super.initState();
  }

 
  int Number = 1;
  // Basket p = Basket(state:  false,);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            Positioned(
              top: 10,
              child: Container(
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                    color: widget.color.toColor(),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Positioned(left: 70, child: circle()),
            Positioned(left: -40, top: 150, child: circle()),
            Positioned(
              top: -30,
              left: -95,
              child: Image(
                  width: 100,
                  image: NetworkImage(
                    widget.image,
                  )),
            ),
            Positioned(
              left: -10,
              top: -10,
              child: Container(
                decoration: BoxDecoration(
                    color: widget.color.toColor(),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100))),
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(
                      size: 20,
                      Icons.add_shopping_cart_sharp,
                      color: Colors.white,
                    ),
                    
                    onPressed: (() {
                      addcontent.add(AddListToBasket(panier("images/pr1.png", widget.Titre, Number, "type",widget.idProduct,widget.prize)));
                      Numbercontent.add(NumberOfBasket());
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
        height: 160,
        width: 180,
        decoration: BoxDecoration(color: Color.fromARGB(0, 33, 149, 243)),
      ),
      Positioned(
        top: 30,
        left: 10,
        child: Container(
          // ignore: sort_child_properties_last
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.Titre,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "lexend",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                widget.Titre,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "lexend",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Positioned(
                top:100,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.white),
                      onPressed: () => setState(() {
                        if (Number != 1) {
                          Number--;
                        }
                      }),
                    ),
                    Text(
                      "$Number",
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (() {
                        setState(() {
                          Number++;
                        });
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
          height: 160,
          width: 180,
          decoration: BoxDecoration(color: Color.fromARGB(0, 244, 67, 54)),
        ),
      ),
    ]);
  }
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
