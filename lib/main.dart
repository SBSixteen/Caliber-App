import 'package:calibre/Components/BottomNavBar/BottomNavBar.dart';
import 'package:calibre/Components/WeaponTypeList/WeaponTypeList.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Caliber", style: TextStyle(fontFamily: "Inter", color: Colors.white),),
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
            actions: const [Icon(Icons.account_box_outlined, color: Colors.white70,)],
            bottom: TabBar(
              labelStyle: const TextStyle(
                  fontFamily: "Inter SemiBold", color: Colors.white),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: "Inter SemiBold",
                  color: Color.fromARGB(255, 128, 128, 128)),
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: constants.WeaponScreenTabs,
            ),
            surfaceTintColor: Colors.red,
          ),
          body: Column(
            children: [
              const Flexible(
                child: TabBarView(
                  children: [
                    WeaponTypeList(type: "AR"),
                    WeaponTypeList(type: "CAR"),
                    WeaponTypeList(type: "DMR"),
                    WeaponTypeList(type: "SMG"),
                    WeaponTypeList(type: "PST"),
                    WeaponTypeList(type: "SG"),
                    WeaponTypeList(type: "SR"),
                  ],
                ),
              ),
              BottomNavBar(tiles: constants.NavBarElements)
            ],
          ),
          // appBar: AppBar(
          //   backgroundColor: Colors.red,
          // ),
          // body: SafeArea(
          //   child: Center(
          //     child: Column(
          //       children: <Widget>[
          //         BottomNavBar(tiles: constants.NavBarElements)
          //       ],
          //     ),
          //   ),
          // )
        ),
      ),
    );
  }
}
