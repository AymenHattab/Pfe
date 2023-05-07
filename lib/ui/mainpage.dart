import 'package:app/component/map.dart';
import 'package:app/component/navbar.dart';
import 'package:app/component/particles/circle.dart';
import 'package:app/drawer.dart';
import 'package:app/ui/RealFacture.dart';
import 'package:app/ui/clientMangement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../bloc/CommercantBloc/commercantEvents.dart';
import '../bloc/CommercantBloc/commercantState.dart';
import '../bloc/CommercantBloc/commercantbloc.dart';
import '../component/calendar.dart';
import '../component/datamainc.dart';
import '../model/modelTest.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

List<clientModel> test = [];
var displayMapbutton = true;
bool menudrag = false;

class _mainpageState extends State<mainpage> {
  @override
  Set<Marker> _markers = {};
  CommercantProfileBloc displayHistoric = CommercantProfileBloc(secondState());
  void initState() {
    displayHistoric = BlocProvider.of<CommercantProfileBloc>(context);
    displayHistoric.add(CommercantLogged(context));
    super.initState();
  }

  void dispose() {
    MapController.dispose();
    //...
    super.dispose();
    //...
  }
final PageController pageController =
                    PageController(initialPage: 1);
  montant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var test = await prefs.getString('montant') ?? "0DT";
    return test;
  }

  // @override
  // void initState() {
  //   super.initState();

  //   montant().then(
  //     (value) => setState(() {
  //       textFromServer = value;
  //     }),
  //   );
  // }

  String? textFromServer;
  @override
  int _currentIndex = 0;
  late GoogleMapController MapController;

  onMapCreated(GoogleMapController controller) {
    MapController = controller;
    _markers = _markers = api.markers(context);
  }

  Future<Position> _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    print("permission");
    print(permission);
    if (permission == LocationPermission.whileInUse) {
      print("2");
      _livelocation();
    }
    if (permission == LocationPermission.denied) {
      print("3");
    }
    if (permission == LocationPermission.deniedForever) {
      print("4");
      return Future.error("lcoation permission are denied ");
    }
    return Future.error("error");
  }

  void _livelocation() {
    LocationSettings locationsettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationsettings)
        .listen((Position position) {
      // _center = LatLng(position.latitude,position.longitude) ;
      MapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14,
          tilt: 20)));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Flexible(
              child: map(
            callback: onMapCreated,
          )),
          GestureDetector(
            onTap: () {
              if (menudrag == false) {
                setState(() {
                  menudrag = true;
                });
              } else {
                setState(() {
                  menudrag = false;
                });
              }
            },
            child: AnimatedContainer(
              clipBehavior: Clip.none,
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
              // ignore: sort_child_properties_last
              child: Column(
                children: [
                  BlocBuilder<CommercantProfileBloc, commercantState>(
                    builder: (context, state) {
                      print("state $state");
                      if (state is Commercant) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data(
                                montant: state.commercant[0].montantActuelle
                                    .toString()),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: menudrag ? 250 : 0,
                              curve: Curves.decelerate,
                              child: Expanded(
                                child: Container(
                                  height: 230,
                                  child: PageView(
                                      controller: pageController,
                                      children: [
                                        Calendar(controller:pageController ),
                                        ListView.builder(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            itemCount: state
                                                .commande[0].commande!.length,
                                            itemBuilder: (context, index) {
                                              var name = state.commande[0]
                                                  .commande![index].client!.nom
                                                  .toString();
                                              var id = state.commande[0]
                                                  .commande![index].id;
                                              var lastname = state
                                                  .commande[0]
                                                  .commande![index]
                                                  .client!
                                                  .prenom
                                                  .toString();
                                              var date = state
                                                  .commande[0]
                                                  .commande![index]
                                                  .facture
                                                  ?.date
                                                  .toString();
                                              var montant = state
                                                  .commande[0]
                                                  .commande![index]
                                                  .facture
                                                  ?.montant
                                                  .toString();
                                              if (date == null) {
                                                date = "";
                                              }
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                    builder: (context) {
                                                      return RealFacture(
                                                        id: id!,
                                                      );
                                                    },
                                                  ));
                                                },
                                                onDoubleTap: () {
                                                  setState(() {
                                                    menudrag = false;
                                                  });
                                                  final MarkerId
                                                      targetMarkerId =
                                                      MarkerId(id.toString());
                                                  final Marker targetMarker =
                                                      _markers.firstWhere(
                                                          (marker) =>
                                                              marker.markerId ==
                                                              targetMarkerId);
                                                  print("target is not null ");
                                                  if (targetMarker != null) {
                                                    MapController.animateCamera(
                                                        CameraUpdate.newCameraPosition(
                                                            CameraPosition(
                                                                target:
                                                                    targetMarker
                                                                        .position,
                                                                zoom: 15,
                                                                tilt: 50.0,
                                                                bearing:
                                                                    45.0)));
                                                  }
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 100,
                                                  color: Colors.white10,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "$name  $lastname",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "lexend"),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            date,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    "lexend"),
                                                          ),
                                                          Text(
                                                            montant.toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    "lexend"),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      return Container(child: const Text("test"));
                    },
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                pageController.previousPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.linear);
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {
                                displayHistoric.add(CommercantLogged(context));
                                pageController.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.linear);
                              },
                              icon: Icon(
                                Icons.align_horizontal_left_rounded,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {
                                _getLocation();
                              },
                              icon: const Icon(
                                Icons.location_history_sharp,
                                color: Colors.white,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              height: menudrag ? 400 : 150,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromRGBO(8, 115, 209, 1),
                    Color.fromRGBO(0, 95, 236, 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
