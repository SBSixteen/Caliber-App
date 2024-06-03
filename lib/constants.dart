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
  static StateProvider<Attachment?> inFocusAttachment =
      StateProvider<Attachment?>((ref) => null);
  static StateProvider<List<WeaponStructure>> cart =
      StateProvider<List<WeaponStructure>>((ref) => []);
  
  static List<WeaponStructure> weaponCart = [];
  static Map<String, int> ammoCart = {};
  static WeaponStructure currentPreset = WeaponStructure();

  static var formatter = NumberFormat('###,000');

  static int currentweaponsindex = 0;
  static int currentammoindex = 0;
  static String currentnavpage = "Weapons";

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
  static String endpointGetCalibers = "api/Ammunition/GetAllCalibers";
  static String endpointGetAmmunitionByCaliber =
      "api/Ammunition/GetAmmunitionByCaliber?caliber=";
  static String endpointGetAmmunitionPicture =
      "api/Ammunition/GetAmmunitionImage?caliber=";

  static String endpointGetAmmunition(String caliber, String variant){
    caliber = caliber.replaceAll(" ", "%20");
    variant = variant.replaceAll(" ", "%20");
    return "${endpoint}api/Ammunition/GetAmmunition?caliber=$caliber&variant=$variant";
  }
  //WeaponStructure
  static String endpointGetWeaponStructure =
      "api/WeaponStructure/GetWeaponStructureOf?weaponName=";
  
  //Wishlist
    static String endpointGetWishlistOf =
      "https://localhost:7069/api/Wishlist/GetWishlist?email=";

          static String endpointPostWishlistOf(String email, String name){

            email = email.replaceAll("@", "%40");

            return "${endpoint}api/Wishlist/PutWishlist?e=$email&n=$name";
          }

            static String endpointGetValueOf(String email, String name){

            email = email.replaceAll("@", "%40");

            return "${endpoint}api/Wishlist/GetValue?email=$email&name=$name";
          }

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
  static String endpointGetDefaultKitCountOfWeapon = 
  "api/Attachment/GetDefaultKitCountOfWeapon?gunname=";

  static String endpointGetDefaultWeaponPartByPosition(
      String gunname, String position) {
    gunname = gunname.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetDefaultWeaponPartByPosition?gunname=$gunname&position=$position";
  }

  static String endpointGetCountCompatibleWeaponPositionAttachments(
      String gunname, String position) {
    gunname = gunname.replaceAll(" ", "%20");
    position = position.replaceAll(" ", "%20");

    return "${endpoint}api/Attachment/GetCountCompatibleWeaponPositionAttachments?weaponName=$gunname&position=$position";
  }

  static String endpointGetCompatibleWeaponPositionAttachments(
      String weaponName, String position) {
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
        icon: const Icon(Icons.webhook_sharp),
        label: "Weapons"),
    SingleElement(
        onPress: () {}, icon: const Icon(Icons.workspaces), label: "Ammo"),
    SingleElement(
        onPress: () {}, icon: const Icon(Icons.home_filled), label: "Home"),
    SingleElement(
        onPress: () {},
        icon: const Icon(Icons.shopping_cart_rounded),
        label: "Cart"),
    SingleElement(
        onPress: () {}, icon: const Icon(Icons.person), label: "Account"),
  ];

  //Styles & Decorations
  static TextStyle soft = const TextStyle(fontFamily: "Inter", fontSize: 12.0);
  static TextStyle softwhite = const TextStyle(fontFamily: "Inter", fontSize: 12.0, color: Colors.white);

  static TextStyle headings = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 24.0, color: Colors.red);

  static TextStyle ammoheadings = const TextStyle(
      fontFamily: "Bender", fontSize: 24.0, color: Colors.white);

  static TextStyle textButton = const TextStyle(
      fontFamily: "Inter SemiBold", fontSize: 16.0, color: Colors.red);

  static TextStyle bender = const TextStyle(fontFamily: "Bender");
  static TextStyle benderWhite = const TextStyle(fontFamily: "Bender", color: Colors.white);
  static TextStyle benderWhiteSmall = const TextStyle(fontFamily: "Bender", color: Colors.white, fontSize: 12.0);

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

        static TextStyle ammoPrice = const TextStyle(
      fontFamily: "Bender", fontSize: 22.0, color: Colors.white);

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
    "Optic": 0.4,
    "Flashlight": 0.4,
    "Foregrip": 0.4,
    "Laser": 0.4,
    "Charging Handle": 0.4,
    "Front Sight": 0.4,
    "Buffer Tube": 0.4,
    "Upper Receiver": 0.6,
    "Barrel": 0.8,
  };

  //Initializer
    static List<Tab> WeaponScreenTabs = [
    Tab(
      child: Text('Everything', style: bender),
    ),
    Tab(
      child: Text('Assault Rifles', style: bender),
    ),
    Tab(
      child: Text('Assault Carbines', style: bender),
    ),
    Tab(
      child: Text('Bolt Action Rifles', style: bender),
    ),
    Tab(
      child: Text('Designated Marksman Rifles', style: bender),
    ),
    Tab(
      child: Text('Light Machine Guns', style: bender),
    ),
    Tab(
      child: Text('Personal Defence Weapon', style: bender),
    ),
    Tab(
      child: Text('Pistols', style: bender),
    ),
    Tab(
      child: Text('Shotguns', style: bender),
    ),
    Tab(
      child: Text('Submachine Guns', style: bender),
    ),
  ];
}
