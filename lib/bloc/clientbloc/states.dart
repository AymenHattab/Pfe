import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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

class clienterror extends clientState {}
