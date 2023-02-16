import 'package:flutter/material.dart';

class mydrawer extends StatefulWidget {
  const mydrawer({super.key});

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: CircleAvatar(
            backgroundImage: null,
          )),
          ListTile(
            title: Text("login"),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
          ListTile(
            title: Text("main page "),
            onTap: () {
              Navigator.pushNamed(context, "/mainpage");
            },
          ),
          ListTile(
            title: Text("shopp "),
            onTap: () {
              Navigator.pushNamed(context, "/shop");
            },
          ),
          ListTile(
            title: Text("signup "),
            onTap: () {
              Navigator.pushNamed(context, "/signup");
            },
          ),
          ListTile(
            title: Text("profile "),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            title: Text("apitest"),
            onTap: () {
              Navigator.pushNamed(context, "/apitest");
            },
          ),
          ListTile(
            title: Text("test"),
            onTap: () {
              Navigator.pushNamed(context, "/test");
            },
          )
        ],
      ),
    );
  }
}
