// ignore: file_names
import 'package:calibre/Components/Lists/AccountsList.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponBilling extends ConsumerWidget{
  const WeaponBilling({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final attachments = constants.currentPreset.manifest.keys.toList();

    double sum = 0;

    for(String i in attachments){
      sum += constants.currentPreset.manifest[i]!.AttachmentPrice;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Billing", style:TextStyle(fontFamily: "Inter", color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.chevron_left, color: Colors.white,)),
      ),
      body: Column(
        children: [
          AccountsList(),
          Text("$sum PKR", style: constants.attachmentTilePrice,),
          InkWell(
                        onTap: () {
                          constants.weaponCart.add(constants.currentPreset);
                          Navigator.pop(context);
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
                                      "Confirm",
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
                      )
        ],
      ),
    );
  }
  
}