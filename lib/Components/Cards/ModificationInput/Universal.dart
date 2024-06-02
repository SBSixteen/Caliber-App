// ignore_for_file: must_be_immutable
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calibre/constants.dart';



class Universal extends ConsumerWidget {

  WidgetRef parentRef;
  String part;
  String weaponName;

  Universal(this.part, this.weaponName, this.parentRef, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var attc = ref.watch(
        getCompatibleWeaponPositionAttachmentsProvider(weaponName, part));

    return attc.when(
      data: (data) {
        return Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount: data.length,
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if(ref.read(weaponPreset.notifier).state.manifest.containsKey(part)){
                      ref.read(weaponPreset.notifier).state.manifest[part] = data[index];
                    }else{
                      ref.read(weaponPreset.notifier).state.manifest.putIfAbsent(part, () => data[index]);
                    }
                    ref.read(constants.inFocusAttachment.notifier).state = data[index];
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.network(
                        constants.endpointGetAttachmentPicture(
                            data[index].AttachmentName,
                            data[index].AttachmentPart),
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      data[index].AttachmentName,
                      style: constants.blacksubheadings,
                    ),
                    subtitle: Text(data[index].AttachmentPart),
                    trailing: Text(
                      "${data[index].AttachmentPrice}PKR",
                      style: constants.attachmentTilePrice,
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
      error: (error, stackTrace) {
        return constants.defaultError;
      },
      loading: () {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                constants.smolLoader,
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Loading Attachments",
                  style: constants.subtlebadnews,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
