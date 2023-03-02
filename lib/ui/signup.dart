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

  void dispose() {
    bloc.close();
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

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Image(
                image: AssetImage("images/linaSignUpImage.jpg"),
              ),
              Text(
                "Sign-up",
                style: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(0, 85, 211, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signuptextfield(
                    controlle: nom,
                    hint: 'Nom',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  signuptextfield(
                    controlle: prenom,
                    hint: 'Prenom',
                  ),
                ],
              ),
              msg.nom,
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: signuptextfield(
                  controlle: email,
                  hint: 'Email',
                ),
              ),
              msg.email,
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signuptextfield(
                    controlle: telephone,
                    hint: 'Telephone',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(value: null, groupValue: 1, onChanged: null),
                          Text("commercial")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(value: null, groupValue: 1, onChanged: null),
                          Text("client")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // mybutton(
              //     Ontap: (() => {
              //           bloc.add(
              //             EmailEvent(email, nom),
              //           ),
              //           dispose()
              //         }),
              ElevatedButton(
                onPressed: () {
                  bloc.add(
                    EmailEvent(email, nom),
                  );
                },
                child: null,
              ),

              Text(
                "J'ai deja un compte ",
              )
            ],
          ),
        ),
      ),
    );
  }
}
