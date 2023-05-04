import 'package:app/component/search.dart';
import 'package:app/main.dart';
import 'package:app/ui/Facture.dart';
import 'package:app/ui/RealFacture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../bloc/MapBloc/mapBloc.dart';
import '../bloc/clientbloc/bloc.dart';
import '../bloc/clientbloc/events.dart';
import '../bloc/clientbloc/states.dart';
import '../resources/Apicommercant.dart';
import '../ui/clientMangement.dart';



class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

  late LatLng _center=LatLng(35.8245017, 10.6345833);
  CommercantApi api =  CommercantApi(); 
   Set<Marker> _markers= {}; 
class _mapState extends State<map> {
late GoogleMapController mapController;
  String lat =""; 
  String long ="" ; 
  bool displayMap = true; 
late LatLng markerPosition;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
   
    void _addMarker(LatLng location) {
      print(location);
    // final LatLng latLng = mapController.getLatLng(
    //   // mapController.getScreenCoordinate(offset as LatLng) as ScreenCoordinate,
    // ) as LatLng;
    setState(() {
      markerPosition = location;
    });
  } 

  void initState(){
    super.initState();
  }
    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;    
  }
  void _updateMarkers(){}





  Future<Position> _getLocation() async {

LocationPermission permission = await Geolocator.checkPermission(); 
  permission = await Geolocator.requestPermission();
print("permission");
print(permission);
if (permission==LocationPermission.whileInUse){
  print("2");
_livelocation();
}
if (permission==LocationPermission.denied){
  print("3"); 
}
if (permission == LocationPermission.deniedForever){
  print("4"); 
  return Future.error("lcoation permission are denied "); 
}
return Future.error("error");
}
void _livelocation(){
  LocationSettings locationsettings=const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100, 
  );  
   
  Geolocator.getPositionStream(locationSettings: locationsettings).listen((Position position) {
      // _center = LatLng(position.latitude,position.longitude) ; 
    mapController.animateCamera(CameraUpdate.newCameraPosition( 
        CameraPosition(target: LatLng(position.latitude,position.longitude), zoom: 14)));

  
   }); 
}

  void addcustomIcon(){
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size.fromHeight(30)), "images/client.jpg")
        .then((icon) {
      setState(() {
        markerIcon=icon;
      });
    });
  }
  
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    Future openFacture(id) => showDialog(
          context: context,
          builder: (BuildContext context) {
          insetPadding: EdgeInsets.all(20);
           return RealFacture(id: id);
          }
        );
    Future openDialog(lat,long) => showDialog(
          context: context,
          builder: (BuildContext context) {
          insetPadding: EdgeInsets.all(20);
           return facture(lat: lat,long: long,);
          }
        );
    return BlocListener<CommercantProfileBloc,commercantState>(
listener:(context, state) {
  if (state is Commercant ){
         for (int i = 0; i < state.commande.length; i++) {
        var p = state.commande[i];
        for (int j = 0; j < p.commande!.length ; j++) {
            var e = p.commande![i]; 
        _markers.add(Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(
            title: e.client!.nom.toString(),
          ),
          markerId: MarkerId(e.id.toString()),
          position: LatLng(e.lat!, e.long!),
          onTap: () {
           
          },
        ));
      }}
  };

    

  }, 
      child: Stack(
        clipBehavior:Clip.antiAliasWithSaveLayer,
        children:[ 
          
          GoogleMap(
            onCameraMove : (LatLng){
                  print(LatLng);
            },
            myLocationButtonEnabled : false ,
          zoomControlsEnabled : false ,
          onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _center,
                zoom:13,
              ),
              onTap: (LatLng location){
                print(" location == $location");
                    openDialog(location.latitude,location.longitude);
              },
              
              markers: _markers,
        ),
      //     Container(height: 50,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         stops: [0, 10],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Color.fromARGB(127, 0, 0, 0),
      //       Color.fromARGB(0, 0, 0, 0),
      //     ],
      //   ),
      //    boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       spreadRadius: 6,
      //       blurRadius: 10,
      //       offset: Offset(0, 3),
      //     ),
      //   ],
      // ),
        // ),
        
          Column(
            children: [
              FloatingActionButton(onPressed: (){
                final MarkerId targetMarkerId = MarkerId('2003');
             final Marker targetMarker = _markers.firstWhere((marker) => marker.markerId == targetMarkerId);
    print("target is not null "); 
  if (targetMarker != null) {
    mapController.animateCamera(CameraUpdate.newLatLngZoom(targetMarker.position, 15));
  }
          }),
              FloatingActionButton(onPressed: ()=>{_getLocation()} ,child: Icon(Icons.place_rounded , ), backgroundColor: Color.fromRGBO(0, 85, 255, 1), focusColor: Colors.red, ),
            ],
          ),
        
      ]),
    );
  }
}
