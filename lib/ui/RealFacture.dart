import 'package:flutter/cupertino.dart';

class RealFacture extends StatefulWidget {
  int id ;
   RealFacture({required this.id,super.key});

  @override
  State<RealFacture> createState() => _RealFactureState();
}

class _RealFactureState extends State<RealFacture> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.id.toString()),);
  }
}