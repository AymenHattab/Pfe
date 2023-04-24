import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class verificationEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class testEvent extends verificationEvents {}

class EmailEvent extends verificationEvents {
   TextEditingController email;
   TextEditingController nom;
  EmailEvent(this.email, this.nom);
}

class PasswordEvent extends verificationEvents {}
