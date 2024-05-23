import 'package:calibre/Components/WeaponCards/DiscountedWeaponShopCard.dart';
import 'package:calibre/Components/WeaponCards/WeaponShopCard.dart';
import 'package:calibre/Services/WeaponService.dart';
import 'package:flutter/material.dart';

class WeaponTypeList extends StatefulWidget {
  final String type;
  const WeaponTypeList({required this.type});

  @override
  State<StatefulWidget> createState() => _WeaponTypeListState();
}

class _WeaponTypeListState extends State<WeaponTypeList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.type == ""
          ? WeaponService.getWeapons()
          : WeaponService.getWeaponsByType(widget.type),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              "There are no weapons of this type!",
              style: TextStyle(
                  fontFamily: "Inter Bold",
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 128, 128, 128)),
            ));
          }
          return ListView.builder(
              itemBuilder: (context, index) {
                return snapshot.data![index].WeaponDiscount != 1.0
                    ? WeaponShopCard(weapon: snapshot.data![index])
                    : DiscountedWeaponShopCard(weapon: snapshot.data![index]);
              },
              itemCount: snapshot.data!.length);
        }
        throw ArgumentError("Something is wrong");
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
