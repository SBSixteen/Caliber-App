// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Lists/CompatibleAmmoList.dart';
import 'package:calibre/Components/Lists/CompatibleAttachmentList.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Model/WeaponStructure.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Provider/Wishlist_Provider.dart';
import 'package:calibre/Screens/WeaponBilling.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<WeaponStructure> weaponPreset =
    StateProvider<WeaponStructure>((ref) => WeaponStructure());


class WeaponInquiry extends ConsumerStatefulWidget {
  final Weapon weapon;

  WeaponInquiry({super.key, required this.weapon});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WeaponInquiryState();
  }
}

class _WeaponInquiryState extends ConsumerState<WeaponInquiry> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    print("$toggle at start");

    String weaponURL = widget.weapon.WeaponName.replaceAll(" ", "%20");
    final count =
        ref.watch(GetDefaultWeaponPartsCountProvider(widget.weapon.WeaponName));

    var isWishlist = ref.watch(GetValueOfProvider(
        constants.someUser!.email!, widget.weapon.WeaponName));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.weapon.WeaponName,
          style: const TextStyle(fontFamily: "Inter Bold", color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          isWishlist.when(data: (data) {
            if (data == 1) {
              return IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ));
            } else {
              return IconButton(
                icon: !toggle
                    ? Icon(Icons.favorite_border, color: Colors.black)
                    : Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                onPressed: () {
                  setState(() {
                    if(!toggle){
                      ref.watch(PostWishlistOfProvider(constants.someUser!.email!, widget.weapon.WeaponName));
                    }
                    toggle = true;
                  });
                },
              );
            }
          }, error: (error, stackTrace) {
            return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.signal_wifi_off_rounded,
                  color: Colors.red,
                ));
          }, loading: () {
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          }),
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
                        widget.weapon.WeaponDescription,
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
                        height: 4,
                      ),
                      CompatibleAmmoList(caliber: widget.weapon.WeaponCaliber),
                    ],
                  ),
                ),
              ),
            ),
            CompatibleAttachmentList(weaponName: widget.weapon.WeaponName),
            count.when(
              data: (data) {
                return data == 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Weapon has no default parts, hence cannot be purchased",
                          style: constants.subtlebadnews,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return WeaponBilling();
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
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
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          fontFamily: "Inter SemiBold",
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              )),
                        ),
                      );
              },
              error: (error, stackTrace) {
                return constants.defaultError;
              },
              loading: () {
                return constants.bigLoader;
              },
            ),
          ],
        ),
      ),
    );
  }
}
