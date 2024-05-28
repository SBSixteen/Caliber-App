// ignore_for_file: file_names
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DiscountedWeaponShopCard extends StatefulWidget {
  final Weapon weapon;
  const DiscountedWeaponShopCard({super.key, required this.weapon});

  @override
  State<StatefulWidget> createState() => _DiscountedWeaponShopCardState();
}

class _DiscountedWeaponShopCardState extends State<DiscountedWeaponShopCard> {
  @override
  Widget build(BuildContext context) {
    String makeURL = widget.weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = widget.weapon.WeaponName.replaceAll(" ", "%20");

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
                  builder: (context) => WeaponInquiry(weapon: widget.weapon)));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
              surfaceTintColor: constants.cardSurfaceTint,
              color: constants.cardBackground,
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
                        width: widget.weapon.WeaponTypeShort == "PST"
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
                            Transform.translate(
                              offset: const Offset(0, -3),
                              child: Text(
                                  constants.formatter
                                      .format(widget.weapon.WeaponPrice),
                                  style: const TextStyle(
                                      fontFamily: "Inter Bold",
                                      fontSize: 24,
                                      color:
                                          Color.fromARGB(255, 153, 153, 153))),
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
                                      widget.weapon.WeaponName,
                                      style: const TextStyle(
                                          fontFamily: "Inter Bold",
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 24, 24, 24)),
                                    ),
                                    Text(
                                      widget.weapon.WeaponOrigin,
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
        ),
      ),
    );
  }
}
