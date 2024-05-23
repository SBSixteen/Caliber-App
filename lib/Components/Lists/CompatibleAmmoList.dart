// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:calibre/Components/Other/ColorBar.dart';
import 'package:calibre/constants.dart';
import 'package:calibre/Services/AmmunitionService.dart';
import 'package:flutter/material.dart';

class CompatibleAmmoList extends StatefulWidget {
  String caliber;
  CompatibleAmmoList({super.key, required this.caliber});
  @override
  State<StatefulWidget> createState() => _CompatibleAmmoList();
}

class _CompatibleAmmoList extends State<CompatibleAmmoList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AmmunitionService.getAmmunitionByCaliber(widget.caliber),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isEmpty) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "No Compatible Ammunition Found",
                style: constants.subtlebadnews,
              ),
            ));
          }
          return Center(
            child: SizedBox(
              height: 128,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var k =
                      "${snapshot.data![index].AmmunitionCaliber} ${snapshot.data![index].AmmunitionVariant}";
                  k = k.replaceAll(" ", "%20");
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 256,
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
                                  0.9,
                                  1.0
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.network(constants.endpoint +
                                  constants.endpointGetAmmunitionPicture +
                                  k),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                child: Text(
                                  snapshot.data![index].AmmunitionVariant,
                                  style: constants.ammunitionVariant,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Penetration",
                                      style: constants.ammunitionVariant,
                                    ),
                                    ColorBar(),
                                    Row(
                                      children: [
                                        SizedBox(width: ((snapshot.data![index].AmmunitionPenn > 60 ? 60 : snapshot.data![index].AmmunitionPenn)/60)*100 + 14,),
                                        const Icon(Icons.arrow_drop_up_outlined, size: 8.0, color:  Colors.white,)
                                      ],
                                    ),
                                    Text(
                                      "Stopping Power",
                                      style: constants.ammunitionVariant,
                                    ),
                                    ColorBar(),
                                    Row(
                                      children: [
                                        SizedBox(width: ((snapshot.data![index].AmmunitionFrag > 100 ? 100 : snapshot.data![index].AmmunitionFrag)/100)*100 + 14,),
                                        const Icon(Icons.arrow_drop_up_outlined, size: 8.0, color:  Colors.white,)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          );
        } else {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "No Compatible Ammunition Found",
              style: constants.subtlebadnews,
            ),
          ));
        }
      },
    );
  }
}
