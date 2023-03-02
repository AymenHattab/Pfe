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

class clientbuttonNotifcationsPressed extends clientEvents {}
