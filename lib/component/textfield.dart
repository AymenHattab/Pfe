import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final controlle;

  const textfield({
    super.key,
    required this.controlle,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    body:
    print(controlle);
    return TextField(
      controller: controlle,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 253, 253, 253),
          ),
        ),
      ),
    );
  }
}
