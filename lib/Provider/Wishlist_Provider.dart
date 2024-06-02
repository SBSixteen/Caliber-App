// ignore_for_file: file_names

import 'dart:convert';

import 'package:calibre/constants.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Wishlist_Provider.g.dart';

@riverpod
Future<List<String>> getWishlistOf(GetWishlistOfRef ref, String email){
  return WishlistService().getWishlistOf(email);
}

@riverpod
Future<void> postWishlistOf(PostWishlistOfRef ref, String email, String wepname){
  return WishlistService().postWishlistOf(email, wepname);
}

@riverpod
Future<int> getValueOf(GetValueOfRef ref, String email, String wepname){
  return WishlistService().getValue(email, wepname);
}

class WishlistService {
  WishlistService._internal();

  static final WishlistService _instance =
      WishlistService._internal(); // Singleton instance

  factory WishlistService() {
    return _instance;
  }

  Future<List<String>> getWishlistOf(String email) async {
    email = email.replaceAll("@", "%40");
    var response = await http.get(Uri.parse(
        constants.endpoint + constants.endpointGetWishlistOf + email));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final guns = json.map<String>((e) {
        return e.toString();
      }).toList();

      return guns;
    } else {
      return [];
    }
  }

    Future<int> getValue(String email, String name) async {
    email = email.replaceAll("@", "%40");
    var response = await http.get(Uri.parse(
        constants.endpointGetValueOf(email, name)));

    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      final val = int.parse(json.toString());
      
      return val;
    } else {
      return 0;
    }
  }

  Future<void> postWishlistOf(String email, String name) async{
    var response = await http.get(Uri.parse(constants.endpointPostWishlistOf(email,name)));
    var _ = await jsonDecode(response.body);
  }
}
