// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison

import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';

class Dovetail extends ConsumerStatefulWidget {
  
  Attachment? dt;
  Dovetail(this.dt, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DovetailState();
  }
  
}

class _DovetailState extends ConsumerState<Dovetail> {

    @override
  Widget build(BuildContext context) {

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
                child: Row(
                  children: [
                    Text(
                      "Dovetail Mount",
                      style: constants.attachmentHeading,
                    ) ,
                    widget.dt != null ? const Spacer(): const SizedBox.shrink(),
                    widget.dt != null ? IconButton(onPressed: () {
                      setState(() {
                        constants.currentPreset.manifest.remove("Dovetail Mount");
                        constants.currentPreset.manifest.remove("Mount of Dovetail Mount");
                        widget.dt = null;
                      });
                      // ref.read(constants.weaponPreset.notifier).state.manifest.remove("Dovetail Mount");
                      // ref.read(constants.weaponPreset.notifier).state.manifest.remove("Mount of Dovetail Mount");
                      // ref.read(dovetailAttachmentProvider.notifier).state = null;
                    }, icon: const Icon(Icons.remove_circle, color: Colors.red,)) : const SizedBox.shrink()
                  ],
                ),
              ),
              widget.dt == null ? Row(
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
                                enableDrag: true,
                                showDragHandle: true,
                                isScrollControlled: true,
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
                                                  return Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Center(
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width*0.8,
                                                        height: 1,
                                                        color:  Colors.grey,
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
                                                      setState(() {
                                                        widget.dt = data[index];
                                                        constants.currentPreset.addAttachment("Dovetail Mount", data[index]);
                                                      });
                                                      // ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                      // ref.read(constants.weaponPreset.notifier).state.manifest.putIfAbsent("Dovetail Mount", () => ref.read(dovetailAttachmentProvider.notifier).state!);
                                                      Navigator.pop(context);
                                                    },
                                                    child: ListTile(
                                                      leading: SizedBox(
                                                        width: 64,
                                                        height: 64,
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
              ) : 
              Row(
                children: [
                  SizedBox(
                                width: MediaQuery.of(context).size.width*constants.weaponInquiryCardAttachment[widget.dt!.AttachmentPart]!,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  constants.endpointGetAttachmentPicture(widget.dt!.AttachmentName, widget.dt!.AttachmentPart),
                              ),
                    ),

                ],
              ),
                
            ],
          ),
        ),
      ],
    );
  }
  
}