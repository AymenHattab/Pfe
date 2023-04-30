import 'package:app/model/PanierModel.dart';
import 'package:bloc/bloc.dart';

import '../../resources/produitApi.dart';
import 'BasketEvent.dart';
import 'BasketState.dart';


List <panier> list =[];
int somme = 0 ;  
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
        somme=0;
        emit(BasketcontentList(list,0));
        emit(BasketcontentNumber(list.length));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
       on<Passcommand>(((event, emit) async {
      try {
        print("passcommande bloc is done ");
        print(event.montant);
        api.Createcommande(event.id,list, event.lat, event.long, event.clientId,event.montant);
        list.clear();
        emit(BasketcontentList(list,0));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    on<AddListToBasket>(((event, emit) async {
      try {
        list.add(event.Panier);
        somme=event.somme+somme; 
        emit(BasketcontentList(list,somme));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
 
  }
}
