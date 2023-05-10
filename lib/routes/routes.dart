import 'package:business_card/src/screens/models/client/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:business_card/src/screens/models/client/business_card/business_card.dart';
import 'package:business_card/src/screens/models/client/dashboard/dashboard.dart';
import 'package:business_card/src/screens/models/client/navigation/navigation.dart';
import 'package:business_card/src/screens/models/client/profile/profile.dart';
import 'package:business_card/src/screens/models/client/rides/rides.dart';
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
  RouteNames.rides: (context) => rides(),
  RouteNames.profile: (context) => profile(),
  RouteNames.bottomNavigationBar: (context) => bottomNavigation(),
  RouteNames.navigation: (context) => navigation(),
  RouteNames.myImagePage:(context) => MyImagePage(),
  // RouteNames.buses: (context) {
  //   final Map<String, dynamic>? args =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   return buses(
  //     destination: args?['destination'],
  //     dire: args?['dire'],
  //     route: args?['route'],
  //   );
  // },
};
