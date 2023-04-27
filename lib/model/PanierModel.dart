import 'package:flutter/cupertino.dart';

class panier {
  final int id;
  final int prix;
  final String image;
  final String nom;
  final int qte;
  final String type;
  panier(this.image, this.nom, this.qte, this.type, this.id, this.prix);
}
