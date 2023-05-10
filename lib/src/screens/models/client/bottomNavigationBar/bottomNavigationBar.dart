// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, curly_braces_in_flow_control_structures, depend_on_referenced_packages, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'package:business_card/src/screens/models/client/dashboard/dashboard.dart';
import 'package:business_card/src/screens/models/client/profile/profile.dart';
import 'package:business_card/src/screens/models/client/rides/rides.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:flutter/material.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  _bottomNavigationState createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int index = 1;
  final Screen = [
    rides(),
    dashboard(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            body: Screen[index],
            extendBody: true,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppConst.black,
                primaryColor: AppConst.black,
                // textTheme: Theme.of(context).textTheme.copyWith(
                //     bodySmall:
                //         GoogleFonts.vesperLibre(color: HexColor('#cbdd33')))
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppConst.primary,
                unselectedItemColor: AppConst.grey,
                backgroundColor: AppConst.black,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_travel), label: 'My Card'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_search_sharp), label: 'Profile'),
                ],
                currentIndex: index,
                onTap: (index) {
                  if (mounted) setState(() => this.index = index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
