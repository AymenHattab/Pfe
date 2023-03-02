import 'package:app/bloc/produitbloc/produitsevents.dart';
import 'package:app/bloc/produitbloc/produitstates.dart';
import 'package:app/resources/api_provider.dart';
import 'package:app/resources/produitApi.dart';
import 'package:bloc/bloc.dart';

import '../../model/Produit.dart';

class Produitbloc extends Bloc<ProduitEvents, ProduitState> {
  Produitbloc(ProduitEvents events) : super(ProduitLoading()) {
    final produitApi _p = produitApi();
    on<Produitloadingevent>(((event, emit) async {
      try {
        emit(ProduitLoading());
        final List<Produit> ListP = await _p.getprodcuts();
        emit(ProduitLoaded(ListP));
      } catch (e) {
        emit(Produiterror("ss"));
      }
    }));
  }
}
