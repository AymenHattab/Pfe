import 'package:app/bloc/verification/verficationState.dart';
import 'package:app/bloc/verification/verificationEvent.dart';
import 'package:bloc/bloc.dart';

import '../../resources/verficationMethod.dart';

class verificationbloc extends Bloc<verificationEvents, verificationState> {
  verificationbloc() : super(test()) {
    final p = verfication();
    on<EmailEvent>(
      (event, emit) async {
        print(p.Emailcheck(event.email));
        emit(EmailState(p.Emailcheck(event.email), p.Namecheck(event.nom)));
      },
    );
  }
}
