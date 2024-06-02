// ignore_for_file: must_be_immutable

import 'package:calibre/Components/Cards/AmmoCards/AmmunitionShopCard.dart';
import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmmunitionTypeList extends ConsumerWidget {
  String query;

  AmmunitionTypeList(this.query, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ammo = ref.watch(GetAmmunitionByCaliberProvider(query));

    return ammo.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
              child: Text(
            "There is no ammunition of this type!",
            style: constants.subtlebadnews,
          ));
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return AmmunitionShopCard(data[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 18.0,
                );
              },
              itemCount: data.length);
        }
      },
      error: (error, stackTrace) {
        return constants.defaultError;
      },
      loading: () {
        return constants.bigLoader;
      },
    );
  }
}
