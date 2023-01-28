import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_routes.dart';
import '../Models/login_model/login_modle.dart';

class LoginService {
  Future<LoginModel> login(String email, String password) async {
    Response response = await http.post(Uri.parse(App_Routes.baseUrl));

    List<dynamic> data = json.decode(response.body);
    final MyData = data[0];
    LoginModel loginModel = LoginModel.fromjson(MyData);
    log(loginModel.data!.name ?? "notfound");

    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("Acoontlogin", response.body);
    return loginModel;
  }
}
