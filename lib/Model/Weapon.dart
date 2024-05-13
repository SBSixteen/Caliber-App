import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:calibre/constants.dart';

class Weapon {
  String? WeaponName;
  String? WeaponCaliber;
  String? WeaponMake;
  String? WeaponWeight;
  int? rof;
  int? efr;
  String? WeaponDescription;
  String? WeaponType;

  Weapon(
      this.WeaponName,
      this.WeaponCaliber,
      this.WeaponMake,
      this.WeaponWeight,
      this.rof,
      this.efr,
      this.WeaponDescription,
      this.WeaponType);

  Weapon.fromJson(Map<String, dynamic> json) {
    WeaponName = json["weaponName"];
    WeaponCaliber = json["weaponCaliber"];
    WeaponMake = json["weaponMake"];
    WeaponWeight = json["weaponWeight"];
    rof = json["rof"];
    efr = json["efr"];
    WeaponDescription = json["weaponDescription"];
    WeaponType = json["weaponType"];
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
