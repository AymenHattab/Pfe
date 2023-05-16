class CommandeModel {
  int? id;
  String? nom;
  String? prenom;
  String? email;
  String? phone;
  String? mdp;
  String? adress;
  String? image;
  int? benificier;
  bool? paye;
  int? montantActuelle;
  bool? isActive;
  List<Commande>? commande;

  CommandeModel(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.phone,
      this.mdp,
      this.adress,
      this.image,
      this.benificier,
      this.paye,
      this.montantActuelle,
      this.isActive,
      this.commande});

  CommandeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['Nom'];
    prenom = json['prenom'];
    email = json['email'];
    phone = json['phone'];
    mdp = json['mdp'];
    adress = json['Adress'];
    image = json['image'];
    benificier = json['benificier'];
    paye = json['Paye'];
    montantActuelle = json['montant_actuelle'];
    isActive = json['isActive'];
    if (json['commande'] != null) {
      commande = <Commande>[];
      json['commande'].forEach((v) {
        commande!.add(new Commande.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['mdp'] = this.mdp;
    data['Adress'] = this.adress;
    data['image'] = this.image;
    data['benificier'] = this.benificier;
    data['Paye'] = this.paye;
    data['montant_actuelle'] = this.montantActuelle;
    data['isActive'] = this.isActive;
    if (this.commande != null) {
      data['commande'] = this.commande!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commande {
  int? id;
  String? dateCmd;
  String? etat;
  double? lat;
  double? long;
  bool? ispayed;
  int? comId;
  int? idCard;
  int? cliId;
  int? idliv;
  Client? client;
  Card? card;
  Facture? facture;

  Commande(
      {this.id,
      this.dateCmd,
      this.etat,
      this.lat,
      this.long,
      this.ispayed,
      this.comId,
      this.idCard,
      this.cliId,
      this.idliv,
      this.client,
      this.card,
      this.facture});

  Commande.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCmd = json['Date_cmd'];
    etat = json['etat'];
    lat = json['lat'];
    long = json['long'];
    ispayed = json['ispayed'];
    comId = json['ComId'];
    idCard = json['idCard'];
    cliId = json['CliId'];
    idliv = json['idliv'];
    client =
        json['Client'] != null ? new Client.fromJson(json['Client']) : null;
    card = json['Card'] != null ? new Card.fromJson(json['Card']) : null;
    facture =
        json['facture'] != null ? new Facture.fromJson(json['facture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Date_cmd'] = this.dateCmd;
    data['etat'] = this.etat;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['ispayed'] = this.ispayed;
    data['ComId'] = this.comId;
    data['idCard'] = this.idCard;
    data['CliId'] = this.cliId;
    data['idliv'] = this.idliv;
    if (this.client != null) {
      data['Client'] = this.client!.toJson();
    }
    if (this.card != null) {
      data['Card'] = this.card!.toJson();
    }
    if (this.facture != null) {
      data['facture'] = this.facture!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? nom;
  String? prenom;
  String? phone;
  int? idCom;

  Client({this.id, this.nom, this.prenom, this.phone, this.idCom});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    phone = json['phone'];
    idCom = json['idCom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['phone'] = this.phone;
    data['idCom'] = this.idCom;
    return data;
  }
}

class Card {
  int? id;
  List<CardItem>? cardItem;

  Card({this.id, this.cardItem});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['CardItem'] != null) {
      cardItem = <CardItem>[];
      json['CardItem'].forEach((v) {
        cardItem!.add(new CardItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cardItem != null) {
      data['CardItem'] = this.cardItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardItem {
  int? id;
  int? idProduit;
  int? qteProduit;
  int? prix;
  int? idCard;

  CardItem({this.id, this.idProduit, this.qteProduit, this.prix, this.idCard});

  CardItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduit = json['idProduit'];
    qteProduit = json['qte_produit'];
    prix = json['Prix'];
    idCard = json['idCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProduit'] = this.idProduit;
    data['qte_produit'] = this.qteProduit;
    data['Prix'] = this.prix;
    data['idCard'] = this.idCard;
    return data;
  }
}

class Facture {
  int? id;
  String? date;
  int? montant;
  int? codeCmd;

  Facture({this.id, this.date, this.montant, this.codeCmd});

  Facture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    montant = json['montant'].toInt();
    codeCmd = json['code_cmd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['montant'] = this.montant;
    data['code_cmd'] = this.codeCmd;
    return data;
  }
}