import 'package:app/bloc/clientbloc/events.dart';
import 'package:app/bloc/clientbloc/states.dart';

import 'package:app/model/modelTest.dart';
import 'package:app/resources/api_provider.dart';
import 'package:app/ui/apitest.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/ClientApi.dart';

class clientselect extends Bloc<clientEvents, clientState> {
  clientselect(clientEvents events): super(clientselectedState("0",'https://lh3.googleusercontent.com/pw/AMWts8AcJndwzMkC21IbmGVomeODW7BhTswInJX85l6tbeuApG0XnvS45w44Iunqa2CntY6lgAC_cV_AQ4JPoIgwSUlRn7vker8G218EfIrJY1Wp8q-KItjkTJthks6L5x1KiKDqEJkfsDQkzYsl1J4P-Qpnf568Z01_JUe4_jAIsZxpNslTLzxZ7pGNGQ4_-nIqKCu0chv_sSF4q-CTz6b1l0sm_2EoiM0DdePKVsYu0wVIjBsqTGpWl7tSJHJpDKNp1lrpJ07GwcNaDsT4xpLnlakgQtY7a8He32GSJHMME3kYdwjhTVroVqB6k_RUtpxvWzw4o0G-4rsx_RoGbxWVlJi5PHaKOzugAX9nIKJJWh62FR5aMznYHso-09g1smqKxbq5eL22hlOZnFgJD2LLzUAE9VCb04r8ufdv1pChqF8OuBxs825sstijSX6bVkV8ExhQ8gNZYewHdYrnwkjnLOSPOHxFkXJB8chYYdMT1dQpWLcCrhcTd1aDMkMIPNm6bxc5zAVqzm0UEaWFqtvXCAY4NTE-QNX3OFTTlb_MQSISoBmgqCQe06tH0YpEvErlHmqvZ46AIyNNyPgW7gJxiK-VPngegf4yL-B3vMOf2BIrxIiPuAunTZ7FCvKZgaqf82Hgg5MB0PkqR-s6Dbw_XeGx5KnGiAMv4oHO6Tg15-UHcmW6EohaJM19EXapAZc4JqGBCumeCHTteq5JpYbXQmbyMhDGMge5ThVeNBORwMW9OyxqBtRi-63dFexEk5NxZf9ioI419WWEUfMgOiJVy08FBKBOey4UILGESwWa2ijnVpCThKX-99Vqk60mx-IeCh7slwHsZyfsuGod65qmmKU6DBScBq3ZwQu8MIq4z51B8SHWtGSIEOuwgeP33Nfib_wQJewtECPdycgbbv9eTw=w296-h625-s-no?authuser=0','select un client',"")){
    on<clientselectedEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('idClient', event.id);
      emit(clientselectedState(event.id,event.Image,event.firstName,event.LastName));
    });

  }
}
class clientbloc extends Bloc<clientEvents, clientState> {
  clientbloc(clientEvents events) : super(clientloading()) {
    final ApiProvider _p = ApiProvider();
    final ApiClient client = ApiClient();
    on<clientbuttonPressed>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      try {
        final list = await _p.getuser();
        print('list is ' + list);
        if (list == 'gg') {
          prefs.setString("montant", "125DT");
          emit(clientloading());
          print("aaa");
        }
      } on clientloadedevent {
        emit(clienterror());
      }
    });
    on<clientbuttonNotifcationsPressed>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      final test = await client.GetClient();
      print(test);
      emit(clientNotifcationloaded(test));
    });
    on<AddClient>((event, emit) async {
       await client.AddClient(event.nom, event.Prenom, event.num, 1); 
      // await _p.getuser();
      emit(clienterror()) ; 
     
    });


  }
}
