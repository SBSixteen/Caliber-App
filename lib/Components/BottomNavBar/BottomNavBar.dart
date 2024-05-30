// ignore_for_file: file_names

import 'package:calibre/Components/BottomNavBar/SingleElement.dart';
import 'package:calibre/Components/Cards/WeaponCards/WeaponShopCard.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Screens/AmmoShopScreen.dart';
import 'package:calibre/Screens/WeaponShopScreen.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleElement(
              onPress: () {
                if (constants.currentnavpage != "Weapons") {
                  constants.currentnavpage = "Weapons";
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return WeaponShopScreen();
                    },
                  ));
                }
              },
              icon: const Icon(Icons.webhook_sharp),
              label: "Weapons"),
          SingleElement(
              onPress: () {
                if (constants.currentnavpage != "Ammo") {
                  constants.currentnavpage = "Ammo";
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AmmoShopScreen();
                    },
                  ));
                }
              },
              icon: const Icon(Icons.workspaces),
              label: "Ammo"),
          SingleElement(
              onPress: () {},
              icon: const Icon(Icons.home_filled),
              label: "Home"),
          SingleElement(
              onPress: () {
                print(constants.currentnavpage);
              },
              icon: const Icon(Icons.shopping_cart_rounded),
              label: "Cart"),
          SingleElement(
              onPress: () {}, icon: const Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
