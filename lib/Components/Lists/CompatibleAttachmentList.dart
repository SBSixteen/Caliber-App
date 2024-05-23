// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Services/WeaponStructureService.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';

class CompatibleAttachmentList extends StatefulWidget {
  String weaponName;

  CompatibleAttachmentList({super.key, required this.weaponName});

  State<StatefulWidget> createState() => _CompatibleAttachmentList();
}

class _CompatibleAttachmentList extends State<CompatibleAttachmentList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeaponStructureService.getWeaponStructureOf(widget.weaponName),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            height: 140,
            width: 20,
            color: Colors.red,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.transparent,
                color: Colors.white,
                elevation: 24.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index],
                        style: constants.headings,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}
