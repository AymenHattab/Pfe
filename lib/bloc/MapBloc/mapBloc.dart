

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resources/Apicommercant.dart';
import '../../ui/RealFacture.dart';

class Mapevents  extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class MapState  extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnmapcreatedEvent extends Mapevents{
  BuildContext context ; 
  int id ; 
OnmapcreatedEvent(this.context,this.id);
List<Object?> get props => [context];
}

class usless extends MapState{

}
class OnmapcreatedState extends MapState{
    bool displayed ; 
    Set<Marker> marker ; 
    OnmapcreatedState(this.marker,this.displayed);
    List<Object?> get props =>[marker,displayed];
}

class MapBloc extends Bloc<Mapevents,MapState>{
  MapBloc(super.initialState) : super(){
    print("inside Mapbloc");
     CommercantApi Api =CommercantApi(); 
     on<OnmapcreatedEvent>((event, emit) async {
       Route route = MaterialPageRoute(builder: (context) =>RealFacture(id: event.id) );
              Navigator.push(event.context, route);  
 
      // final   markers = await Api.markers(event.context);
      //  emit(OnmapcreatedState(markers,event.display));
    },);}}