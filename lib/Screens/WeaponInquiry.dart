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
                  print(ref.watch(constants.weaponPreset.notifier).state.manifest);
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
          ],
        ),
      ),
    );
  }

}


