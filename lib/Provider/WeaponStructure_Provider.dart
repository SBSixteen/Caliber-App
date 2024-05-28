// ignore_for_file: file_names
import 'dart:convert';

import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Model/WeaponStructure.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'WeaponStructure_Provider.g.dart';

@riverpod
Future<List<String>> getWeaponAttachmentPositions(GetWeaponAttachmentPositionsRef ref,String weaponName){
  return WeaponStructureService().getWeaponAttachmentPositions(weaponName);
}

@riverpod
Future<WeaponStructure> getDefaultWeaponStructureOf(GetDefaultWeaponStructureOfRef ref, String weaponName){
  print("are we trying?");
  return WeaponStructureService().getDefaultWeaponStructureOf(weaponName);
}

class WeaponStructureService {

    WeaponStructureService._internal();

  static final WeaponStructureService _instance =
      WeaponStructureService._internal(); // Singleton instance

  factory WeaponStructureService() {
    return _instance;
  }

  Future<WeaponStructure> getDefaultWeaponStructureOf(String weaponName) async{

    var a = WeaponStructure();
    List<Attachment> attachments = await AttachmentService().getDefaultWeaponParts(weaponName);

    print(attachments);

    for(Attachment i in attachments){
      a.addAttachment(i.AttachmentPart,i);
    }

    return a;

  }

  Future<List<String>> getWeaponAttachmentPositions(String weaponName) async {
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
