import 'package:app/component/notification.dart';
import 'package:app/model/clientModel.dart';
import 'package:app/ui/Basket.dart';
import 'package:app/ui/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/FactureBloc/FactureBloc.dart';

class facture extends StatefulWidget {
   double lat ; 
  double long ;
   facture({super.key,required this.lat,required this.long});

  @override
  State<facture> createState() => _factureState();
}

bool drag = false;
    String name="" ;
  String lastname="" ;
class _factureState extends State<facture> {
  Facturedraggable draggable = Facturedraggable();
  void initState() {
    draggable = BlocProvider.of<Facturedraggable>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<Facturedraggable, bool>(
          listener: (context, state) {
            setState(() {
              drag = state;
            });
          },
        )
      ],
      
      child: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            shopping(),
           Align(alignment: Alignment(0, 1),child: BasketWidget(context,drag,widget.lat,widget.long)),
           ],
        ),
      ),
    );
  }

  Widget BasketWidget(BuildContext context, State , double lat , double long ) {
    print(State);
    return Material(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: State ? MediaQuery.of(context).size.height : 49,
        child: Basket(state : State , lat: lat ,long:long ),
      ),
    );
  }
}
