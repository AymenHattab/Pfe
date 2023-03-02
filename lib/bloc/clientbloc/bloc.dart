import 'package:app/bloc/clientbloc/events.dart';
import 'package:app/bloc/clientbloc/states.dart';

import 'package:app/model/modelTest.dart';
import 'package:app/resources/api_provider.dart';
import 'package:app/ui/apitest.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class clientbloc extends Bloc<clientEvents, clientState> {
  clientbloc(clientEvents events) : super(clientloading()) {
    final ApiProvider _p = ApiProvider();
    // @override
    // Stream<clientState> mapEventToState(clientEvents event) async* {
    //   if (event is clientbuttonPressed) {
    //     final list = await _p.getuser(event.email, event.psw);
    //     print('list is ' + list);
    //     if (list == 'gg') {
    //       print("aaaaaaa");
    //       yield clientloading();
    //     }
    //   }
    // }
    // on<clientloadingevent>((event, emit) async {
    //   try {
    //     emit(clientloading());
    //     final list = await _p.getuser();
    //     emit(clientloaded(list));
    //   } on clientloadedevent {
    //     emit(clienterror("hello"));
    //   }
    // });
    on<clientbuttonPressed>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      try {
        final list = await _p.getuser(event.email, event.psw);
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
      final test = await _p.notification();
      print(test);
      emit(clientNotifcationloaded(test));
    });
  }
}
