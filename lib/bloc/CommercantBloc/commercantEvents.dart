import 'package:equatable/equatable.dart';

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

}


