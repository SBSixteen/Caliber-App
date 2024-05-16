// ignore_for_file: file_names
import 'dart:convert';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;

class WeaponService{

  static Future<Weapon> getWeaponFromName(String name) async{

    name = name.replaceAll(" ", "%20");
    var response = await http.get(Uri.parse(constants.endpoint + constants.endpointGetWeapon + name));

    if(response.statusCode == 200){
      var json = await jsonDecode(response.body);
      return Weapon.fromJson(json);
    }else{
      throw Exception("Bad Response: No Weapon Found!");
    }
  }

  static Future<List<Weapon>> getWeapons() async {

    var response = await http.get(Uri.parse(constants.endpoint + constants.endpointGetAllWeapons));
    if(response.statusCode == 200){

      var json = await jsonDecode(response.body);
      final weapons = json.map<Weapon>((e) {
        return Weapon.fromJson(e);
      }).toList();
      return weapons;
      
    }else{
      return [];
    }
  }

    static Future<List<Weapon>> getWeaponsByType(String name) async {

    var response = await http.get(Uri.parse(constants.endpoint + constants.endpointGetAllWeaponsByType + name));
    if(response.statusCode == 200){
      var json = await jsonDecode(response.body);
      final weapons = json.map<Weapon>((e) {
        return Weapon.fromJson(e);
      }).toList();
      return weapons;
    }else{
      return [];
    }
  }

}