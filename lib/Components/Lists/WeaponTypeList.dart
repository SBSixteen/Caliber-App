import 'package:calibre/Components/Cards/WeaponCards/WeaponShopCard.dart';
import 'package:calibre/Provider/Weapon_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponTypeList extends ConsumerWidget{
  final String type;
  const WeaponTypeList({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weapons = ref.watch(GetWeaponsByTypeProvider(type));
    return weapons.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
              child: Text(
            "There are no weapons of this type!",
            style: constants.subtlebadnews,
          ));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 18.0,);
            },
              itemBuilder: (context, index) {
                // return data[index].WeaponDiscount != 1.0
                //     ? WeaponShopCard(weapon: data[index])
                //     : DiscountedWeaponShopCard(weapon: data[index]);
                return WeaponShopCard(weapon: data[index]);
              },
              itemCount: data.length);
        }
      },
      error: (error, stackTrace) {
        return Center(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Text(
                "Trouble connecting to Caliber Servers",
                style: constants.subtlebadnews,
              )),
        );
      },
      loading: () {
        return constants.bigLoader;
      },
    );
  }
}

// class _WeaponTypeListState extends State<WeaponTypeList>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: widget.type == ""
//           ? WeaponService.getWeapons()
//           : WeaponService.getWeaponsByType(widget.type),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.data!.isEmpty) {
//             return Center(
//                 child: Text(
//               "There are no weapons of this type!",
//               style: constants.subtlebadnews,
//             ));
//           }
//           return ListView.builder(
//               itemBuilder: (context, index) {
//                 return snapshot.data![index].WeaponDiscount != 1.0
//                     ? WeaponShopCard(weapon: snapshot.data![index])
//                     : DiscountedWeaponShopCard(weapon: snapshot.data![index]);
//               },
//               itemCount: snapshot.data!.length);
//         }
//         throw ArgumentError("Something is wrong");
//       },
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
