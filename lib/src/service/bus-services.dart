import 'package:business_card/src/api/apis.dart';
import 'package:flutter/material.dart';

class busService {
  Api api = Api();

  Future getBus(
      BuildContext context, String destination, String direction, String route) async {
    Map<String, dynamic> data = {
      'destination': destination.toString(),
      'direction': direction.toString(),
      'route': route.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }
}
