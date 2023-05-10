import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppConst {
  static Color primary = HexColor('#00967B');
  static Color white = HexColor('#ffffff');
  static Color black = HexColor('#000000');
  static Color grey = Colors.grey;
  static Color brown = HexColor('#452612');
  static Color whiteOpacity = Colors.white.withOpacity(0.8);
  static Color blackOpacity = Color.fromARGB(154, 0, 0, 0);
  static Color transparent = Colors.transparent;
}
