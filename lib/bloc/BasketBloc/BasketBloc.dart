import 'package:app/model/PanierModel.dart';
import 'package:bloc/bloc.dart';

import '../../resources/produitApi.dart';
import 'BasketEvent.dart';
import 'BasketState.dart';


List <panier> list =[]; 
produitApi api = produitApi() ; 
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketcontentNumber(0)) {
  on<NumberOfBasket>(((event, emit) async {
      try {
        emit(BasketcontentNumber(list.length));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    
  }
}

class BaskecontenttBloc extends Bloc<BasketEvent, BasketState> {
  BaskecontenttBloc() : super(BasketcontentNumber(0)) {
       on<DeleteBasket>(((event, emit) async {
      try {
        list.clear(); 
        emit(BasketcontentList(list));
        emit(BasketcontentNumber(list.length));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
       on<Passcommand>(((event, emit) async {
      try {
        print("passcommande bloc is done ");
        api.Createcommande(list, event.lat, event.long, event.clientId);
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    on<AddListToBasket>(((event, emit) async {
      try {
        list.add(event.Panier);
        emit(BasketcontentList(list));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
 
  }
}
