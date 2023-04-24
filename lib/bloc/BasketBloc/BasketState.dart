import 'package:equatable/equatable.dart';

import '../../model/PanierModel.dart';

class BasketState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class test extends BasketState {}

class BasketcontentNumber extends BasketState {
  int Number ; 
  BasketcontentNumber(this.Number);
  List<Object?> get props => [Number];
}
class BasketcontentList extends BasketState {
  List<panier> ListPanier ;
  BasketcontentList (this.ListPanier);
  List<Object?> get props => [ListPanier];
}

class BasketErromsg extends BasketState {
  String msg;
  BasketErromsg(this.msg);
}
