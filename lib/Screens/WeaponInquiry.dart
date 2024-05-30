import 'package:calibre/Components/Lists/CompatibleAmmoList.dart';
import 'package:calibre/Components/Lists/CompatibleAttachmentList.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponInquiry extends ConsumerWidget {
  final Weapon weapon;
  const WeaponInquiry({super.key, required this.weapon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //String makeURL = weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = weapon.WeaponName.replaceAll(" ", "%20");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          weapon.WeaponName,
          style: const TextStyle(fontFamily: "Inter Bold", color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print(
                    ref.watch(constants.weaponPreset.notifier).state.manifest);
              },
              icon: const Icon(Icons.chevron_left)),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(constants.endpoint +
                  constants.endpointGetWeaponPicture +
                  weaponURL),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: constants.headings,
                    ),
                    const SizedBox(
                      height: 04,
                    ),
                    Animate(
                      effects: [
                        FadeEffect(begin: 0.0, end: 1.0, duration: 600.ms)
                      ],
                      child: Text(
                        weapon.WeaponDescription,
                        style: constants.soft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.transparent,
                color: Colors.white,
                elevation: 24.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Compatible Ammunition",
                        style: constants.headings,
                      ),
                      const SizedBox(
                        height: 04,
                      ),
                      CompatibleAmmoList(caliber: weapon.WeaponCaliber),
                    ],
                  ),
                ),
              ),
            ),
            CompatibleAttachmentList(weaponName: weapon.WeaponName),
            InkWell(
              onTap: (){
                ref.read(constants.cart.notifier).state.add(ref.read(constants.weaponPreset));
                print(  ref.read(constants.cart.notifier).state);
              },
              child :Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            spreadRadius: -5,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 116, 58, 58),
                              Color.fromARGB(255, 179, 65, 65),
                              Color.fromARGB(255, 184, 16, 16),
                              Colors.red,
                            ],
                            stops: [
                              0.1,
                              0.3,
                              0.9,
                              1.0
                            ])),
                  child: const Padding(padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text("Add to Cart",style: TextStyle(fontFamily: "Inter SemiBold", fontSize: 20.0, color: Colors.white),),
                      Spacer()
                    ],
                  ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
