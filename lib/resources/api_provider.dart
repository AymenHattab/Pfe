import 'package:app/model/Produit.dart';
import 'package:dio/dio.dart';

import 'package:app/model/modelTest.dart';

import '../model/singelclient.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://reqres.in/api/users/2';

  // Future<client> getusers() async {
  //   try {
  //     Response response = await _dio.get(_url);
  //     print(client.fromJson(response.data));
  //     return client.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     Response response = await _dio.get(_url);
  //     return client.fromJson(response.data);
  //   }
  // }

  getuser(String email, String pdw) async {
    print("hello");
    Response response = await _dio.get(_url);
    var test = sclient.fromJson(response.data);
    if (test.data!.firstName == email && test.data!.lastName == pdw) {
      print('a7la nes');
      return 'gg';
    }
  }

  Future<Produit> getproducts() async {
    Response response = await _dio.get("https://reqres.in/api/unknown");
    var test = Produit.fromJson(response.data);
    return test;
  }
}
