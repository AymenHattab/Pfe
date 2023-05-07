import 'package:equatable/equatable.dart';

import '../../model/FactureModel.dart';
import '../../model/PanierModel.dart';

class BasketState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FactureLoadedState extends BasketState {
  List<FactureModel> Facture ; 
  FactureLoadedState(this.Facture);
  List<Object?> get props => [Facture];
}

class BasketcontentNumber extends BasketState {
  int Number ; 
  BasketcontentNumber(this.Number);
  List<Object?> get props => [Number];
}
class BasketcontentList extends BasketState {
  List<panier> ListPanier ;
  int somme ; 
  BasketcontentList (this.ListPanier,this.somme);
  List<Object?> get props => [ListPanier,somme];
}
class BasketMessage extends BasketState {
  String msg ;
  BasketMessage (this.msg);
  List<Object?> get props => [msg];
}

class BasketErromsg extends BasketState {
  String msg;
  BasketErromsg(this.msg);
}
