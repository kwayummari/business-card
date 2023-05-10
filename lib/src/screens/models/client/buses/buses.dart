import 'package:business_card/src/service/bus-services.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_listtile.dart';
import 'package:business_card/src/widgets/app_listview_builder.dart';
import 'package:business_card/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class buses extends StatefulWidget {
  var destination;
  var dire;
  var route;
  buses({
    Key? key,
    required this.destination,
    required this.dire,
    required this.route,
  }) : super(key: key);

  @override
  State<buses> createState() => _busesState();
}

class _busesState extends State<buses> {
  @override
  void initState() {
    super.initState();
    getBuses();
  }

  List buses = [];
  Future<void> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBus(
        context, widget.destination, widget.dire, widget.route);
    setState(() {
      this.buses = busesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: AppListviewBuilder(
          itemnumber: buses.length,
          itemBuilder: (BuildContext context, int index) {
            return AppListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
              title: AppText(
                txt: buses[index]['number'],
                size: 15,
                weight: FontWeight.bold,
                color: AppConst.black,
              ),
              subTitle: AppText(
                txt: 'HICHA',
                color: AppConst.black,
                size: 13,
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Do something when the tile is tapped
              },
            );
          },
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
