import 'package:business_card/src/provider/login-provider.dart';
import 'package:business_card/src/widgets/app_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:business_card/routes/route-names.dart';

import '../api/apis.dart';

class loginService {
  Api api = Api();

  Future<void> login(
      BuildContext context, String email, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    Provider.of<MyProvider>(context, listen: false)
        .updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'email': email.toString(),
      'password': password.toString(),
    };
    final response = await api.post(context, 'auth/login.php', data);

    if (response != 'wrong') {
      Provider.of<MyProvider>(context, listen: false)
          .updateLoging(!myProvider.myLoging);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        AppSnackbar(
        isError: false,
        response: 'Success',
      ).show(context);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.dashboard, (_) => false);
    } else {
      Provider.of<MyProvider>(context, listen: false)
          .updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: 'Wrong username or password',
      ).show(context);
    }
  }
}
