

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
  AddListToBasket(this.Panier);
}

class DeleteBasket extends BasketEvent {}

class Passcommand extends BasketEvent {

  double lat;
  double long;
  int clientId;
  Passcommand( this.lat, this.long, this.clientId);
}

class BasketError extends BasketEvent {}
