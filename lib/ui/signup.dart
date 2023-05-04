// ignore_for_file: prefer_const_constructors

import 'package:app/bloc/verification/blocverification.dart';
import 'package:app/bloc/verification/verifcationMsg.dart';
import 'package:app/component/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/verification/verificationEvent.dart';
import '../component/button.dart';
import '../component/signupfield.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  verificationbloc bloc = verificationbloc();
  @override
  void initState() {
    bloc = BlocProvider.of<verificationbloc>(context);
    super.initState();
  }

 

  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();

  final password = TextEditingController();

  final telephone = TextEditingController();

  final nom = TextEditingController();

  final prenom = TextEditingController();

// width: MediaQuery.of(context).size.width,
  @override
  Widget build(BuildContext context) {
    Message msg = Message();
    double interfaceH = MediaQuery.of(context).size.height;
    double interfacew = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment(0, 0.6),
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
                  height: (MediaQuery.of(context).size.height / 25),
                ),
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    signuptextfield(
                      controlle: email,
                      hint: 'Nom',
                      icon: Icon(Icons.person,color:Color.fromRGBO(0, 85, 211, 1) ,),
                    ),
                    SizedBox(width: 10,),
                    signuptextfield(
                      controlle: email,
                      hint: 'Prenom',
                      icon: Icon(Icons.person,color:Color.fromRGBO(0, 85, 211, 1) ,),
                    ),
                  ],
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 80),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 1.25) ,
                    child: signuptextfield(
                      controlle: password,
                      hint: 'email',
                      icon: Icon(Icons.email,color:Color.fromRGBO(0, 85, 211, 1),
                    ),
                ),),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 80),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 1.25),
                  child: signuptextfield(
                    controlle: password,
                    hint: 'Password',
                    icon: Icon(Icons.password,color:Color.fromRGBO(0, 85, 211, 1),
                  ),
                ),),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 80),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    signuptextfield(
                      controlle: password,
                      hint: 'telephone',
                      icon: Icon(Icons.phone,color:Color.fromRGBO(0, 85, 211, 1),
                    ),
                    ),
                    SizedBox(width: 10,),
                    signuptextfield(
                      controlle: password,
                      hint: 'Password',
                      icon: Icon(Icons.password,color:Color.fromRGBO(0, 85, 211, 1),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 80),
                ),
                mybutton(
                    Ontap: null,
                    text: "Sign-up",
                    size: ((MediaQuery.of(context).size.width / 1.25) )),
            
              ],
            )),
      ),
    );

  }
}
