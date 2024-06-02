import 'package:calibre/Components/BottomNavBar/BottomNavBar.dart';
import 'package:calibre/Components/Lists/WeaponTypeList.dart';
import 'package:calibre/Screens/SignInScreen.dart';
import 'package:calibre/Screens/WeaponShopScreen.dart';
import 'package:calibre/Screens/AmmoShopScreen.dart';
import 'package:calibre/constants.dart';
import 'package:calibre/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      setState(() {
        constants.someUser = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: constants.appBrightness,
      ),
      home: constants.someUser == null ? SignInScreen() : WeaponShopScreen(),
    );
  }
}
