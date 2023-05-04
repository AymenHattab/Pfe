import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FactureEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
 
  class Dragdown extends FactureEvent{}
  class Dragup extends FactureEvent{}

  class Facturedraggable extends Bloc<FactureEvent, bool> {
  Facturedraggable() : super(false) {

    on<Dragup>((event, emit) {
      emit(true); 
    },); 

    on<Dragdown>((event, emit) {
      emit(false); 
    },); 
   

  }
}