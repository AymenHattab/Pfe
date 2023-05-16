class ProduitModel {
  List<Produit>? produit;

  ProduitModel({this.produit});

  ProduitModel.fromJson(Map<String, dynamic> json) {
    if (json['produit'] != null) {
      produit = <Produit>[];
      json['produit'].forEach((v) {
        produit!.add(new Produit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.produit != null) {
      data['produit'] = this.produit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produit {
  int? id;
  String? nom;
  String? description;
  double? prix;
  String? color;
  String? image;
  double? pht;
  double? pat;
  int? remise;
  int? idcategory;

  Produit(
      {this.id,
      this.nom,
      this.description,
      this.prix,
      this.color,
      this.image,
      this.pht,
      this.pat,
      this.remise,
      this.idcategory});

  Produit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    prix = json['prix'];
    color = json['color'];
    image = json['image'];
    pht = json['pht'];
    pat = json['pat'];
    
    idcategory = json['idcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['prix'] = this.prix;
    data['color'] = this.color;
    data['image'] = this.image;
    data['pht'] = this.pht;
    data['pat'] = this.pat;
    data['remise'] = this.remise;
    data['idcategory'] = this.idcategory;
    return data;
  }
}