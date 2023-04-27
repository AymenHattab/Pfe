import 'package:app/component/notification.dart';
import 'package:app/ui/Basket.dart';
import 'package:app/ui/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/FactureBloc/FactureBloc.dart';

class facture extends StatefulWidget {
  const facture({super.key});

  @override
  State<facture> createState() => _factureState();
}

bool drag = false;

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
           Align(alignment: Alignment(0, 1),child: BasketWidget(context, drag)),
           ],
        ),
      ),
    );
  }

  Widget BasketWidget(BuildContext context, State) {
    print(State);
    return Material(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: State ? MediaQuery.of(context).size.height : 49,
        child: Basket(state : State),
      ),
    );
  }
}