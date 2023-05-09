import 'package:app/bloc/verification/verficationState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';


class commercantManagement {



   final Name = BlocBuilder<CommercantProfileBloc, commercantState>(
      builder: (context, state) {
    if (state is Commercant){
      print("commercant state ==$state");
    String name=state.commercant[0].nom.toString();
    String lastname=state.commercant[0].prenom.toString();
      return Text("$name $lastname",
      style: TextStyle(
        fontSize: 20,color: Colors.white, 
        fontFamily: "Lexend",
        fontWeight: FontWeight.bold
      ),
      );
    }
    else
      return Text("");
  });

   final beneficier = BlocBuilder<CommercantProfileBloc, commercantState>(
      builder: (context, state) {
    if (state is Commercant){
      String ben =state.commercant[0].benificier.toString();
      return Text("$ben %",
      style: TextStyle(
        fontSize: 15,color: Colors.white, 
        fontFamily: "Lexend"
      ),
      );
    }
    else
      return Text("");
  });

   final Image = BlocBuilder<CommercantProfileBloc, commercantState>(
      builder: (context, state) {
    if (state is Commercant){
      
      return CircleAvatar(
                    backgroundImage: NetworkImage(state.commercant[0].image.toString()),
                    radius: 40,
                  );
    }
    else
      return Text("");
  });


              
}