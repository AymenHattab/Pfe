

import 'package:app/component/historique.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/CommandeModel.dart';
import '../../model/modelTest.dart';
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
  List <CommandeModel> commande = [] ; 
  CommandeDisplayed(this.commande);
  List<Object?> get props =>[commande];
}
class Commercant extends commercantState{
  List <clientModel> commercant =[] ; 
 List <CommandeModel> commande = [] ; 
  Commercant(this.commercant,this.commande); 
  List<Object?> get props =>[commercant,commande];
}

class CommercantLoginMessage  extends commercantState{
String msg ; 
CommercantLoginMessage(this.msg);
List<Object?> get props =>[msg];
}



