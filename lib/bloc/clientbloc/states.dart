import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/modelTest.dart';
import '../../model/singelclient.dart';

@immutable
//clientState
abstract class clientState extends Equatable {
  const clientState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class clientloading extends clientState {}

class clientloaded extends clientState {
  final sclient cl;
  clientloaded(this.cl);
}

class clientselectedState extends clientState {
  String id ;
   String image ; 
   String firstName ; 
   String LastName;
  clientselectedState(this.id,this.image,this.firstName, this.LastName);
  List<Object?> get props => [id,image,firstName,LastName];
}


class clientNotifcationloaded extends clientState {
  List <Client>  client;
  clientNotifcationloaded(this.client);
  List<Object?> get props => [client];
}

class clienterror extends clientState {}
