import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocbuilderManagment.dart/commercantManagement.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({super.key});

  @override
  State<mydrawer> createState() => _mydrawerState();
}


commercantManagement cm =commercantManagement();
class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: cm.Image),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings_applications_rounded) , 
                Text("modifier profile"),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.info) , 
                Text("Guide"),
              ],
            ),
            onTap: () async {
             
            
            },),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout_outlined) , 
                Text("Logout"),
              ],
            ),
            onTap: ()async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.remove('Idcommercant');
              Navigator.pushNamed(context, "/signupAndLogin");
            },)
      
        ],
      ),
    );
  }
}
