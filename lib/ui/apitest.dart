import 'package:app/model/clientModel.dart';
import 'package:app/ui/clientMangement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:http/http.dart' as http;
import '../component/historique.dart';
import '../model/Produit.dart';
import 'dart:convert';

import '../model/modelTest.dart';
import '../resources/Apicommercant.dart';


class PullToViewPage extends StatefulWidget {
  const PullToViewPage({Key? key}) : super(key: key);

  @override
  _PullToViewPageState createState() => _PullToViewPageState();
}

class _PullToViewPageState extends State<PullToViewPage> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            child:Column(
              children: [
                 historique(),
                IconButton(onPressed: () {
                 GetClient();
                },
                icon: Icon(Icons.abc_sharp),
                ),
              ],
            ) ),
        ),
      ),
    );
    
}

 GetClient() async{
  CommercantApi api=CommercantApi() ;
    // api.getcommande().then((value) => print(value.map((e) => e.lat)));

  }
  
}