import 'package:business_card/src/api/apis.dart';
import 'package:flutter/material.dart';

class navigationService {
  Api api = Api();

  Future getDestination(BuildContext context, String endPoint) async {
    final response = await api.get(context, endPoint);
    return response;
  }

  Future getroutes(BuildContext context, String destination) async {
    Map<String, dynamic> data = {'id': destination.toString()};
    final response = await api.post(context, 'routes/get-byid.php', data);
    return response;
  }
}
