import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BasketBloc/BasketBloc.dart';
import '../bloc/BasketBloc/BasketEvent.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/MapBloc/mapBloc.dart';
import '../model/CommandeModel.dart';
import '../model/modelTest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:convert';

import '../ui/RealFacture.dart';
import '../ui/signup.dart';

class CommercantApi {
//getcommercant
  Future<List<clientModel>> Getcommercant() async {
    List<clientModel> posts = [];
    var url = "http://192.168.1.17:8000/api/commercant/1";
    var uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      print(res.statusCode);
      var data = json.decode(res.body);
      var list = clientModel.fromJson(data);

      posts.add(list);
      return posts;
    }
    return posts;
  }

//getHistorique
  Future<List<Historique>> GetHistorique() async {
    List<Historique> posts = [];
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
      list.historique?.forEach((element) {
        posts.add(element);
      });
      return posts;
    }
    return posts;
  }

  Future<List<CommandeModel>> getcommande() async {
    List<CommandeModel> posts = [];
    var url = "http://192.168.1.17:8000/api/client/commande/1";
    var uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      print(res.statusCode);
      var data = json.decode(res.body);
      var list = CommandeModel.fromJson(data);
      print("List =  $list");
     posts.add(list);
      return posts;
    }
    return posts;
  }

//  Future<Set<Marker>>
  Set<Marker> _markers = {};
       
  markers(BuildContext context) {
    
    print("inside markers methode ");

    getcommande().then((value) {
      for (int i = 0; i < value.length; i++) {
        var p = value[i];
        for (int j = 0; j < p.commande!.length ; j++) {
            var e = p.commande![i]; 
        _markers.add(Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(
            title: e.client!.nom.toString(),
          ),
          markerId: MarkerId(e.id.toString()),
          position: LatLng(e.lat!, e.long!),
          onTap: () {
           
          },
        ));
      }}
    });
    return _markers;
  }

//login
  Future<String> LoginCommercant(String email, String mdp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(email);
    print(mdp);
    var url = "http://192.168.1.17:8000/api/comercant/login";
    var uri = Uri.parse(url);
    var res = await http.post(uri, body: {"email": email, "mdp": mdp});
    if (res.statusCode == 200) {
      //  int Id= int.parse(res.body);
      // await prefs.setInt('Idcommercant', Id);
      return ("1");
    } else {
      return ("0");
    }
  }
}
