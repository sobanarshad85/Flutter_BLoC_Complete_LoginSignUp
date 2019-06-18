import 'package:complete_flutter_from_scratch/src/provider/loginProvider.dart';

class LoginRepository {
  final loginProvider = LoginProvider();

  Map fetchLoginCredentials() {
    return loginProvider.loginDetails;
  }
}
