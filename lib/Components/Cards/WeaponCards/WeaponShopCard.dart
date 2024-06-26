// ignore_for_file: file_names
import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponShopCard extends ConsumerWidget {
  final Weapon weapon;
  const WeaponShopCard({super.key, required this.weapon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String makeURL = weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = weapon.WeaponName.replaceAll(" ", "%20");

    final wepStruct =
        ref.watch(GetDefaultWeaponPartsProvider(weapon.WeaponName));

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
                  builder: (context) => WeaponInquiry(weapon: weapon)));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
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
                            wepStruct.when(
                              data: (data) {
                                if (data.isEmpty) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                          offset: const Offset(0, -3),
                                          child: Text(
                                            constants.formatter.format(
                                                weapon.WeaponPrice *
                                                    weapon.WeaponDiscount),
                                            style: const TextStyle(
                                              fontFamily: "Inter Bold",
                                              fontSize: 24,
                                              color: Colors.grey,
                                            ),
                                          )),
                                    ],
                                  );
                                }

                                double sum = 0;

                                for (Attachment i in data) {
                                  sum += i.AttachmentPrice;
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(0, -3),
                                      child: Text(
                                        constants.formatter.format(sum),
                                        style: TextStyle(
                                            fontFamily: "Inter Bold",
                                            fontSize: 24,
                                            color: (sum < weapon.WeaponPrice)
                                                ? const Color.fromARGB(
                                                    255, 2, 107, 0)
                                                : Colors.red),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(0, -6),
                                      child: Text(
                                        constants.formatter
                                            .format(weapon.WeaponPrice * weapon.WeaponDiscount),
                                        style: const TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color.fromARGB(
                                                255, 153, 153, 153),
                                            color: Color.fromARGB(
                                                255, 153, 153, 153)),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              error: (error, stackTrace) {
                                return Text(
                                  "ERROR",
                                  style: constants.soft,
                                );
                              },
                              loading: () {
                                return constants.smolLoader;
                              },
                            ),
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
                                          fontFamily: "Inter Bold",
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 24, 24, 24)),
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
              )),
        ),
      ),
    );
  }
}
