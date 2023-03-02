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

class clientNotifcationloaded extends clientState {
  client notifcations;
  clientNotifcationloaded(this.notifcations);
}

class clienterror extends clientState {}
