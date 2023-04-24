import 'dart:convert';

import '../model/Produit.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';

class produitApi {

Future<List<categorymodel>> Getcategorys() async{
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

  Future<List<ProduitModel>> getprodcuts(int id ) async {
    print(" inside method $id");
    List<ProduitModel> posts = [];
print("hello");
     var queryParams = {"idcategory" : id};
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
