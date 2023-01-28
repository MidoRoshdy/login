import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:on_the_kushk/data/services/login_service.dart';
import 'package:on_the_kushk/screens/login/provider/loginstate.dart';

class LoginProvider extends ChangeNotifier {
  static LoginState state = LoginState();
  void onemailchanged(String value) {
    if (value.isEmpty) {
      state.mailerrormessage = "please enter email";
    } else if (EmailValidator.validate(value) == false) {
      state.mailerrormessage = "wrong email";
    } else {
      state.mailerrormessage = null;
    }
    //  value.isEmpty ? state.mailerrormessage = "please enter email" :EmailValidator.validate(value) ? state.mailerrormessage = null :
    state.email = value;
    notifyListeners();
  }

  void ompasswordchanged(String value) {
    if (value.isEmpty) {
      state.passworderrormessage = "please enter Pssword";
    } else {
      state.passworderrormessage = null;
    }
    state.password = value;
    notifyListeners();
  }

  login(BuildContext context) async {
    if (state.email != null && state.password != null) {
      state.loginModle =
          await LoginService().login(state.email!, state.password!);
    }
  }
}
