import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  Widget Messageform(String message) {
    print("message est "+message);
    return Row(children: [
      Icon(
        Icons.block,
        color: Colors.red,
        size: 15,
      ),
      Text(
        message,
        style: TextStyle(color: Colors.red, fontFamily: "Lexend"),
      )
    ]);
  }
class verfication {

  Widget Emailcheck(TextEditingController email) {
    print(email.value.text);
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.value.text))
        {
            print("false");
      return Messageform("wrong email");
        }
    else{
      print("true");
      return Messageform('');
    }
  }

  Widget Namecheck(TextEditingController email) {
    if (email.value.text == "")
      return Messageform("nom wrong");
    else
      return Text("");
  }
}
