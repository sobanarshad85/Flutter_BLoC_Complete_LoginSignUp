class SignupProvider {
  String _email;
  String _password;

  SignupProvider(this._email, this._password);

  String get email => _email;
  String get password => _password;

  printValuesSignup() {
    print('$email and $password');
  }
}
