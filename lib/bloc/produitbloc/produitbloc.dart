import 'package:app/bloc/produitbloc/produitsevents.dart';
import 'package:app/bloc/produitbloc/produitstates.dart';
import 'package:app/resources/api_provider.dart';
import 'package:bloc/bloc.dart';

class Produitbloc extends Bloc<ProduitEvents, ProduitState> {
  Produitbloc() : super(ProduitLoading()) {
    final ApiProvider _p = ApiProvider();
    on<Produitloadingevent>(((event, emit) async {
      final List = await _p.getproducts();
      emit(ProduitLoaded(List));
    }));
  }
}
