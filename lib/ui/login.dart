// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/clientbloc/states.dart';
import 'package:app/component/datamainc.dart';
import 'package:app/model/modelTest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:app/component/button.dart';
import 'package:app/component/textfield.dart';
import 'package:flutter/material.dart';

import '../bloc/clientbloc/events.dart';
import '../component/signup.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final username = TextEditingController();
  final password = TextEditingController();

  dynamic data;

  clientbloc bloc = clientbloc();

  @override
  void initState() {
    bloc = BlocProvider.of<clientbloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        body: BlocListener<clientbloc, clientState>(
          listener: (context, state) {
            print("bbb");
            if (state is clientloading) {
              Navigator.pushNamed(context, "/apitest");
            }
          },
          child: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0, 10],
                    colors: [
                      Color.fromRGBO(12, 112, 203, 1),
                      Color.fromARGB(181, 44, 61, 94),
                    ],
                  ),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Text(
                          "Nom  utilisateur",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  textfield(
                    controlle: username,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Text(
                          "MotdePass",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  textfield(
                    controlle: password,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Row(
                      children: [
                        Text("motdepass oublié",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  mybutton(
                    Ontap: (() => bloc.add(
                        clientbuttonPressed(username.text, password.text))),
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Flexible(
                    child: Image(
                      image: AssetImage('images/ad2.png'),
                    ),
                  ),
                ])),
          ),
        ));
  }
}
