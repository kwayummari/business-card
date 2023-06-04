import 'package:business_card/src/screens/models/client/business_card/business_card.dart';
import 'package:business_card/src/screens/models/client/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:business_card/src/screens/authentication/login.dart';
import 'package:business_card/src/screens/authentication/registration.dart';
import 'package:business_card/src/screens/splash/splash.dart';
import 'package:business_card/routes/route-names.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.dashboard: (context) => dashboard(),
  RouteNames.myImagePage: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return MyImagePage(
      name: args?['name'],
      job: args?['job'],
      company: args?['company'],
      phone: args?['phone'],
      email: args?['email'],
      website: args?['website'],
      work: args?['work'],
    );
  },
};
