import 'package:equatable/equatable.dart';

class ProduitEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Produitloadingevent extends ProduitEvents {}

class Produitloadedevent extends ProduitEvents {}

class Produiterrorevent extends ProduitEvents {}
