// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Components/BottomNavBar/SingleElement.dart';

class constants {
  static var formatter = NumberFormat('###,000');

  static int currentweaponsindex = 0;

  static String endpoint = "https://localhost:7069/";

  static String endpointGetWeapon = "api/Weapon/GetWeapon?WeaponName=";
  static String endpointGetAllWeapons = "api/Weapon/GetAllWeapons";
  static String endpointGetWeaponPicture = "api/Weapon/GetWeaponImage?Name=";
  static String endpointGetWeaponMakePicture =
      "api/Weapon/GetWeaponMakeImage?Name=";
  static String endpointGetAllWeaponsByType =
      "api/Weapon/GetAllWeaponsByType?type=";

  // Bottom Nav Bar Elements
  // ignore: non_constant_identifier_names
  static List<SingleElement> NavBarElements = [
    SingleElement(
        onPress: () {},
        icon: const Icon(Icons.storage_sharp),
        label: "Weapons"),
    SingleElement(
        onPress: () {},
        icon: const Icon(Icons.electrical_services_sharp),
        label: "Accessories"),
    SingleElement(
        onPress: () {}, icon: const Icon(Icons.home_filled), label: "Home"),
    SingleElement(
        onPress: () {}, icon: const Icon(Icons.usb), label: "Utility"),
    SingleElement(
        onPress: () {},
        icon: const Icon(Icons.cloud_upload),
        label: "Ammunition"),
  ];

  static List<Tab> WeaponScreenTabs = [
    const Tab(
      child: Text('Everything'),
    ),
    const Tab(
      child: Text('Assault Rifles'),
    ),
    const Tab(
      child: Text('Assault Carbines'),
    ),
    const Tab(
      child: Text('Bolt Action Rifles'),
    ),
    const Tab(
      child: Text('Designated Marksman Rifles'),
    ),
    const Tab(
      child: Text('Light Machine Guns'),
    ),
    const Tab(
      child: Text('Personal Defence Weapon'),
    ),
    const Tab(
      child: Text('Pistols'),
    ),
    const Tab(
      child: Text('Shotguns'),
    ),
    const Tab(
      child: Text('Submachine Guns'),
    ),
  ];
}
