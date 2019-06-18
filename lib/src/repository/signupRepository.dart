import 'package:complete_flutter_from_scratch/src/provider/signupProvider.dart';

class SignupRepository {
  getSignupCredentials(String email, String password) {
    final signupProvider = SignupProvider(email, password);
    signupProvider.printValuesSignup();
  }
}
