// import 'package:business_card/src/utils/app_const.dart';
// import 'package:flutter/material.dart';
// import 'package:business_card/src/widgets/app_text.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_maps_webservice/places.dart';

// class appMapInputtext extends StatefulWidget {
//   final TextEditingController? textfieldcontroller;
//   final String? label;
//   final Icon? icon;
//   final Color? fillcolor;
//   final IconButton? suffixicon;
//   final Function? validate;
//   final bool? enabled;
//   appMapInputtext({
//     Key? key,
//     required this.textfieldcontroller,
//     required this.fillcolor,
//     this.icon,
//     this.suffixicon,
//     required this.label,
//     this.validate,
//     this.enabled,
//   }) : super(key: key);

//   @override
//   _appMapInputtextState createState() => _appMapInputtextState();
// }

// class _appMapInputtextState extends State<appMapInputtext> {
//   final places = GoogleMapsPlaces(apiKey: 'YOUR_API_KEY');
//   late AutocompleteSessionToken sessionToken;
//   List<AutocompletePrediction> _predictions = [];

//   @override
//   void initState() {
//     super.initState();
//     sessionToken = AutocompleteSessionToken();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
//       child: TextFormField(
//         onChanged: (value) async {
//           if (value.isNotEmpty) {
//             final result = await places.autocomplete(
//               value,
//               language: "en",
//               types: [],
//               sessionToken: sessionToken,
//             );

//             if (result.isOkay) {
//               setState(() {
//                 _predictions = result.predictions;
//               });
//             }
//           }
//         },
//         enabled: widget.enabled ?? true,
//         style: TextStyle(color: AppConst.white),
//         obscuringCharacter: '*',
//         controller: widget.textfieldcontroller,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           label: Container(
//             color: AppConst.primary,
//             child: AppText(
//               txt: widget.label,
//               size: 15,
//               color: AppConst.white,
//             ),
//           ),
//           filled: true,
//           fillColor: widget.fillcolor,
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),
//             borderSide: BorderSide(color: AppConst.black),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),
//             borderSide: BorderSide(color: AppConst.black),
//           ),
//           prefixIcon: widget.icon,
//           suffixIcon: widget.suffixicon,
//         ),
//         validator: (value) {
//           if (value!.isNotEmpty) {
//             return null;
//           } else if (value.isEmpty) {
//             return "This field cannot be empty";
//           }
//         },
//       ),
//     );
//   }
// }
