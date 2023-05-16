import 'package:app/bloc/verification/verficationState.dart';
import 'package:app/model/PanierModel.dart';
import 'package:bloc/bloc.dart';

import '../../model/FactureModel.dart';
import '../../resources/produitApi.dart';
import 'BasketEvent.dart';
import 'BasketState.dart';

List<panier> list = [];
double somme = 0;
produitApi api = produitApi();

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
    List<FactureModel> Facture = [];
    on<FactureEvent>(((event, emit) async {
      try {
        Facture = await api.getFacture(event.id);
        print(Facture);
        emit(FactureLoadedState(Facture));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    on<DeleteBasket>(((event, emit) async {
      try {
        list.clear();
        somme = 0;
        emit(BasketcontentList(list, 0));
        emit(BasketcontentNumber(list.length));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    on<Passcommand>(((event, emit) async {
      try {
        print("passcommande bloc is done ");
       
        var test =  await api.Createcommande(event.id, list, event.lat, event.long,
            event.clientId, event.montant);
            print("test msg =test");
           if (test!="operation effectue avec succes"){
              emit(BasketMessage("error"));
           }else {
        list.clear();
        somme = 0;
        emit(BasketcontentList(list, 0));
           }
      } catch (error) {
        throw UnimplementedError();
      }
    }));
    on<AddListToBasket>(((event, emit) async {
      try {
        list.add(event.Panier);
        somme = (event.somme*event.Panier.qte) + somme;
        emit(BasketcontentList(list, somme));
      } catch (error) {
        throw UnimplementedError();
      }
    }));
  }
}
