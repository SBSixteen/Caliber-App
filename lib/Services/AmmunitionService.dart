import 'package:calibre/Model/Ammunition.dart';
import 'dart:convert';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;

class AmmunitionService{

  static Future<List<Ammunition>> getAmmunitionByCaliber(String caliber) async{

    caliber = caliber.replaceAll(" ", "%20");

    var response = await http.get(Uri.parse(constants.endpoint + constants.endpointGetAmmunitionByCaliber + caliber));
    if(response.statusCode == 200){
      var json = await jsonDecode(response.body);
      final ammo = json.map<Ammunition>((e) {
        return Ammunition.fromJson(e);
      }).toList();
      return ammo;
      
    }else{
      return [];
    }
  }

}