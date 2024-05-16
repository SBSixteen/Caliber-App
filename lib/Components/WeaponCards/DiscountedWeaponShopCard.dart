// ignore_for_file: file_names
import 'dart:math';

import 'package:calibre/Model/Weapon.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';

class DiscountedWeaponShopCard extends StatefulWidget {
  final Weapon weapon;
  const DiscountedWeaponShopCard({super.key, required this.weapon});

  @override
  State<StatefulWidget> createState() => _DiscountedWeaponShopCardState();
}

class _DiscountedWeaponShopCardState extends State<DiscountedWeaponShopCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    String makeURL = widget.weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = widget.weapon.WeaponName.replaceAll(" ", "%20");
    int price = 192513;
    int newPrice = (192513.0 * (Random().nextDouble() * 0.5 + 0.8)).toInt();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          elevation: 24.0,
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
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.weapon.WeaponTypeShort,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              constants.formatter.format(newPrice),
                              style: TextStyle(
                                  fontFamily: "Inter Bold",
                                  fontSize: 24,
                                  color: (newPrice < price)
                                      ? const Color.fromARGB(255, 2, 107, 0)
                                      : Colors.red),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -4),
                              child: Text(
                                constants.formatter.format(price),
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Color.fromARGB(255, 153, 153, 153),
                                    color: Color.fromARGB(255, 153, 153, 153)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: Image.network(constants.endpoint +
                                        constants.endpointGetWeaponMakePicture +
                                        makeURL)),
                                Text(
                                  widget.weapon.WeaponName,
                                  style: const TextStyle(
                                      fontFamily: "Inter Bold",
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 24, 24, 24)),
                                ),
                                Text(
                                  widget.weapon.WeaponOrigin,
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 153, 153, 153)),
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
                                    color: Color.fromARGB(255, 153, 153, 153)),
                              ),
                              Text(
                                widget.weapon.WeaponCaliber,
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
                                          "${widget.weapon.rof} R/M",
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
                                          "${widget.weapon.WeaponWeight} KG",
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
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
