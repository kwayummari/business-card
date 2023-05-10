import 'package:flutter/material.dart';

class AppListviewBuilder extends StatelessWidget {
  final bool disabled;
  final int itemnumber;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const AppListviewBuilder(
      {Key? key,
      this.disabled = false,
      required this.itemnumber,
      required this.itemBuilder,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: itemnumber != 0 ? itemnumber : null,
    );
  }
}
