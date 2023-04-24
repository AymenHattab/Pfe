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

 AddClient(String Nom , String Prenom , String Number , int id ) async {

//  Map Jsondata = {
//             "nom": "aaaa",
//             "prenom": "hattab",
//             "phone": "456987",
//             "idCom": '2'
// };
//   var body = json.encode(Jsondata);
//  print(Jsondata); 
  var uri = "http://192.168.1.17:8000/api/client";

 final  response = await http.post(Uri.parse(uri),
      body: 
      {
            "nom": "aaaa",
            "prenom": "hattab",
            "phone": "456987",
            "idCom": 1
      }
      );
print(response.statusCode); 
}

}