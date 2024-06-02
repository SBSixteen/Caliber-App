// ignore_for_file: use_key_in_widget_constructors
import 'package:calibre/Components/BottomNavBar/BottomNavBar.dart';
import 'package:calibre/Components/Lists/AmmunitionTypeList.dart';
import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmmoShopScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final calibers = ref.watch(getCalibersProvider);

    return calibers.when(data: (data) {
      return DefaultTabController(
        length: data.length,
        initialIndex: constants.currentammoindex,
        child: Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,

          centerTitle: true,
          title: const Text(
            "Ammunition",
            style: TextStyle(fontFamily: "Inter", color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: <Color>[
                  Color.fromARGB(255, 110, 7, 0),
                  Color.fromARGB(255, 255, 128, 128)
                ])),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pop(context);
              constants.currentnavpage = "Weapons";
              FirebaseAuth.instance.signOut();
              constants.someUser = null;
            }, icon: const Icon(Icons.exit_to_app)),
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(
                fontFamily: "Inter SemiBold", color: Colors.white),
            unselectedLabelStyle: const TextStyle(
                fontFamily: "Inter SemiBold",
                color: Color.fromARGB(255, 128, 128, 128)),
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: data.map((e) => Tab(
              child: Text(e , style: const TextStyle(fontFamily: "Bender"),),
            )).toList(),
            onTap: (value) {
              constants.currentammoindex = value;
            },
          ),
          surfaceTintColor: Colors.red,
        ),
        body: Column(
          children: [
            Flexible(child: TabBarView(
              children: data.map((e) => AmmunitionTypeList(e)).toList()
            ),
            ),
            BottomNavBar()
          ],
        ),
        )
      );
    }, error: (error, stackTrace) {
      return constants.defaultError;
    }, loading: () {
      return constants.bigLoader;
    },);
  }
}