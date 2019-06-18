import 'package:flutter/material.dart';
import 'package:complete_flutter_from_scratch/src/blocs/loginBloc.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("email is 'a' and pass is 'a'"),
              SizedBox(height: 20.0),
              StreamBuilder<String>(
                stream: loginBloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: loginBloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(height: 20.0),
              StreamBuilder<String>(
                stream: loginBloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: loginBloc.passwordChanged,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  loginBloc.submitCredentials(context);
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Login",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                  stream: loginBloc.email,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                stream: loginBloc.password,
                builder: (context, snapshot) => Text('${snapshot.data}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
