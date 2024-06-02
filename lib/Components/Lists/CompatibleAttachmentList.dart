// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Cards/AttachmentCards/WeaponInquiryAttachmentCard.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Provider/WeaponStructure_Provider.dart';
import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompatibleAttachmentList extends ConsumerWidget {
  
  String weaponName;
  CompatibleAttachmentList({super.key, required this.weaponName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final weaponStructure = ref.watch(getDefaultWeaponStructureOfProvider(weaponName));
    return weaponStructure.when(
      data: (wepStruct) {
        constants.currentPreset = wepStruct;
        final positions = ref.watch(getWeaponAttachmentPositionsProvider(weaponName));
        return positions.when(
          data: (data) {
            if (data.isEmpty) {
              return const Center();
            } else {
              return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final compatibleCount = ref.watch(getCountCompatibleWeaponPositionAttachmentsProvider(weaponName, data[index]));
                    return compatibleCount.when(data: (count) {
                      if (constants.currentPreset.manifest.containsKey(data[index])) {
                      return WeaponInquiryAttachmentCard(
                          data[index], weaponName, constants.currentPreset.manifest[data[index]]!, count);
                    }else{
                      return const SizedBox.shrink();
                    }
                    }, error: (error, stackTrace) {
                      return WeaponInquiryAttachmentCard(
                          data[index], weaponName,constants.currentPreset.manifest[data[index]]!, 0);
                    }, loading: () {
                      return const Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator(color: Colors.red,),);
                    },);
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
      },
      error: (error, stacktrace) {
        return constants.defaultError;
      },
      loading: () {
        return constants.bigLoader;
      },
    );
  }
}

// class _CompatibleAttachmentList extends State<CompatibleAttachmentList> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: WeaponStructureService.getWeaponStructureOf(widget.weaponName),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Container(
//             height: 140,
//             width: 20,
//             color: Colors.red,
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Colors.red,
//             ),
//           );
//         }
//         return ListView.builder(
//           physics: const ScrollPhysics(),
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 surfaceTintColor: Colors.transparent,
//                 color: Colors.white,
//                 elevation: 24.0,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         snapshot.data![index],
//                         style: constants.headings,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width*0.85,
//                           child: Image.network(constants.endpointGetAttachmentPicture(widget.weaponName, snapshot.data![index])),
//                         ),
//                       ),
//                       Text(
//                         snapshot.data![index],
//                         style: constants.attachmentHeading,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           itemCount: snapshot.data!.length,
//         );
//       },
//     );
//   }
// }
