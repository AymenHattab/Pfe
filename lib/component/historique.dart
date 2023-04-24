import 'package:app/bloc/CommercantBloc/commercantEvents.dart';
import 'package:app/bloc/verification/verficationState.dart';
import 'package:app/model/modelTest.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../bloc/clientbloc/bloc.dart';

class historique extends StatefulWidget {
  const historique({super.key});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  @override
  ProfileData displayHistoric = ProfileData();
  
  void initState() {
    displayHistoric = BlocProvider.of<ProfileData>(context);
    displayHistoric.add(HistoriqueEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text('Historique transaction',style: TextStyle(
        color: Color.fromRGBO(0,102,255,1),
        fontFamily: 'Lexend',
        fontSize: 27,
        fontWeight: FontWeight.bold
       ),),
       SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<ProfileData, commercantState>(
            builder: (context, state) {
              print(state);
              if (state is HistoriqueDisplayed) {
  
                return Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                       separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                    itemCount: state.historique.length,
                    itemBuilder: (context, index) {
                      
                      DateTime dateTime = DateTime.parse(state.historique[index].date.toString());
                      String outputDateString =
                          "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                      var montant = state.historique[index].montant;
                      return Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 102, 255, 1),
                          borderRadius: BorderRadius.circular(5)
                        ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                            Text(outputDateString,style: TextStyle(
                              fontFamily: 'Lexend',
                              color: Colors.white,
                              fontSize: 23
                            ),),
                            Text("$montant dt" ,style : TextStyle(
                              fontFamily: 'Lexend',
                              color: Colors.white,
                              fontSize: 23
                            ),),
                                                  ],
                                                ),
                          )
                          );
                          
                    },
                  ),
                );
              }
              return Container(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
