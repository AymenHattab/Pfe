
import 'package:flutter/material.dart';
import '../bloc/clientbloc/events.dart';
import '../ui/Basket.dart';
import 'notification.dart';
class basket extends StatefulWidget {
  const basket({super.key});

  @override
  State<basket> createState() => _basketState();
}

class _basketState extends State<basket> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {Navigator.pushNamed(context, "/basket")},
        icon: Icon(
          Icons.shopping_basket,
          size: 20,
          color: Colors.blue,
        ));
  }

  Future opendialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("basket"),
          content: Basket(state:false ,),
        );
      });
}
