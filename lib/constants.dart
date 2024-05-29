// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Model/WeaponStructure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'Components/BottomNavBar/SingleElement.dart';

class constants {

  //Provider
  static StateProvider<WeaponStructure> weaponPreset = StateProvider<WeaponStructure>((ref) => WeaponStructure());
  static StateProvider<Attachment?> inFocusAttachment = StateProvider<Attachment?>((ref) => null);
  static StateProvider<List<Object>> cart = StateProvider<List<Object>>((ref) => List.empty());

  static var formatter = NumberFormat('###,000');

  static int currentweaponsindex = 0;

  static String endpoint = "https://localhost:7069/";

  //Weapons
  static String endpointGetWeapon = "api/Weapon/GetWeapon?WeaponName=";
  static String endpointGetAllWeapons = "api/Weapon/GetAllWeapons";
  static String endpointGetWeaponPicture = "api/Weapon/GetWeaponImage?Name=";
  static String endpointGetWeaponMakePicture =
      "api/Weapon/GetWeaponMakeImage?Name=";
  static String endpointGetAllWeaponsByType =
      "api/Weapon/GetAllWeaponsByType?type=";

  //Ammuntion
  static String endpointGetAmmunitionByCaliber =
      "api/Ammunition/GetAmmunitionByCaliber?caliber=";
  static String endpointGetAmmunitionPicture =
      "api/Ammunition/GetAmmunitionImage?caliber=";

  //WeaponStructure
  static String endpointGetWeaponStructure =
      "api/WeaponStructure/GetWeaponStructureOf?weaponName=";

  //Attachments
  static String endpointGetAllAttachments = "api/Attachment/GetAllAttachments";
  static String endpointGetAttachmentsByPosition =
      "api/Attachment/GetAttachmentByPosition?part=";
  static String endpointGetDefaultKitOfWeapon =
      "api/Attachment/GetDefaultKitOfWeapon?gunname=";
  static String endpointGetDovetailAttachments =
      "api/Attachment/GetDovetailMountableAttachment";
  static String endpointGetMountableAttachments =
      "api/Attachment/GetMountableAttachment";

  static String endpointGetDefaultWeaponPartByPosition(
      String gunname, String position) {
    gunname = gunname.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetDefaultWeaponPartByPosition?gunname=$gunname&position=$position";
  }

  static String endpointGetCountCompatibleWeaponPositionAttachments(String gunname, String position){

    gunname = gunname.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetCountCompatibleWeaponPositionAttachments?weaponName=$gunname&position=$position";

  }

    static String endpointGetCompatibleWeaponPositionAttachments(String weaponName, String position){

    weaponName = weaponName.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetCompatibleWeaponPositionAttachments?weaponName=$weaponName&position=$position";

  }

  static String endpointGetAttachmentPicture(String name, String position) {
    name = name.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetAttachmentImage?position=$position&name=$name";
  }

  // Bottom Nav Bar Elements
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

  //Styles & Decorations
  static TextStyle soft = const TextStyle(fontFamily: "Inter", fontSize: 12.0);

  static TextStyle headings = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 24.0, color: Colors.red);

  static TextStyle textButton = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 16.0, color: Colors.red);

  static TextStyle attachmentHeading = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 18.0, color: Colors.red);

  static TextStyle subheadings = const TextStyle(
      fontFamily: "Inter", fontSize: 18.0, color: Colors.orange);

  static TextStyle blacksubheadings = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 18.0, color: Colors.black);

  static TextStyle attachmentTilePrice = const TextStyle(
      fontFamily: "Inter SemiBold",
      fontSize: 18.0,
      color: Color.fromARGB(255, 2, 107, 0));

  static TextStyle subtlebadnews = const TextStyle(
      fontFamily: "Inter Bold",
      fontSize: 18.0,
      color: Color.fromARGB(255, 128, 128, 128));

  static TextStyle ammunitionVariant =
      const TextStyle(color: Colors.white, fontFamily: "Inter", fontSize: 12.0);

  //Colors
  static Color cardBackground = Colors.white;
  static Color cardSurfaceTint = Colors.transparent;

  //Theme
  static Brightness appBrightness = Brightness.light;

  //User
  static User? someUser;

  //Widgets
  static Widget bigLoader = const Center(
    child: SizedBox(
      height: 250,
      width: 250,
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    ),
  );

  static Widget smolLoader = const Center(
    child: SizedBox(
      height: 125,
      width: 125,
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    ),
  );

  static Widget defaultError = Center(
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          "Trouble connecting to Caliber Servers",
          style: subtlebadnews,
        )),
  );

  static Widget widgetNoAttachmentsFound = Center(
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          "No Attachments Found",
          style: subtlebadnews,
        )),
  );

  //Image Network Height Geometry
  static Map<String, double> weaponInquiryCardAttachment = {
    "Magazine": 0.20,
    "Dust Cover": 0.7,
    "Muzzle": 0.4,
    "Handguard": 0.4,
    "Platform": 0.80,
    "Rear Sight": 0.4,
    "Grip": 0.3,
    "Stock": 0.6,
    "Optic" : 0.4,
    "Charging Handle" : 0.4,
    "Front Sight" : 0.4,
    "Buffer Tube" : 0.4,
    "Upper Receiver" : 0.6,
    "Barrel" : 0.8,
  };
}
