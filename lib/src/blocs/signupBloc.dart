import 'dart:async';
import 'package:complete_flutter_from_scratch/src/repository/signupRepository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseSignupBloc {
  void dispose();
}

class SignupBloc implements BaseSignupBloc {
  final _emailSignup = BehaviorSubject<String>();
  final _passwordSignup = BehaviorSubject<String>();

  Function(String) get emailChange => _emailSignup.sink.add;
  Function(String) get passwordChange => _passwordSignup.sink.add;

  Stream<String> get email => _emailSignup.stream;
  Stream<String> get password => _passwordSignup.stream;

  submitCredentialsSignup() {
    final signupReposity = SignupRepository();
    signupReposity.getSignupCredentials(
        _emailSignup.value, _passwordSignup.value);
  }

  dispose() {
    _emailSignup?.close();
    _passwordSignup?.close();
  }
}
