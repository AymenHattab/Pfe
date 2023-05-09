import 'package:app/component/signupfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clientbloc/bloc.dart';
import '../bloc/clientbloc/events.dart';
import 'button.dart';


class addClient extends StatefulWidget {
  final PageController controller ;
   addClient({required this.controller,super.key});

  @override
  State<addClient> createState() => _addClientState();
}

class _addClientState extends State<addClient> {



  final nom = TextEditingController();
  final prenom = TextEditingController();
  final number = TextEditingController();
    clientbloc bloc = clientbloc(clientbuttonNotifcationsPressed());
  void initState(){
    bloc = BlocProvider.of<clientbloc>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: Container(
            height: 70.0,
            width: 70.0,
            color: Color.fromARGB(255, 14, 38, 255),
            child: Icon(Icons.person_add_alt_1_rounded , color: Colors.white, size: 50.0),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.75,
          child: signuptextfield(
            controlle: nom,
            hint: 'Nom',
            icon: Icon(
              Icons.person,
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.75,
          child: signuptextfield(
            controlle: prenom,
            hint: 'Prenom',
            icon: Icon(
              Icons.person,
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.75,
          child: signuptextfield(
            controlle: number,
            hint: 'Numero de telphone ',
            icon: Icon(
              Icons.phone,
              color: Color.fromRGBO(0, 85, 211, 1),
            ),
          ),
        ),
        mybutton(
            Ontap: ()=> {
              bloc.add(AddClient(nom.text,prenom.text,number.text)),
              bloc.add(clientbuttonNotifcationsPressed()),
              widget.controller.previousPage(duration:Duration(seconds:1 ), curve: Curves.linear),
            },
            text: "Ajouter un client",
            size: ((MediaQuery.of(context).size.width / 1.75))),
      ],
    );
  }
}
