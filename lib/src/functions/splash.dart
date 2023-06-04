import 'package:business_card/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var email;

  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

      if (email == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (email.toString() != null) {
        Navigator.pushNamed(context, RouteNames.dashboard);
      }
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var e = sharedPreferences.getString('email');
    email = email;
  }

  Future<String> getEmail() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var e = sharedPreferences.getString('email');
    return e.toString();
  }

  Future<String> getId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var i = sharedPreferences.getString('id');
    return i.toString();
  }
}
