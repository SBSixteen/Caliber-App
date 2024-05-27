// ignore_for_file: file_names
import 'dart:convert';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Weapon_Provider.g.dart';

@riverpod
Future<Weapon> getWeaponFromName(GetWeaponFromNameRef ref, String weaponName){
  return WeaponService().getWeaponFromName(weaponName);
}

@riverpod
Future<List<Weapon>> getWeapons(GetWeaponsRef ref){
  return WeaponService().getWeapons();
}

@riverpod
Future<List<Weapon>> getWeaponsByType(GetWeaponsByTypeRef ref, String type){
  return WeaponService().getWeaponsByType(type);
}

class WeaponService {
  WeaponService._internal();

  static final WeaponService _instance =
      WeaponService._internal(); // Singleton instance

  factory WeaponService() {
    return _instance;
  }

  Future<Weapon> getWeaponFromName(String name) async {
    name = name.replaceAll(" ", "%20");
    var response = await http.get(
        Uri.parse(constants.endpoint + constants.endpointGetWeapon + name));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      return Weapon.fromJson(json);
    } else {
      throw Exception("Bad Response: No Weapon Found!");
    }
  }

  Future<List<Weapon>> getWeapons() async {
    var response = await http
        .get(Uri.parse(constants.endpoint + constants.endpointGetAllWeapons));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final weapons = json.map<Weapon>((e) {
        return Weapon.fromJson(e);
      }).toList();
      return weapons;
    } else {
      return [];
    }
  }

  Future<List<Weapon>> getWeaponsByType(String weaponName) async {

    if(weaponName == ""){
      return await getWeapons();
    }
    var response = await http.get(Uri.parse(
        constants.endpoint + constants.endpointGetAllWeaponsByType + weaponName));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final weapons = json.map<Weapon>((e) {
        return Weapon.fromJson(e);
      }).toList();
      return weapons;
    } else {
      return [];
    }
  }
}
