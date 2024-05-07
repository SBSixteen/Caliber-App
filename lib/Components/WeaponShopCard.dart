// ignore_for_file: file_names

import 'package:calibre/Model/Weapon.dart';
import 'package:flutter/material.dart';

class WeaponShopCard extends StatefulWidget {
  
  final Weapon weapon;
  const WeaponShopCard({ super.key, required this.weapon });

  @override
  State<StatefulWidget> createState() => _WeaponShopCardState();
}

class _WeaponShopCardState extends State<WeaponShopCard> {

  @override
  Widget build(BuildContext context) { 

    return Card(
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.network("https://localhost:7069/api/Test/GetWeaponImage?Name=AK-74M", width: MediaQuery.of(context).size.width*0.4,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("$widget.weapon.WeaponName", style: TextStyle(fontFamily: "Bender", fontSize: 24.0),),
                          Text("$widget.weapon.WeaponCaliber", style: TextStyle(fontFamily: "Bender", fontSize: 16.0),)

                        ],
                      ),
                    )
                  ],
                ),
              )
            ;
  }
}

