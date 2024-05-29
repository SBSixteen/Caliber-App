// ignore_for_file: file_names, must_be_immutable

import 'package:calibre/Components/Cards/ModificationInput/Dovetail.dart';
import 'package:calibre/Model/Attachment.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';

class WeaponInquiryAttachmentCard extends StatefulWidget{

  String heading;
  Attachment attc;

  WeaponInquiryAttachmentCard(this.heading, this.attc, {super.key});

  @override
  State<StatefulWidget> createState() => _WeaponInquiryAttachmentState();
  
}

class _WeaponInquiryAttachmentState extends State<WeaponInquiryAttachmentCard> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      widget.heading,
                      style: constants.headings,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*constants.weaponInquiryCardAttachment[widget.heading]!,
                            child: Image.network(
                              fit: BoxFit.contain,
                              constants.endpointGetAttachmentPicture(widget.attc.AttachmentName, widget.heading),
                          ),
                        )),
                        const Spacer()
                      ],
                    ),
                    Text(
                      widget.attc.AttachmentName,
                      style: constants.attachmentHeading,
                    ),
                    Text(
                      widget.attc.AttachmentDescription,
                      style: constants.soft,
                    ),
                    widget.attc.Attachment_DovetailMount != 0 ? 
                    Dovetail()
                    : const SizedBox.shrink()
                  ],
                ),
              ),
            );
  }
}