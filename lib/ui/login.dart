// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui';

import 'package:app/bloc/CommercantBloc/commercantState.dart';
import 'package:app/bloc/clientbloc/bloc.dart';
import 'package:app/bloc/clientbloc/states.dart';
import 'package:app/bloc/verification/blocverification.dart';
import 'package:app/bloc/verification/verficationState.dart';
import 'package:app/bloc/verification/verifcationMsg.dart';
import 'package:app/component/datamainc.dart';
import 'package:app/main.dart';
import 'package:app/model/modelTest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:app/component/button.dart';
import 'package:app/component/textfield.dart';
import 'package:flutter/material.dart';

import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../bloc/clientbloc/events.dart';
import '../bloc/verification/verificationEvent.dart';
import '../component/signup.dart';
import '../component/signupfield.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final username = TextEditingController();
  final password = TextEditingController();

  dynamic data;

  CommercantProfileBloc bloc = CommercantProfileBloc(FirstState());
  verificationbloc verificationbloc1 = verificationbloc();

  @override
  void initState() {
    bloc = BlocProvider.of<CommercantProfileBloc>(context);
    verificationbloc1 = BlocProvider.of<verificationbloc>(context);
    super.initState();
  }

  Message msg = Message();
  var testText=Text("set"); 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.8),
      child: Material(
        color: Color.fromARGB(0, 244, 67, 54),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[0],
              borderRadius: BorderRadius.circular(12),
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 18),
                ),
             
            
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 20),
                ),
             
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 1.5) - 15,
                  child: signuptextfield(
                    controlle: username,
                    hint: 'Email',
                    icon: Icon(Icons.person_2_outlined,color:Color.fromRGBO(0, 85, 211, 1) ,),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 30),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 1.5) - 15,
                  child: signuptextfield(
                    controlle: password,
                    hint: 'Password',
                    icon: Icon(Icons.password,color:Color.fromRGBO(0, 85, 211, 1),
                  ),
                ),),
                // SizedBox(
                //   height: (MediaQuery.of(context).size.height / 30),
                // ),
                MultiBlocListener(
                  listeners:[ BlocListener<CommercantProfileBloc,commercantState>(listener:(context, state) {
                    if (state is CommercantLoginMessage ){
                      print(state.msg);
                      if (state.msg == "accepted"){
                        print(state.msg);
                        Navigator.pushNamed(context, "/mainview");}
                  else{
                        setState(() {
                           testText= Text("email ou motdepasse et incorrect ",
                        style : TextStyle(
                    fontFamily: "Lexend",
                    color: Colors.red,
                    fontSize: 13
                  ),
                         
                         );
                        }
                        );
                        
                      }  
                    
                  }},
                
                   ),
              ], child: Container(),),
              testText,
                mybutton(
                    Ontap:()=> bloc.add(CommercantLogin(username.text,password.text)),
                    text: "login",
                    size: ((MediaQuery.of(context).size.width / 1.5) - 15)),
                Align(
                  alignment: Alignment(-0.5,0),
                  child: Text("motdepasse oublie ? ",
                  style: TextStyle(
                    fontFamily: "Lexend",
                    color: Color.fromRGBO(0, 85, 211  , 1),
                    fontSize: 13
                  ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
