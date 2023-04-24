class clientModel {
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
  List<Historique>? historique;
  List<Client>? client;
  List<Commande>? commande;
  List<Score>? score;

  clientModel(
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
      this.historique,
      this.client,
      this.commande,
      this.score});

  clientModel.fromJson(Map<String, dynamic> json) {
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
    if (json['historique'] != null) {
      historique = <Historique>[];
      json['historique'].forEach((v) {
        historique!.add(new Historique.fromJson(v));
      });
    }
    if (json['client'] != null) {
      client = <Client>[];
      json['client'].forEach((v) {
        client!.add(new Client.fromJson(v));
      });
    }
    if (json['commande'] != null) {
      commande = <Commande>[];
      json['commande'].forEach((v) {
        commande!.add(new Commande.fromJson(v));
      });
    }
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(new Score.fromJson(v));
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
    if (this.historique != null) {
      data['historique'] = this.historique!.map((v) => v.toJson()).toList();
    }
    if (this.client != null) {
      data['client'] = this.client!.map((v) => v.toJson()).toList();
    }
    if (this.commande != null) {
      data['commande'] = this.commande!.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Historique {
  int? id;
  String? date;
  int? montant;
  int? comId;

  Historique({this.id, this.date, this.montant, this.comId});

  Historique.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['Date'];
    montant = json['montant'];
    comId = json['ComId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Date'] = this.date;
    data['montant'] = this.montant;
    data['ComId'] = this.comId;
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
      this.idliv});

  Commande.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCmd = json['Date_cmd'];
    etat = json['etat'];
    lat = json['lat'].toDouble();
    long = json['long'].toDouble();
    ispayed = json['ispayed'];
    comId = json['ComId'];
    idCard = json['idCard'];
    cliId = json['CliId'];
    idliv = json['idliv'];
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
    return data;
  }
}

class Score {
  int? idobj;
  int? comId;
  int? score;
  bool? isAchived;

  Score({this.idobj, this.comId, this.score, this.isAchived});

  Score.fromJson(Map<String, dynamic> json) {
    idobj = json['Idobj'];
    comId = json['ComId'];
    score = json['Score'];
    isAchived = json['isAchived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Idobj'] = this.idobj;
    data['ComId'] = this.comId;
    data['Score'] = this.score;
    data['isAchived'] = this.isAchived;
    return data;
  }
}