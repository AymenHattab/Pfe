

import 'package:flutter/material.dart';


import '../model/modelTest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:convert';

import '../ui/RealFacture.dart';
class CommercantApi{
//getcommercant
 Future<List<clientModel>> Getcommercant() async{
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
 Future<List<Historique>> GetHistorique() async{
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
 Future<List<Commande>> getcommande() async{
    List<Commande> posts = [];
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
      list.commande?.forEach((element) {
      posts.add(element);    
      });
      return posts;
    }
    return posts;
  }
//  Future<Set<Marker>>
    Set<Marker> _markers={};



 markers(BuildContext context)  {
ImageProvider markerImage = NetworkImage('https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
ImageConfiguration configuration = ImageConfiguration(size: Size(120, 120));
dynamic markerIcon = Image(image: markerImage, fit: BoxFit.cover);

// BitmapDescriptor markerIcons = BitmapDescriptor.defaultMarker;
//  BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size.fromHeight(30)), markerIcon   )
//         .then((icon) {
//         markerIcons=icon;
//     });

  getcommande().then((value) => print(value.map((e) =>
 _markers.add(Marker(onTap: (){
  print(e.id);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RealFacture(id:e.id!)),
      );

 },icon : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),infoWindow: InfoWindow(title: "test"
 ),markerId: const MarkerId("location.toString()"),  position : LatLng(e.lat!,e.long!) ),
      ))));
      return _markers ; 
  }
  
//login
 Future <String>  LoginCommercant(String email , String mdp) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(email);
  print(mdp);
    var url = "http://192.168.1.17:8000/api/comercant/login";
  var uri = Uri.parse(url);
  var res = await http.post(uri,body :{
    "email":email,
    "mdp":mdp
} );
    if (res.statusCode == 200) {
    //  int Id= int.parse(res.body);
    // await prefs.setInt('Idcommercant', Id);
   return ("1");
      }else {
        return ("0"); 
      }

    }

  }
  

  
