import 'dart:convert';

import '../model/Produit.dart';
import 'package:http/http.dart' as http;

class produitApi {
  Future<List<Produit>> getprodcuts() async {
    List<Produit> posts = [];
    var res = await http.get(Uri.parse("https://reqres.in/api/unknown"));
    if (res.statusCode == 200) {
      // data.map((post) => MapEntry(post['id'], Produit.fromJson(post))).toList();
      var data = json.decode(res.body);
      var list = Produit.fromJson(data);
      list.data?.forEach((element) {
        posts.add(list);
      });
      return posts;
    }
    return posts;
  }
}
