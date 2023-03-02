import 'package:equatable/equatable.dart';

import '../../model/PanierModel.dart';

class BasketEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class NumberOfBasket extends BasketEvent {

}
class AddListToBasket extends BasketEvent {
  panier Panier;
  AddListToBasket(this.Panier);
}
class DeleteBasket extends BasketEvent {

}

class BasketError extends BasketEvent {}
