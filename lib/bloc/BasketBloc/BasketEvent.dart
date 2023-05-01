

import 'package:app/model/PanierModel.dart';
import 'package:equatable/equatable.dart';

class BasketEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NumberOfBasket extends BasketEvent {}

class AddListToBasket extends BasketEvent {
  panier Panier;
  int somme ; 
  AddListToBasket(this.Panier,this.somme);
  List<Object?> get props => [Panier,somme];
}

class DeleteBasket extends BasketEvent {}
class FactureEvent extends BasketEvent {
  int id ; 
FactureEvent(this.id);
List<Object?> get props => [id];
}
class Passcommand extends BasketEvent {
  String id ; 
  double lat;
  double long;
  int clientId;
  String montant ; 
  Passcommand(this.id,  this.lat, this.long, this.clientId , this.montant);
}

class BasketError extends BasketEvent {}
