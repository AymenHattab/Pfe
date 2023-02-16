import 'package:equatable/equatable.dart';

import '../../model/Produit.dart';

class ProduitState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProduitLoading extends ProduitState {}

class ProduitLoaded extends ProduitState {
  Produit pr;
  ProduitLoaded(this.pr);
}

class Produiterror extends ProduitState {}
