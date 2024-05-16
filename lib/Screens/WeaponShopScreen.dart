import 'package:flutter/material.dart';

class WeaponShopScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WeaponShopScreenState();
}

class _WeaponShopScreenState extends State<WeaponShopScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 11, child: Scaffold());
  }

}