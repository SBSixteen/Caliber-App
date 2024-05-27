import 'package:calibre/Components/Lists/CompatibleAmmoList.dart';
import 'package:calibre/Components/Lists/CompatibleAttachmentList.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';

class WeaponInquiry extends StatefulWidget {
  final Weapon weapon;
  const WeaponInquiry({super.key, required this.weapon});

  @override
  State<StatefulWidget> createState() => _WeaponInquiryState();
}

class _WeaponInquiryState extends State<WeaponInquiry> {
  @override
  Widget build(BuildContext context) {
    //String makeURL = widget.weapon.WeaponMake.replaceAll(" ", "%20");
    String weaponURL = widget.weapon.WeaponName.replaceAll(" ", "%20");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.weapon.WeaponName,
          style: const TextStyle(fontFamily: "Inter Bold", color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                  Text(
                    widget.weapon.WeaponDescription,
                    style: constants.soft,
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
                      height: 04,
                    ),
                    CompatibleAmmoList(caliber: widget.weapon.WeaponCaliber),
                  ],
                ),
              ),
            ),
          ),
          CompatibleAttachmentList(weaponName: widget.weapon.WeaponName)
        ],
      ),
    );
  }
}
