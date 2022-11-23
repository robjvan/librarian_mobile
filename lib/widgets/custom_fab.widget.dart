import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      elevation: 8.0,
      animationCurve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.camera_alt),
            label: 'Scan ISBN to add book',
            onTap: () {
              //
            }),
        SpeedDialChild(
            child: const Icon(Icons.manage_search),
            label: 'Search by details to add book',
            onTap: () {
              //
            }),
        SpeedDialChild(
            child: const Icon(Icons.list_alt),
            label: 'Manually enter details to add a book',
            onTap: () {
              //
            }),
      ],
    );
  }
}
