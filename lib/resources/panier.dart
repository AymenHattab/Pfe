import '../model/category.dart';
import '../model/modelTest.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class PanierMethode {

Future<List<categorymodel>> Categorys() async{
    List<categorymodel> posts = [];
   var url = "http://192.168.1.17:8000/api/category";
  var uri = Uri.parse(url);
  var res = await http.get(uri);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var list = categorymodel.fromJson(data);
      posts.add(list);
      return posts;
    }
    return posts;
  }

}