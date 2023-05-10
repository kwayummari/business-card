import 'package:business_card/src/api/apis.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_snackbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:business_card/routes/route-names.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> registration(BuildContext context, String email, String password,
      String rpassword, String fullname, String phone) async {
    if (password.toString() == rpassword.toString()) {
      Map<String, dynamic> data = {
        'email': email.toString(),
        'fullname': fullname.toString(),
        'password': password.toString(),
        'phone': phone.toString(),
      };
      final response = await api.post(context, 'auth/registration.php', data);
      if (response.toString() == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('role', '0');
        Fluttertoast.showToast(
          msg: response,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConst.primary,
          textColor: Colors.white,
          fontSize: 15.0,
        );
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        AppSnackbar(
          isError: true,
          response: response.toString(),
        ).show(context);
      }
    } else {
      AppSnackbar(
        isError: true,
        response: 'Something went wrong!',
      ).show(context);
    }
  }
}
