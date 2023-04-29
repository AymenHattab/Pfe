// ignore_for_file: prefer_const_constructors

import 'package:app/component/Objectifs.dart';
import 'package:app/component/historique.dart';
import 'package:app/component/particles/circle.dart';
import 'package:app/main.dart';
import 'package:app/ui/statics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../blocbuilderManagment.dart/commercantManagement.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  commercantManagement CM = commercantManagement();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            clipBehavior: Clip.hardEdge,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  
                 CM.Image,
                  CM.Name,
                  CM.beneficier,
                ]),
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 102, 255, 1),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(89.0),
                      bottomRight: const Radius.circular(89.0),
                    )),
              ),
              Positioned(left: 350, top: -50, child: circle()),
              Positioned(left: -50, top: 10, child: circle()),
              Positioned(
                top: 190,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Objectif",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Lexend",
                          fontSize: 13),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Historique",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Lexend",
                          fontSize: 13),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Statistiue",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Lexend",
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ]),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: PageView(children: [Objectif(), historique(),statics()]),
        )
      ],
    );
  }
}
