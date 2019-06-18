import 'package:complete_flutter_from_scratch/src/blocs/signupBloc.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final signupBloc = SignupBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: signupBloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: signupBloc.emailChange,
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
                stream: signupBloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: signupBloc.passwordChange,
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
                  signupBloc.submitCredentialsSignup();
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SignUp",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                  stream: signupBloc.email,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder(
                stream: signupBloc.password,
                builder: (context, snapshot) => Text('${snapshot.data}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
