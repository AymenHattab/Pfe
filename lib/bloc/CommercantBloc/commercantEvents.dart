import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class commercantEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class irstEvent extends commercantEvents {
}
class HistoriqueEvent extends commercantEvents {
}
class CommandeEvent extends commercantEvents {
}
class CommercantLogin extends commercantEvents {
  String email ; 
  String mdp ; 
  CommercantLogin(this.email , this.mdp);
}
class CommercantLogged extends commercantEvents {
 BuildContext context ; 
 CommercantLogged(this.context);
 List<Object?> get props =>[context];
}
class searchBydate extends commercantEvents {
 String  date ; 
 searchBydate(this.date);
 List<Object?> get props =>[date];
}


