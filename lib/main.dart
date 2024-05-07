import 'package:calibre/Components/WeaponShopCard.dart';
import 'package:calibre/Model/Weapon.dart';
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
        brightness: Brightness.dark
      ),
      home: Scaffold(
        drawer: const Drawer(
          child: Column(
          
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
            },),
          title: const Text("Calibre"),
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        ),
        body:const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,            
            children: [
              Row()
            ]
        ),
      ),
    )
    );
  }
}
