import 'package:business_card/routes/route-names.dart';
import 'package:business_card/src/service/navigation-service.dart';
import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_button.dart';
import 'package:business_card/src/widgets/app_text.dart';
import 'package:business_card/src/widgets/app_typeAheadFormFIeld.dart';
import 'package:flutter/material.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});
  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  @override
  void initState() {
    super.initState();
    getDestination();
  }

  var destination;
  List destinations = [];
  List directions = [];
  var direction;
  var direction_id;
  var route;
  List routes = [];
  Future<void> getDestination() async {
    final navigationService _navigationService = await navigationService();
    final List destinationsList =
        await _navigationService.getDestination(context, 'destination/get.php');
    setState(() {
      this.destinations = destinationsList;
    });
  }

  Future<void> getroutes() async {
    final navigationService _navigationService = await navigationService();
    final List routesList =
        await _navigationService.getroutes(context, destination.toString());
    setState(() {
      this.routes = routesList;
    });
  }

  TextEditingController destin = TextEditingController();
  TextEditingController dire = TextEditingController();
  TextEditingController routing = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppConst.white,
                    size: 25,
                  ),
                  AppText(
                    txt: 'Your route',
                    size: 25,
                    weight: FontWeight.w900,
                    color: AppConst.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TypeAheadFormFieldWidget(
              controller: destin,
              hintText: 'Destination',
              hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              suggestionsCallback: (String pattern) async {
                List<dynamic> filteredDestinations = destinations
                    .where((destination) => destination['name']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
                return Future.value(filteredDestinations);
              },
              itemBuilder: (BuildContext context, dynamic suggestion) {
                return ListTile(
                  title: AppText(
                    txt: suggestion['name'],
                    size: 15,
                    color: AppConst.primary,
                  ),
                );
              },
              onSuggestionSelected: (dynamic suggestion) {
                setState(() {
                  destin.text = suggestion['name'];
                  List<String> d = destin.text.toString().split('-');
                  directions = List.generate(
                      d.length,
                      (index) => {
                            'name': d[index],
                            'id': (index + 1).toString(),
                          });

                  destination = suggestion['id'];
                });
                getroutes();
              },
            ),
            TypeAheadFormFieldWidget(
              controller: dire,
              hintText: 'Direction',
              hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              suggestionsCallback: (String pattern) async {
                List<dynamic> filteredDirections = directions
                    .where((direction) => direction['name']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
                return Future.value(filteredDirections);
              },
              itemBuilder: (BuildContext context, dynamic suggestion) {
                return ListTile(
                  title: AppText(
                    txt: "To ${suggestion['name']}",
                    size: 15,
                    color: AppConst.primary,
                  ),
                );
              },
              onSuggestionSelected: (dynamic suggestion) {
                setState(() {
                  dire.text = suggestion['name'];
                  direction_id = suggestion['id'];
                });
              },
            ),
            TypeAheadFormFieldWidget(
              controller: routing,
              hintText: 'Route',
              hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              suggestionsCallback: (String pattern) async {
                List<dynamic> filteredRoutes = routes
                    .where((routes) => routes['name']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
                return Future.value(filteredRoutes);
              },
              itemBuilder: (BuildContext context, dynamic suggestion) {
                return ListTile(
                  title: AppText(
                    txt: suggestion['name'],
                    size: 15,
                    color: AppConst.primary,
                  ),
                );
              },
              onSuggestionSelected: (dynamic suggestion) {
                setState(() {
                  routing.text = suggestion['name'];
                  route = suggestion['id'];
                });
              },
            ),
            Container(
              width: 330,
              height: 45,
              child: AppButton(
                  onPress: () => Navigator.pushNamed(
                        context,
                        RouteNames.searchBus,
                        arguments: {
                          'destination': destination.toString(),
                          'dire': direction_id.toString(),
                          'route': route.toString(),
                        },
                      ),
                  label: 'Submit',
                  borderRadius: 20,
                  textColor: AppConst.white,
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
