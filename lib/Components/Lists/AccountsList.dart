import 'package:calibre/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountsList extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final attachments = constants.currentPreset.manifest.keys.toList();
    final structure = constants.currentPreset.manifest;
    return SizedBox(
      child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: attachments.length,
                itemBuilder: (context, j) {
                  return ListTile(
                    trailing: Text(
                      "${constants.formatter.format(structure[attachments[j]]!.AttachmentPrice)} PKR",
                      style: constants.attachmentTilePrice,
                    ),
                    title: Text(structure[attachments[j]]!.AttachmentName,
                        style: constants.attachmentHeading),
                    subtitle: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
              ),
    ) ;
  }
  
}