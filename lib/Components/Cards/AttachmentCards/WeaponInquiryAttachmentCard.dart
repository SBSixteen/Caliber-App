// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Cards/ModificationInput/Dovetail.dart';
import 'package:calibre/Components/Cards/ModificationInput/Rails.dart';
import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeaponInquiryAttachmentCard extends ConsumerStatefulWidget {
  String heading;
  String weaponName;
  Attachment attc;
  int compatibleCount;

  WeaponInquiryAttachmentCard(
      this.heading, this.weaponName, this.attc, this.compatibleCount,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WeaponInquiryAttachmentCardState();
  }
}

class _WeaponInquiryAttachmentCardState
    extends ConsumerState<WeaponInquiryAttachmentCard> {
  @override
  Widget build(BuildContext context) {
    var railCount = widget.attc.AttachmentPiccatiny_Bottom +
        widget.attc.AttachmentPiccatiny_Top +
        widget.attc.AttachmentPiccatiny_Left +
        widget.attc.AttachmentPiccatiny_Right;

    return Card(
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      elevation: 24.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.heading,
                    style: constants.headings,
                  ),
                  widget.compatibleCount != 0
                      ? const Spacer()
                      : const SizedBox.shrink(),
                  widget.compatibleCount != 0
                      ? TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              enableDrag: true,
                              showDragHandle: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Consumer(
                                  builder: (context, ref, child) {
                                    var attachments = ref.watch(
                                        getCompatibleWeaponPositionAttachmentsProvider(
                                            widget.weaponName, widget.heading));
                                    return attachments.when(
                                      data: (data) {
                                        return Column(
                                          children: [
                                            ListView.separated(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      widget.attc = data[index];
                                                      setState(() {
                                                        if (constants
                                                            .currentPreset
                                                            .manifest
                                                            .containsKey(
                                                                widget.heading)) {
                                                          constants.currentPreset
                                                                      .manifest[
                                                                  widget
                                                                      .heading] =
                                                              data[index];
                                                        } else {
                                                          constants.currentPreset
                                                              .addAttachment(
                                                                  widget.heading,
                                                                  data[index]);
                                                        }
          
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      });
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
                                                      subtitle: Text(data[index]
                                                          .AttachmentPart),
                                                      trailing: Text(
                                                        "${data[index].AttachmentPrice}PKR",
                                                        style: constants
                                                            .attachmentTilePrice,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Center(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                        height: 1,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: data.length)
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
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                            "CHANGE",
                            style: constants.textButton,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            constants
                                .weaponInquiryCardAttachment[widget.heading]!,
                        child: Image.network(
                          fit: BoxFit.contain,
                          constants.endpointGetAttachmentPicture(
                              widget.attc.AttachmentName, widget.heading),
                        ),
                      )),
                  const Spacer()
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.attc.AttachmentName,
                    style: constants.attachmentHeading,
                  ),
                  Spacer(),
                  Text(
                    "${widget.attc.AttachmentPrice} PKR",
                    style: constants.attachmentTilePrice,
                  ),
                ],
              ),
              Text(
                widget.attc.AttachmentDescription,
                style: constants.soft,
              ),
              widget.attc.Attachment_DovetailMount != 0
                  ? Dovetail(null)
                  : const SizedBox.shrink(),
              railCount > 0 ? Rails(widget.attc) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
