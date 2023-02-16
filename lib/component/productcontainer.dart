import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class containerproduct extends StatelessWidget {
  String Titre;
  containerproduct({Key? key, required this.Titre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
            height: 120,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [1, 0.6],
                colors: [Titre.toColor(), Titre.toColor()],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Titre,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                            fontSize: 12),
                      ),
                      Text(
                        "aaaaAAAA",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontSize: 5,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        height: 23,
                        width: 29,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(11.5),
                            ),
                            color: Titre.toColor()),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Positioned(
          left: -15,
          top: -10,
          child: Container(
            height: 150,
            child: Image(
              image: AssetImage(
                'images/pr1.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
