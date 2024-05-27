// ignore_for_file: file_names
import 'dart:convert';

import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;

class WeaponStructureService {
  static Future<List<String>> getWeaponStructureOf(String weaponName) async {
    weaponName = weaponName.replaceAll(" ", "%20");
    var response = await http.get(Uri.parse(constants.endpoint +
        constants.endpointGetWeaponStructure +
        weaponName));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final parts = json.map<String>((e) {
        return e.toString();
      }).toList();
      return parts;
    } else {
      return [];
    }
  }
}
