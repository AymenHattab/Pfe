import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class verificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class test extends verificationState {}

class EmailState extends verificationState {
  Widget email;
  Widget nom;
  EmailState(this.email, this.nom);
  @override
  List<Object?> get props => [this.email,this.nom];
}

class PasswordState extends verificationState {
  String message;
  PasswordState(this.message);
}
