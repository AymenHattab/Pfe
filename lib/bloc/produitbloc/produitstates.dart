import 'package:equatable/equatable.dart';

import '../../model/Produit.dart';
import '../../model/category.dart';

class ProduitState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProduitLoading extends ProduitState {}

class ProduitLoaded extends ProduitState {
  List<categorymodel> categrory ; 
  List<ProduitModel> pr;
  ProduitLoaded(this.categrory,this.pr);

  List<Object?> get props => [categrory,pr];
}
class CategoryState extends ProduitState {
   List<categorymodel> categrory ; 
  CategoryState(this.categrory);
}

class Produiterror extends ProduitState {
  String msg;
  Produiterror(this.msg);
}
