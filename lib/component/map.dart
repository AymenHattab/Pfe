import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void initState(){
    addcustomIcon();
    super.initState();
  }
  void addcustomIcon(){
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size.fromHeight(30)), "images/messi.jpg")
        .then((icon) {
      setState(() {
        markerIcon=icon;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10, 0),
            zoom:14,
          ),
          markers: {
            Marker(
          onTap:(){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('My Pop-up Window'),
                  content: Text('This is the content of the pop-up window'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );

          },
                markerId: const MarkerId("marker1"),
                position: const LatLng(10, 0),
                icon:markerIcon


            )
          },
    );
  }
}
