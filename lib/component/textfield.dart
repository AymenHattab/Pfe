import 'package:app/bloc/verification/blocverification.dart';
import 'package:app/bloc/verification/verificationEvent.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class textfield extends StatefulWidget {
  final controlle;

  const textfield({
    super.key,
    required this.controlle,
  });

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  verificationbloc bloc = verificationbloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  String? get _errorText {
    final text = widget.controlle.value.text;
    if (text.isEmpty) {
      return null;
    }
    if (text.length < 4) {
      return 'shooot';
    }

    return null;
  }

  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controlle,
      decoration: InputDecoration(
        errorText: _errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 253, 253, 253),
          ),
        ),
      ),
    );
  }
}
