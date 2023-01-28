import 'package:on_the_kushk/core/enum.dart';

import '../../../data/Models/login_model/login_modle.dart';

class LoginState {
  ScreenStates states = ScreenStates.init;
  String? email;
  String? password;
  String? mailerrormessage;
  String? passworderrormessage;
  LoginModel? loginModle;
}
