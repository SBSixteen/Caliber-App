// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:calibre/constants.dart';

class Weapon {
  String WeaponName;
  String WeaponCaliber;
  String WeaponMake;
  double WeaponWeight;
  int rof;
  int efr;
  String WeaponDescription;
  String WeaponType;
  String WeaponTypeShort;
  String WeaponOrigin;
  double WeaponPrice;
  double WeaponDiscount;

  Weapon(
      this.WeaponName,
      this.WeaponCaliber,
      this.WeaponMake,
      this.WeaponWeight,
      this.rof,
      this.efr,
      this.WeaponDescription,
      this.WeaponType,
      this.WeaponTypeShort,
      this.WeaponOrigin,
      this.WeaponPrice,
      this.WeaponDiscount);

  factory Weapon.fromJson(Map<dynamic, dynamic> json) {
    return Weapon(
        json["weaponName"],
        json["weaponCaliber"],
        json["weaponMake"],
        json["weaponWeight"],
        json["rof"],
        json["efr"],
        json["weaponDescription"],
        json["weaponType"],
        json["weaponTypeShort"],
        json["weaponOrigin"],
        json["weaponPrice"],
        json["weaponDiscount"]);
  }

  static Future<Weapon> fromName(String name) async {
    name = name.replaceAll(" ", "%20");
    var url = constants.endpoint + constants.endpointGetWeapon + name;
    var data = await https.get(Uri.parse(url));

    if (data.statusCode == 200) {
      return Weapon.fromJson(jsonDecode(data.body));
    } else {
      throw Exception("Did not get a valid Weapon object!");
    }
  }
}
