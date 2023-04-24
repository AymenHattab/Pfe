import 'package:equatable/equatable.dart';

class ProduitEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Produitloadingevent extends ProduitEvents {
  int id ; 
  Produitloadingevent(this.id);
   List<Object?> get props => [id];
}

class ProduitLoadedEvent extends ProduitEvents{}


// class Produitloadedevent extends ProduitEvents {}

// class Produiterrorevent extends ProduitEvents {}
