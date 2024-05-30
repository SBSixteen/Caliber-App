// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Other/BulletStats.dart';
import 'package:calibre/Model/Ammunition.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmmunitionShopCard extends ConsumerWidget {
  Ammunition ammo;

  AmmunitionShopCard(this.ammo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Animate(
      effects: [
        BlurEffect(
            begin: const Offset(100, 100),
            end: const Offset(0, 0),
            duration: 600.ms),
        MoveEffect(
            begin: const Offset(-128, 0),
            end: const Offset(0, 0),
            duration: 800.ms)
      ],
      child: Card(
        child: Container(
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
                    Color.fromARGB(255, 96, 96, 96),
                    Color.fromARGB(255, 64, 64, 64),
                    Color.fromARGB(255, 32, 32, 32),
                    Colors.black,
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.6,
                    0.66
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "${constants.endpoint}${constants.endpointGetAmmunitionPicture}${ammo.AmmunitionCaliber} ${ammo.AmmunitionVariant}"),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ammo.AmmunitionVariant,
                          style: constants.ammoheadings,
                        ),
                        BulletStats(ammo.AmmunitionPenn, ammo.AmmunitionFrag)
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: const Border(),
                  title: Text("Learn More", style: constants.benderWhite,),
                  children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text(
                        textAlign: TextAlign.right,
                        softWrap: false,
                        ammo.AmmunitionDescription,
                        maxLines: 24,
                        overflow: TextOverflow.ellipsis,
                        style: constants.benderWhiteSmall,
                      ),
                    ),
                  ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
