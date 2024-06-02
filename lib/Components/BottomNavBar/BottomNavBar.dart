// ignore_for_file: file_names

import 'package:calibre/Components/BottomNavBar/SingleElement.dart';
import 'package:calibre/Screens/AccountsScreen.dart';
import 'package:calibre/Screens/AmmoShopScreen.dart';
import 'package:calibre/Screens/CartScreen.dart';
import 'package:calibre/Screens/WeaponShopScreen.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

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
                }
              },
              icon: const Icon(Icons.webhook_sharp),
              label: "Weapons"),
          SingleElement(
              onPress: () {
                if (constants.currentnavpage != "Ammo") {
                  constants.currentnavpage = "Ammo";
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
              onPress: () {
                print(constants.someUser!.email!);
              },
              icon: const Icon(Icons.home_filled),
              label: "Home"),
          SingleElement(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CartScreen();
                  },
                ));
              },
              icon: const Icon(Icons.shopping_cart_rounded),
              label: "Cart"),
          SingleElement(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AccountsScreen();
                },));
              }, icon: const Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
