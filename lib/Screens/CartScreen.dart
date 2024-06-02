// ignore_for_file: file_names, non_constant_identifier_names

import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var ammo_names = constants.ammoCart.keys.toList();

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
        title: const Text(
          "Cart",
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
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text(
              "Ammunition",
              style: constants.blacksubheadings,
            ),
            initiallyExpanded: true,
            children: [
              constants.ammoCart.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var k = ammo_names[index].split("-#-");
                        var ammo = ref.watch(GetAmmunitionProvider(k[0], k[1]));
                        return ListTile(
                            leading: SizedBox(
                              width: MediaQuery.of(context).size.height * 0.10,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.network(
                                constants.endpoint +
                                    constants.endpointGetAmmunitionPicture +
                                    ammo_names[index].replaceAll("-#-", " "),
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(
                              ammo_names[index].replaceAll("-#-", " "),
                              style: constants.blacksubheadings,
                            ),
                            subtitle: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Quantity: ${constants.ammoCart[ammo_names[index]]} Rounds",
                                    style: constants.soft,
                                  ),
                                  ammo.when(
                                    data: (data) {
                                      return Text(
                                        "${constants.formatter.format(constants.ammoCart[ammo_names[index]]! * data.AmmunitionPrice)} PKR",
                                        style: constants.attachmentTilePrice,
                                      );
                                    },
                                    error: (error, stackTrace) {
                                      return const CircularProgressIndicator(
                                        color: Colors.red,
                                      );
                                    },
                                    loading: () {
                                      return const CircularProgressIndicator(
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    constants.ammoCart
                                        .remove(ammo_names[index]);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )));
                      },
                      itemCount: ammo_names.length)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Items in Cart",
                        style: constants.subtlebadnews,
                      ),
                    )
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              "Weapons",
              style: constants.blacksubheadings,
            ),
            children: [
              constants.weaponCart.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var attachments =
                            constants.weaponCart[index].manifest.keys.toList();
                        var structure = constants.weaponCart[index].manifest;
                        return ExpansionTile(
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  constants.weaponCart.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          title: Row(
                            children: [
                              SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: Image.network(constants.endpoint +
                                      constants.endpointGetWeaponPicture +
                                      constants.weaponCart[index].weapon!
                                          .WeaponName)),
                              Text(
                                constants.weaponCart[index].weapon!.WeaponName,
                                style: constants.attachmentHeading,
                              ),
                            ],
                          ),
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: attachments.length,
                              itemBuilder: (context, j) {
                                return ListTile(
                                  trailing: Text(
                                    "${constants.formatter.format(structure[attachments[j]]!.AttachmentPrice)} PKR",
                                    style: constants.attachmentTilePrice,
                                  ),
                                  title: Text(
                                      structure[attachments[j]]!.AttachmentName,
                                      style: constants.attachmentHeading),
                                  subtitle: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          attachments[j],
                                          style: constants.soft,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      },
                      itemCount: constants.weaponCart.length)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Weapons in Cart",
                        style: constants.subtlebadnews,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
