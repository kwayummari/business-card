import 'package:business_card/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var email;
  var id;
  var role;
  var intro;

  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

      if (email == null && role == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (email.toString() != null && role.toString() == '0') {
        Navigator.pushNamed(context, RouteNames.bottomNavigationBar);
      } else {
        Navigator.pushNamed(context, RouteNames.login);
      }
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var e = sharedPreferences.getString('email');
    var i = sharedPreferences.getString('id');
    var r = sharedPreferences.getString('role');
    var intr = sharedPreferences.getString('intro');
    email = email;
    id = i;
    role = r;
    intro = intr;
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

  Future<String> getRole() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var r = sharedPreferences.getString('role');
    return r.toString();
  }

  Future<String> getIntro() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var intr = sharedPreferences.getString('intro');
    return intr.toString();
  }
}
