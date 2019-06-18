import 'package:complete_flutter_from_scratch/src/ui/home.dart';
import 'package:complete_flutter_from_scratch/src/ui/login.dart';
import 'package:complete_flutter_from_scratch/src/ui/signup.dart';
import 'package:flutter/material.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => Login(),
    // '/HomePage':(BuildContext context) => HomePage(),
    // "/Dashboard": (BuildContext context) => Dashboard(),
    "/Signup": (BuildContext context) => SignupPage(),
  };

  Routes() {
    runApp(
      new MaterialApp(
        title: 'FlutterCompleteProject',
        routes: routes,
        home: Login(), //Splash(), //Dashboard(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            primaryColorDark: Colors.deepPurple),
      ),
    );
  }
}
