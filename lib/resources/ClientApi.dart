import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/modelTest.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class 
ApiClient { 
    getid()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? myValue = prefs.getInt('Idcommercant');
    print("my value ==== $myValue");
    return myValue;

  }
 Future<List<Client>> GetClient() async{
  int id=await getid();
    List<Client> posts = [];
   var url = "http://192.168.1.17:8000/api/commercant/$id";
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
int id=await getid();
  var uri = "http://192.168.1.17:8000/api/client";
 final  response = await http.post(Uri.parse(uri),
      body: 
      {      "id" :Random.toString(),
            "nom": Nom,
            "prenom":Prenom,
            "phone": Number,
            "idCom": id.toString()
      }
      );
print(response.statusCode); 
}

}