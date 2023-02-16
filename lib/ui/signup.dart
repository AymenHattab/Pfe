// ignore_for_file: prefer_const_constructors

import 'package:app/component/textfield.dart';
import 'package:flutter/material.dart';

import '../component/button.dart';
import '../component/signupfield.dart';

class signup extends StatelessWidget {
  void signin() {
    print("hello");
  }

  const signup({super.key});
// width: MediaQuery.of(context).size.width,
  @override
  Widget build(BuildContext context) {
    double interfaceH = MediaQuery.of(context).size.height;
    double interfacew = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Image(
            image: AssetImage("images/lina1.png"),
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
                hint: 'Nom',
              ),
              SizedBox(
                width: 10,
              ),
              signuptextfield(
                hint: 'Prenom',
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: signuptextfield(
              hint: 'Email',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              signuptextfield(
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
          mybutton(Ontap: null, text: 'Sign-up'),
          Text(
            "J'ai deja un compte ",
          )
        ],
      ),
    );
  }
}
