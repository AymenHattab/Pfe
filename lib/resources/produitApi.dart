import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import '../model/PanierModel.dart';
import '../model/Produit.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';

class produitApi {
  int RandomNumber() {
    Random random = Random();
    return random.nextInt(4000);
  }

  Createcommande(
    List<panier> panier,
    double lat , 
    double long ,
    int clientId ,  
  ) async {
    var randomnumber = RandomNumber();
    print(randomnumber);
    //create card
    var uri = "http://192.168.1.17:8000/api/commercant/card";
     final  response = await http.post(Uri.parse(uri),
      body: 
      {
         "id" : randomnumber.toString()
      }
      );
    print(response.statusCode);
    //add Product to card
    final uri2 = Uri.parse("http://192.168.1.17:8000/api/commercant/cardItem");
    for(int i = 0 ; i<panier.length ; i++){
      var id=panier[i].id.toString();
      print("id == $id ");
           await http
        .post(uri2, body: {"idproduit":panier[i].id.toString(), "qte_produit":panier[i].qte.toString(), "Prix":panier[i].prix.toString(), "idcard":"978"});

    }
//     //add command 
      final uri3 = Uri.parse("http://192.168.1.17:8000/api/commande");
    var res3 = await http.post(uri3, body: {
      "idCard":randomnumber.toString(),"ComId" : "1","CliId" :"501" ,"lat" :lat.toString() ,"long" :long.toString() ,"id" :randomnumber.toString()
    });

print("res2");
print(res3.statusCode);
  }

  Future<List<categorymodel>> Getcategorys() async {
    List<categorymodel> posts = [];
    var url = "http://192.168.1.17:8000/api/category";
    var uri = Uri.parse(url);
    var res = await http.get(uri);
    print(" category $res");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var list = categorymodel.fromJson(data);
      list.category?.forEach((element) {
        posts.add(list);
      });

      return posts;
    }
    return posts;
  }

  Future<List<ProduitModel>> getprodcuts(int id) async {
    print(" inside method $id");
    List<ProduitModel> posts = [];
    print("hello");
    var queryParams = {"idcategory": id};
    final uri = Uri.parse("http://192.168.1.17:8000/api/produit/$id");
    var res = await http.get(uri);

    print(" test $res");
    if (res.statusCode == 200) {
      // data.map((post) => MapEntry(post['id'], Produit.fromJson(post))).toList();
      var data = json.decode(res.body);
      var list = ProduitModel.fromJson(data);
      list.produit?.forEach((element) {
        posts.add(list);
      });
      return posts;
    }
    return posts;
  }
}
