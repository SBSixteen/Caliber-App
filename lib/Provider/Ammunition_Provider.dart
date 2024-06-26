import 'package:calibre/Model/Ammunition.dart';
import 'dart:convert';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Ammunition_Provider.g.dart';

@riverpod
Future<List<Ammunition>> getAmmunitionByCaliber(
    GetAmmunitionByCaliberRef ref, String caliber) {
  return AmmunitionService().getAmmunitionByCaliber(caliber);
}

@riverpod
Future<List<String>> getCalibers(GetCalibersRef ref) {
  return AmmunitionService().getCalibers();
}

@riverpod
Future<Ammunition> getAmmunition(
    GetAmmunitionRef ref, String caliber, String variant) {
      print("here");
  return AmmunitionService().getAmmunition(caliber, variant);
}

class AmmunitionService {
  AmmunitionService._internal();

  static final AmmunitionService _instance =
      AmmunitionService._internal(); // Singleton instance

  factory AmmunitionService() {
    return _instance;
  }

  Future<List<String>> getCalibers() async {
    var response = await http
        .get(Uri.parse(constants.endpoint + constants.endpointGetCalibers));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final ammo = json.map<String>((e) {
        return e.toString();
      }).toList();
      return ammo;
    } else {
      return [];
    }
  }

  Future<Ammunition> getAmmunition(String caliber, String variant) async {
    var response = await http
        .get(Uri.parse(constants.endpointGetAmmunition(caliber, variant)));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      print(json);
      final ammo = Ammunition.fromJson(json);
      print(ammo);
      return ammo;
    }

    throw ArgumentError("Received Crap");
  }

  Future<List<Ammunition>> getAmmunitionByCaliber(String caliber) async {
    caliber = caliber.replaceAll(" ", "%20");

    var response = await http.get(Uri.parse(constants.endpoint +
        constants.endpointGetAmmunitionByCaliber +
        caliber));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final ammo = json.map<Ammunition>((e) {
        return Ammunition.fromJson(e);
      }).toList();
      return ammo;
    } else {
      return [];
    }
  }
}
