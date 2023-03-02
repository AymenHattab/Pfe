import 'package:app/bloc/verification/verficationState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocverification.dart';

class Message {
  final nom = BlocBuilder<verificationbloc, verificationState>(
      builder: (context, state) {
    if (state is EmailState)
      return state.nom;
    else
      return Text("");
  });
  final email = BlocBuilder<verificationbloc, verificationState>(
      builder: (context, state) {
    if (state is EmailState)
      return state.email;
    else
      return Text("");
  });
}
