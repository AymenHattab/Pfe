import 'package:flutter/material.dart';

class circle extends StatelessWidget {
  const circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141,
      width: 141,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(217, 217, 217, 0.19),
      ),
    );
  }
}
