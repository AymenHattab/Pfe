import 'package:app/component/search.dart';
import 'package:app/main.dart';
import 'package:app/ui/Facture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
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
class _mapState extends State<map> {



late GoogleMapController mapController;
  String lat =""; 
  String long ="" ; 
  late LatLng markerPosition;
clientbloc bloc = clientbloc(clientbuttonNotifcationsPressed());
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
    bloc = BlocProvider.of<clientbloc>(context);
    addcustomIcon();
    super.initState();
  }
    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
//     print("0");
// bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// print(serviceEnabled);
// if(!serviceEnabled){ 
//   print("1"); 
//   return Future.error("Location enabled"); }
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
      print(position);

    setState(() {
      _center = LatLng(position.latitude,position.longitude) ; 
      print(_center);
    });
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
    final Set<Marker> _markers=api.markers(context) as Set<Marker>;
    Future openDialog(lat,long) => showDialog(
          context: context,
          builder: (BuildContext context) {
        insetPadding: EdgeInsets.all(20);
           return facture(lat: lat,long: long,);
    
          }
        );
    return Stack(
      clipBehavior:Clip.antiAliasWithSaveLayer,
      children:[ 
        
        GoogleMap(
        onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center,
              zoom:13,
            ),
            onTap: (LatLng location){
              print(" location == $location");
                  openDialog(location.latitude,location.longitude);
              setState(() {
                print(location);
              _markers.add(Marker(markerId: MarkerId(location.toString()), position : location ),
             
              ); 
              });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                searchbar(
                  background: Color.fromRGBO(0, 95, 236, 1),
                    colors: Colors.white,
                  hint: "recherche une location",
                  icon: Icons.map,
                ),
                 IconButton(onPressed: ()=>{_getLocation()}, icon: Icon(Icons.location_on),iconSize: 40,color: Colors.red,)
              ],
            ),
          ],
        ),
      
    ]);
  }
}
