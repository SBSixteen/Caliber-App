// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calibre/Components/Cards/WeaponCards/WeaponShopCard.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/Screens/WeaponShopScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calibre/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() async{

  testWidgets("Test Ammo Shop Card", (widgetTester) async {

    await widgetTester.pumpWidget(WeaponShopCard(weapon: ));
  });
  

}
