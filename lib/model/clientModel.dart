class client {
  int? id;
  String? nom;
  String? prenom;
  String? phone;
  int? idCom;

  client({this.id, this.nom, this.prenom, this.phone, this.idCom});

  client.fromJson(Map<String, dynamic> json) {
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