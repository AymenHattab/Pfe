import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/modelTest.dart';
import '../../resources/Apicommercant.dart';
import 'commercantEvents.dart';
import 'commercantState.dart';
    CommercantApi Api =CommercantApi(); 
class ProfileData extends Bloc<commercantEvents,commercantState>{
  ProfileData()  :super(FirstState()){
        on<HistoriqueEvent>((event, emit) async {
          print("test");
      final  list = await Api.GetHistorique(); 
      emit(HistoriqueDisplayed(list));
    },);
        on<CommandeEvent>((event, emit) async {
      final  list = await Api.getcommande(); 
      emit(CommandeDisplayed(list));
      
    },);
  }
}
class CommercantProfileBloc extends Bloc<commercantEvents,commercantState>{
  CommercantProfileBloc(super.initialState) : super(){
    on<CommercantLogin>((event, emit) async {
      String  response = await Api.LoginCommercant(event.email,event.mdp); 
      print(response);
      if (response == "1"){
        print("response == 1"); 
      final   list = await Api.Getcommercant();
        emit(CommercantLoginMessage("accepted"));
      }else{emit(CommercantLoginMessage("error"));}
    },);

    on<CommercantLogged>((event, emit) async {
      final   list = await Api.Getcommercant();
      final  commande = await Api.getcommande();
       emit(Commercant(list,commande));
    },);


 
  }
}