// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Cards/ModificationInput/Dovetail.dart';
import 'package:calibre/Components/Cards/ModificationInput/Universal.dart';
import 'package:calibre/Model/Attachment.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponInquiryAttachmentCard extends ConsumerWidget{
  String heading;
  String weaponName;
  Attachment attc;
  int compatibleCount;

  WeaponInquiryAttachmentCard(this.heading, this.weaponName, this.attc, this.compatibleCount, {super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print("$attc, $heading, $weaponName, $compatibleCount");
    return Card(
              surfaceTintColor: Colors.transparent,
              color: Colors.white,
              elevation: 24.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          heading,
                          style: constants.headings,
                        ),
                        compatibleCount != 0 ? const Spacer() : const SizedBox.shrink(),
                        compatibleCount != 0 ? TextButton(onPressed: (){
                          showModalBottomSheet(context: context, builder: (context) {
                            ref.watch(constants.weaponPreset);
                            return Universal(heading, weaponName, ref);
                          },);
                        }, child: Text("CHANGE", style: constants.textButton,), ) : const SizedBox.shrink(),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*constants.weaponInquiryCardAttachment[heading]!,
                            child: Image.network(
                              fit: BoxFit.contain,
                              constants.endpointGetAttachmentPicture(attc.AttachmentName, heading),
                          ),
                        )),
                        const Spacer()
                      ],
                    ),
                    Text(
                      attc.AttachmentName,
                      style: constants.attachmentHeading,
                    ),
                    Text(
                      attc.AttachmentDescription,
                      style: constants.soft,
                    ),
                    attc.Attachment_DovetailMount != 0 ? 
                    Dovetail()
                    : const SizedBox.shrink()
                  ],
                ),
              ),
            );
  }
}