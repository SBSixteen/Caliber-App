// ignore_for_file: file_names

import 'package:calibre/Components/BottomNavBar/SingleElement.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  final List<SingleElement> tiles;
  const BottomNavBar({super.key, required this.tiles});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.tiles,
      ),
    );
  }
}
