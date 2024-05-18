// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../Components/BottomNavBar/BottomNavBar.dart';
import '../Components/WeaponTypeList/WeaponTypeList.dart';
import '../constants.dart';

class WeaponShopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeaponShopScreenState();
}

class _WeaponShopScreenState extends State<WeaponShopScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: constants.currentweaponsindex,
      length: constants.WeaponScreenTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weapons",
            style: TextStyle(fontFamily: "Inter", color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: <Color>[
                  Color.fromARGB(255, 110, 7, 0),
                  Color.fromARGB(255, 255, 128, 128)
                ])),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeaponShopScreen(),));
            }, icon: const Icon(Icons.refresh_sharp, color: Colors.white,))
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(
                fontFamily: "Inter SemiBold", color: Colors.white),
            unselectedLabelStyle: const TextStyle(
                fontFamily: "Inter SemiBold",
                color: Color.fromARGB(255, 128, 128, 128)),
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: constants.WeaponScreenTabs,
            onTap: (value) {
              constants.currentweaponsindex = value;
            },
            
          ),
          surfaceTintColor: Colors.red,
        ),
        body: Column(
          children: [
            const Flexible(
              child: TabBarView(
                children: [
                  WeaponTypeList(type: ""),
                  WeaponTypeList(type: "AR"),
                  WeaponTypeList(type: "CAR"),
                  WeaponTypeList(type: "SR"),
                  WeaponTypeList(type: "DMR"),
                  WeaponTypeList(type: "LMG"),
                  WeaponTypeList(type: "PDW"),
                  WeaponTypeList(type: "PST"),
                  WeaponTypeList(type: "SG"),
                  WeaponTypeList(type: "SMG"),
                ],
              ),
            ),
            BottomNavBar(tiles: constants.NavBarElements)
          ],
        ),
      ),
    );
  }
}
