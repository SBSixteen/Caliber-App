import 'package:flutter/material.dart';

class SingleElement extends StatefulWidget {
  final Function onPress;
  final Icon icon;
  final String label;
  const SingleElement(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.label});
  @override
  State<StatefulWidget> createState() => _SingleElementState();
}

class _SingleElementState extends State<SingleElement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {widget.onPress();},
          icon: widget.icon,
          color: Colors.red,
        ),
        Text(
          widget.label,
          style: const TextStyle(fontFamily: "Inter", fontSize: 12.0),
        )
      ],
    );
  }
}
