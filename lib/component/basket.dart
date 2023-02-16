import 'package:flutter/material.dart';

class basket extends StatefulWidget {
  const basket({super.key});

  @override
  State<basket> createState() => _basketState();
}

class _basketState extends State<basket> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => null,
        icon: Icon(
          Icons.shopping_basket,
          size: 20,
          color: Colors.blue,
        ));
  }
}
