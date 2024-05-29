// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison

import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<Attachment?> dovetailAttachmentProvider = StateProvider<Attachment?>((ref) => null);

class Dovetail extends ConsumerWidget {
  

  Dovetail({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selection = ref.watch(dovetailAttachmentProvider);

    return ExpansionTile(
      title: Text(
        "Modifications",
        style: constants.headings,
      ),
      shape: const Border(),
      tilePadding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "Dovetail Mount",
                  style: constants.attachmentHeading,
                ),
              ),
              selection == null ? Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 1)),
                        ),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Consumer(
                                    builder: (context, ref, child) {
                                      final dovetail = ref.watch(
                                          getDovetailAttachmentsProvider);
                                      return dovetail.when(
                                        data: (data) {
                                          return Column(
                                            children: [
                                              ListView.separated(
                                                separatorBuilder: (context, index) {
                                                  return Text("--------------------", style: constants.subtlebadnews,);
                                                },
                                                itemCount: data.length,
                                                padding: const EdgeInsets.all(10.0),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                      Navigator.pop(context);
                                                    },
                                                    child: ListTile(
                                                      leading: SizedBox(
                                                        width: 128,
                                                        height: 128,
                                                        child: Image.network(
                                                          constants.endpointGetAttachmentPicture(
                                                              data[index]
                                                                  .AttachmentName,
                                                              data[index]
                                                                  .AttachmentPart),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      title: Text(
                                                        data[index]
                                                            .AttachmentName,
                                                        style: constants
                                                            .blacksubheadings,
                                                      ),
                                                      subtitle: Text(data[index].AttachmentPart),
                                                      trailing: Text("${data[index].AttachmentPrice}PKR", style: constants.attachmentTilePrice,),
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
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  constants.smolLoader,
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    "Loading Dovetail Attachments",
                                                    style:
                                                        constants.subtlebadnews,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: const Icon(Icons.add, color: Colors.red))
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ) : SizedBox(
                            width: MediaQuery.of(context).size.width*constants.weaponInquiryCardAttachment[selection.AttachmentPart]!,
                            child: Image.network(
                              fit: BoxFit.contain,
                              constants.endpointGetAttachmentPicture(selection.AttachmentName, selection.AttachmentPart),
                          )
                ),
                
            ],
          ),
        ),
      ],
    );
  }
  
}

