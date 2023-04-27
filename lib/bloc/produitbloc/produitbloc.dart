import 'package:app/bloc/produitbloc/produitsevents.dart';
import 'package:app/bloc/produitbloc/produitstates.dart';
import 'package:app/resources/api_provider.dart';
import 'package:app/resources/produitApi.dart';
import 'package:bloc/bloc.dart';

import '../../model/Produit.dart';
import '../../model/category.dart';

    final produitApi _p = produitApi();
class Produitbloc extends Bloc<ProduitEvents,ProduitState> {
    Produitbloc(ProduitEvents events) : super(ProduitLoading()) {
    on<Produitloadingevent>(((event, emit) async {
      try {
        final List <categorymodel> categrory  = await _p.Getcategorys();
        final List<ProduitModel> productList = await _p.getprodcuts(event.id);
        print("bloc ");
        print(event.id);
        emit(ProduitLoaded(categrory,productList));
      } catch (e) {
        emit(Produiterror("ss"));
      }
    }
    ));

    // on<Produitloadingevent>(((event, emit) async {
    //   try {
    //     emit(ProduitLoading());
    //     final List<Produit> ListP = await _p.getprodcuts();
    //     emit(ProduitLoaded(ListP));
    //   } catch (e) {
    //     emit(Produiterror("ss"));
    //   }
    // }
    // ));

  }
}
