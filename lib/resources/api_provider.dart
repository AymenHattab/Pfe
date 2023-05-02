import 'dart:convert';
import 'dart:io';

import 'package:app/component/notification.dart';
import 'package:app/model/Produit.dart';
import 'package:dio/dio.dart';

import 'package:app/model/modelTest.dart';

import '../model/singelclient.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://reqres.in/api/users/2';

  Future<clientModel> notification() async {
    try {
      Response response = await _dio.get("http://<192.168.1.17>:8000/api/commercant/client");
      print(response);
      return clientModel .fromJson(response.data);
    } catch (error, stacktrace) {
      Response response = await _dio.get("http://localhost:8000/api/commercant/client");
      print(response);
      return clientModel.fromJson(response.data);
    }
  }

  getuser() async {
  Map Jsondata = {
            "nom": "aaaa",
            "prenom": "hattab",
            "phone": "456987",
            "idCom": '2'
};
var body = json.encode(Jsondata);

    Response response = await _dio.post("http://192.168.1.17:8000/api/client" , data:body
     );
    // var test = sclient.fromJson(response.data);
    // if (test.data!.firstName == email && test.data!.lastName == pdw) {
    //   print('a7la nes');
    //   return 'gg';
    // }
  }

  // Future<Produit?> getproducts() async {
  //   Response response = await _dio.get("https://reqres.in/api/unknown",
  //       options: Options(method: "get", headers: {
  //         'Access-Control-Allow-Origin': "*",
  //         'Access-Control-Allow-Credentials': '',
  //         "content-type": "application/json",
  //       }, extra: {
  //         'withCredentials': true,
  //       }));

  //   try {
  //     if (response.statusCode == 200) {
  //       print(response.statusCode);
  //       var test = Produit.fromJson(response.data);
  //       return test;
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load dashboard');
  //   }
  //   return null;
  // }

}
