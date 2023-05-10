import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class rides extends StatefulWidget {
  const rides({super.key});

  @override
  State<rides> createState() => _ridesState();
}

class _ridesState extends State<rides> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Container(
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
            ),
          ),
        ));
  }
}
