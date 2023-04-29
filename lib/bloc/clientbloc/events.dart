import 'package:app/model/modelTest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
//clientState
abstract class clientEvents extends Equatable {
  const clientEvents();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class clientloadedevent extends clientEvents {}

class clientbuttonPressed extends clientEvents {
  final String email;
  final String psw;
  clientbuttonPressed(this.email, this.psw);
}
class clientselectedEvent extends clientEvents {
  final String id ; 
  final String Image ; 
  final String firstName ; 
  final String LastName ;
  clientselectedEvent(this.id,this.Image,this.firstName, this.LastName );
  List<Object?> get props => [Image,firstName,LastName];
}

class clientbuttonNotifcationsPressed extends clientEvents {}

class AddClient extends clientEvents {
  final String nom ; 
  final   String Prenom ; 
  final String num ; 
  AddClient (this.nom , this.Prenom , this.num) ; 
}





