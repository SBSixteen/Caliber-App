// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BigColorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8)),
                color: Colors.red),
            height: 9,
            width: 30,
          ),
          Container(
            color: Colors.orange,
            height: 9,
            width: 30,
          ),
          Container(
            color: Colors.amber,
            height: 9,
            width: 30,
          ),
          Container(
            color: Colors.yellow,
            height: 9,
            width: 30,
          ),
          Container(
            color: Colors.lightGreen,
            height: 9,
            width: 30,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8)),
                color: Colors.green),
            height: 9,
            width: 30,
          )
        ],
      ),
    );
  }
}
