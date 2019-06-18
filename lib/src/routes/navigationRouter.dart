import 'package:complete_flutter_from_scratch/src/ui/home.dart';
import 'package:flutter/material.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/Login');
  }

  static void switchToSignup(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/Signup');
  }

  static void switchToHomePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
