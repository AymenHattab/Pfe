import 'package:equatable/equatable.dart';

import '../../model/Produit.dart';

class ProduitState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProduitLoading extends ProduitState {}

class ProduitLoaded extends ProduitState {
  List<Produit> pr;
  ProduitLoaded(this.pr);
}

class Produiterror extends ProduitState {
  String msg;
  Produiterror(this.msg);
}
