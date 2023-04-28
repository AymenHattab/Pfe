import 'dart:math';

import '../model/modelTest.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class 
ApiClient { 
 Future<List<Client>> GetClient() async{
    List<Client> posts = [];
   var url = "http://192.168.1.17:8000/api/commercant/1";
  // var queryParams = {'id': '1'};
  var uri = Uri.parse(url);
  var res = await http.get(uri);
    if (res.statusCode == 200) {
      print(res.statusCode);
      // data.map((post) => MapEntry(post['id'], Produit.fromJson(post))).toList();
      var data = json.decode(res.body);
      var list = clientModel.fromJson(data);
      print("List =  $list");
      list.client?.forEach((element) {
      posts.add(element);    
      });
      return posts;
    }
    return posts;
  }

    Random random = Random();
  int RandomNumber() {
    return random.nextInt(4000);
  }

 AddClient(String Nom , String Prenom , String Number , int id ) async {
int Random =random.nextInt(4000);
  var uri = "http://192.168.1.17:8000/api/client";
 final  response = await http.post(Uri.parse(uri),
      body: 
      {      "id" :Random.toString(),
            "nom": Nom,
            "prenom":Prenom,
            "phone": Number,
            "idCom": "1"
      }
      );
print(response.statusCode); 
}

}