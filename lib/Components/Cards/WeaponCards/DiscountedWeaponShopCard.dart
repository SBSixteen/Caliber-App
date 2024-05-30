// ignore_for_file: file_names
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscountedWeaponShopCard extends ConsumerWidget {
  final Weapon weapon;
  const DiscountedWeaponShopCard({super.key, required this.weapon});

  @override
    Widget build(BuildContext context, WidgetRef ref) {
    String makeURL = weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = weapon.WeaponName.replaceAll(" ", "%20");

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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    
                    return WeaponInquiry(weapon: weapon);
                  },));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
              surfaceTintColor: constants.cardSurfaceTint,
              color: constants.cardBackground,
              elevation: 24.0,
              child: Container(
                decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                  0.9,
                                  1.0
                                ])),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          constants.endpoint +
                              constants.endpointGetWeaponPicture +
                              weaponURL,
                          fit: BoxFit.fitWidth,
                          width: weapon.WeaponTypeShort == "PST"
                              ? MediaQuery.of(context).size.width * 0.65
                              : null,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weapon.WeaponTypeShort,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 153, 153, 153)),
                              ),
                              const Spacer(),
                              const Text(
                                "PKR ",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 153, 153, 153)),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -3),
                                child: Text(
                                    constants.formatter
                                        .format(weapon.WeaponPrice),
                                    style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 24,
                                        color:
                                            Colors.white)),
                              )
                            ],
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: Image.network(constants
                                                  .endpoint +
                                              constants
                                                  .endpointGetWeaponMakePicture +
                                              makeURL)),
                                      Text(
                                        weapon.WeaponName,
                                        style: const TextStyle(
                                            fontFamily: "Inter SemiBold",
                                            fontSize: 18,
                                            color:
                                                Colors.white),
                                      ),
                                      Text(
                                        weapon.WeaponOrigin,
                                        style: const TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 153, 153, 153)),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "CAL",
                                      style: TextStyle(
                                          fontFamily: "Inter SemiBold",
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 153, 153, 153)),
                                    ),
                                    Text(
                                      weapon.WeaponCaliber,
                                      style: const TextStyle(
                                          fontFamily: "Inter Bold",
                                          fontSize: 14,
                                          color: Colors.orange),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "ROF",
                                                style: TextStyle(
                                                    fontFamily: "Inter SemiBold",
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 153, 153, 153)),
                                              ),
                                              Text(
                                                "${weapon.rof} R/M",
                                                style: const TextStyle(
                                                    fontFamily: "Inter Bold",
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 153, 153, 153)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "WGT",
                                                style: TextStyle(
                                                    fontFamily: "Inter SemiBold",
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 153, 153, 153)),
                                              ),
                                              Text(
                                                "${weapon.WeaponWeight} KG",
                                                style: const TextStyle(
                                                    fontFamily: "Inter Bold",
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 153, 153, 153)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}