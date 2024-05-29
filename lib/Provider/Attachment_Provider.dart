// ignore_for_file: file_names

import 'dart:convert';

import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Attachment_Provider.g.dart';

@riverpod
Future<List<Attachment>> getAttachmentsByPosition(
    GetAttachmentsByPositionRef ref, String position) {
  return AttachmentService().getAttachmentsByPosition(position);
}

@riverpod
Future<List<Attachment>> getAllAttachments(
    GetAllAttachmentsRef ref, String position) {
  return AttachmentService().getAllAttachments();
}

@riverpod
Future<Attachment> getDefaultWeaponPartByPosition(
    GetDefaultWeaponPartByPositionRef ref, String weaponName, String position) {
  return AttachmentService()
      .getDefaultWeaponPartByPosition(weaponName, position);
}

@riverpod
Future<List<Attachment>> getDefaultWeaponParts(
    GetDefaultWeaponPartsRef ref, String weaponName) {
  return AttachmentService().getDefaultWeaponParts(weaponName);
}

@riverpod
Future<List<Attachment>> getDovetailAttachments(GetDovetailAttachmentsRef ref) {
  return AttachmentService().getMountableDovetailAttachments();
}

@riverpod
Future<int> getCountCompatibleWeaponPositionAttachments(
    GetCountCompatibleWeaponPositionAttachmentsRef ref,
    String gunname,
    String position) {
  return AttachmentService()
      .getCountCompatibleWeaponPositionAttachments(gunname, position);
}

@riverpod
Future<List<Attachment>> getCompatibleWeaponPositionAttachments(
    GetCompatibleWeaponPositionAttachmentsRef ref,
    String gunname,
    String position) {
  return AttachmentService()
      .getCompatibleWeaponPositionAttachments(gunname, position);
}

@riverpod
Future<List<Attachment>> getMountableAttachments(
    GetMountableAttachmentsRef ref) {
  return AttachmentService().getMountableAttachments();
}

class AttachmentService {
  AttachmentService._internal();

  static final AttachmentService _instance =
      AttachmentService._internal(); // Singleton instance

  factory AttachmentService() {
    return _instance;
  }

  Future<List<Attachment>> getAllAttachments() async {
    var response = await http.get(
        Uri.parse(constants.endpoint + constants.endpointGetAllAttachments));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      print(attc);
      return attc;
    } else {
      return [];
    }
  }

  Future<List<Attachment>> getMountableDovetailAttachments() async {
    var response = await http.get(Uri.parse(
        constants.endpoint + constants.endpointGetDovetailAttachments));

    print(response.statusCode);

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      print(attc);
      return attc;
    } else {
      return [];
    }
  }

  Future<List<Attachment>> getMountableAttachments() async {
    var response = await http.get(Uri.parse(
        constants.endpoint + constants.endpointGetMountableAttachments));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      return attc;
    } else {
      return [];
    }
  }

  Future<List<Attachment>> getAttachmentsByPosition(String position) async {
    var response = await http.get(Uri.parse(constants.endpoint +
        constants.endpointGetAttachmentsByPosition +
        position));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      return attc;
    } else {
      return [];
    }
  }

  Future<Attachment> getDefaultWeaponPartByPosition(
      String gunname, String position) async {
    var response = await http.get(Uri.parse(
        constants.endpointGetDefaultWeaponPartByPosition(gunname, position)));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = Attachment.fromJson(json);
      return attc;
    } else {
      throw ArgumentError(
          "Unable to parse incoming data into an Attachment. Maybe no connection to caliber or corruption or invalid position for this gun.");
    }
  }

  Future<int> getCountCompatibleWeaponPositionAttachments(
      String gunname, String position) async {
    var response = await http.get(Uri.parse(
        constants.endpointGetCountCompatibleWeaponPositionAttachments(
            gunname, position)));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      int attc = json;
      return attc;
    } else {
      throw ArgumentError(
          "Unable to parse incoming data into an Attachment. Maybe no connection to caliber or corruption or invalid position for this gun.");
    }
  }

  Future<List<Attachment>> getCompatibleWeaponPositionAttachments(
      String weaponName, String position) async {
    var response = await http.get(Uri.parse(
        constants.endpointGetCompatibleWeaponPositionAttachments(
            weaponName, position)));
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      return attc;
    } else {
      return [];
    }
  }

  Future<List<Attachment>> getDefaultWeaponParts(String gunname) async {
    var response = await http.get(Uri.parse(constants.endpoint +
        constants.endpointGetDefaultKitOfWeapon +
        gunname));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final attc = json.map<Attachment>((e) {
        return Attachment.fromJson(e);
      }).toList();
      return attc;
    } else {
      return [];
    }
  }
}
