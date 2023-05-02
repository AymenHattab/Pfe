import 'package:app/component/search.dart';
import 'package:app/main.dart';
import 'package:app/ui/Facture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
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
MapBloc bloc = MapBloc(OnmapcreatedState({},false));
  void initState(){
     
    bloc = BlocProvider.of<MapBloc>(context);
    
    addcustomIcon();
    super.initState();
  }
    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
_livelocation();
      Set<Marker> _markers={Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(
          title:"current place",
        ),
        markerId:  MarkerId("commercant place"),
        position: LatLng(_center.latitude,_center.latitude),
      )};
    
  }

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
    Future openDialog(lat,long) => showDialog(
          context: context,
          builder: (BuildContext context) {
          insetPadding: EdgeInsets.all(20);
           return facture(lat: lat,long: long,);
          }
        );
    return BlocListener<MapBloc,MapState>(
listener:(context, state) {
  if (state is OnmapcreatedState ){
    if (state.displayed==true){
      setState(() {
        _markers = state.marker ; 
    displayMap = false ; 
      });
    
    }else{
       setState(() {
        _markers = {} ; 
    displayMap = true ; 
      }); 
    }
  }
}, 
      child: Stack(
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
          //     FloatingActionButton(onPressed: (){
          //   bloc.add(OnmapcreatedEvent(context,displayMap));
          // }),
              // FloatingActionButton(onPressed: ()=>{_getLocation()} ,child: Icon(Icons.place_rounded , ), backgroundColor: Color.fromRGBO(0, 85, 255, 1), focusColor: Colors.red, ),
            ],
          ),
        
      ]),
    );
  }
}
