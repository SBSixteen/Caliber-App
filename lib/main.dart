import 'package:calibre/Components/Mock/WeaponShopCard.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Screens/WeaponShopScreen.dart';
import 'package:flutter/material.dart';

Future<void> main () async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,

      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          
        ),
        body: Column(
          children: [WeaponShopCardMock()],
        ),
      )
    );
  }
}
