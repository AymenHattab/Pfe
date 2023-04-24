

import 'package:app/component/historique.dart';
import 'package:equatable/equatable.dart';

import '../../model/modelTest.dart';
class commercantState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class FirstState  extends commercantState{

}
class secondState  extends commercantState{

}
class HistoriqueDisplayed  extends commercantState{
  List <Historique> historique = [] ; 
  HistoriqueDisplayed(this.historique);
  List<Object?> get props =>[historique];
}
class CommandeDisplayed  extends commercantState{
  List <Commande> commande = [] ; 
  CommandeDisplayed(this.commande);
  List<Object?> get props =>[commande];
}
class Commercant extends commercantState{
  List <clientModel> commercant =[] ; 
  Commercant(this.commercant); 
  List<Object?> get props =>[commercant];
}

class CommercantLoginMessage  extends commercantState{
String msg ; 
CommercantLoginMessage(this.msg);
List<Object?> get props =>[msg];
}



