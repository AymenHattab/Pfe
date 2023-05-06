import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../model/CommandeModel.dart';
import '../../model/modelTest.dart';
import '../../resources/Apicommercant.dart';
import 'commercantEvents.dart';
import 'commercantState.dart';
    CommercantApi Api =CommercantApi(); 
     List <CommandeModel> searchbydate = [] ; 
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
      commande[0].commande!.sort((a, b) {
        return a.dateCmd!.compareTo(b.dateCmd!);
      },);
       final commandelist = commande.reversed.toList();
       emit(Commercant(list,commandelist));
    },);
    on<searchBydate>((event, emit) async {
      final   list = await Api.Getcommercant();
      final  commande = await Api.getcommande();
      // commande[0].commande!.sort((a, b) {
      //   return a.dateCmd!.compareTo(b.dateCmd!);
      // },);
      //  final commandelist = commande.reversed.toList();
        DateTime dateTime = DateTime.parse(event.date);
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

// commande[0].commande?.map((e) => {print(e.dateCmd) } );

commande[0].commande?.removeWhere((element) {
    DateTime elementdate = DateTime.parse(element.dateCmd!);
      String elementDate = DateFormat('yyyy-MM-dd').format(elementdate);
  print(elementDate);
  print(formattedDate);
   return elementDate!=formattedDate ; 
},);
//  searchbydate= commande.where((item) => item.commande!.map((e) => e.comId) == formattedDate
 
 
//  ).toList();


       emit(Commercant(list,commande));
    },);


 
  }
}