import 'dart:async';
import 'package:complete_flutter_from_scratch/src/repository/loginRespository.dart';
import 'package:complete_flutter_from_scratch/src/routes/navigationRouter.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  void dispose();
}

class LoginBloc implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordContoller = BehaviorSubject<String>();
  final loginRepository = LoginRepository();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordContoller.sink.add;

  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordContoller.stream;

  submitCredentials(BuildContext context) {
    final fetchLoginCredentials = loginRepository.fetchLoginCredentials();
    final emailFromRepository = fetchLoginCredentials['email'];
    final passwordFromRepository = fetchLoginCredentials['password'];

    if (_emailController.value.toString() == emailFromRepository &&
        _passwordContoller.value.toString() == passwordFromRepository) {
      print('all set');
      NavigationRouter.switchToHomePage(context);
    } else {
      print('an error');
    }
  }

  dispose() {
    _emailController?.close();
    _passwordContoller?.close();
  }
}
