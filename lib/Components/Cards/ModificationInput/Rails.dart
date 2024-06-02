// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison

import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Provider/Attachment_Provider.dart';
import 'package:calibre/Screens/WeaponInquiry.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Rails extends ConsumerStatefulWidget {
  Attachment platform;
  Attachment? top;
  Attachment? bottom;
  Attachment? left;
  Attachment? right;
  Rails(this.platform, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RailsState();
  }
}

class _RailsState extends ConsumerState<Rails> {
  @override
  Widget build(BuildContext context) {
    print(widget.platform.AttachmentPiccatiny_Bottom);

    return ExpansionTile(
      title: Text(
        "Modifications",
        style: constants.headings,
      ),
      shape: const Border(),
      tilePadding: const EdgeInsets.all(0),
      children: [
        widget.platform.AttachmentPiccatiny_Top > 0
            ? SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "Top Rail",
                            style: constants.attachmentHeading,
                          ),
                          widget.top != null
                              ? const Spacer()
                              : const SizedBox.shrink(),
                          widget.top != null
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      constants.currentPreset.manifest.remove(
                                          "${widget.platform.AttachmentPart} Top Rail");
                                      ref
                                          .read(weaponPreset.notifier)
                                          .state = constants.currentPreset;

                                      widget.top = null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ))
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    widget.top == null
                        ? Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 1)),
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
                                                      getMountableAttachmentsProvider);
                                                  return dovetail.when(
                                                    data: (data) {
                                                      return Column(
                                                        children: [
                                                          ListView.separated(
                                                            separatorBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: 1,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            itemCount:
                                                                data.length,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    widget.top =
                                                                        data[
                                                                            index];
                                                                    constants
                                                                        .currentPreset
                                                                        .addAttachment(
                                                                            "${widget.platform.AttachmentPart} Top Rail",
                                                                            data[index]);
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;

                                                                  });
                                                                  // ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                                  // ref.read(weaponPreset.notifier).state.manifest.putIfAbsent("Dovetail Mount", () => ref.read(dovetailAttachmentProvider.notifier).state!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      SizedBox(
                                                                    width: 64,
                                                                    height: 64,
                                                                    child: Image
                                                                        .network(
                                                                      constants.endpointGetAttachmentPicture(
                                                                          data[index]
                                                                              .AttachmentName,
                                                                          data[index]
                                                                              .AttachmentPart),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    data[index]
                                                                        .AttachmentName,
                                                                    style: constants
                                                                        .blacksubheadings,
                                                                  ),
                                                                  subtitle: Text(
                                                                      data[index]
                                                                          .AttachmentPart),
                                                                  trailing:
                                                                      Text(
                                                                    "${data[index].AttachmentPrice}PKR",
                                                                    style: constants
                                                                        .attachmentTilePrice,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    error: (error, stackTrace) {
                                                      return constants
                                                          .defaultError;
                                                    },
                                                    loading: () {
                                                      return Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Column(
                                                            children: [
                                                              constants
                                                                  .smolLoader,
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Text(
                                                                "Loading Rail-Compatible Attachments",
                                                                style: constants
                                                                    .subtlebadnews,
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
                                        child: const Icon(Icons.add,
                                            color: Colors.red))
                                  ],
                                ),
                              ),
                              const Spacer()
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    constants.weaponInquiryCardAttachment[
                                        widget.top!.AttachmentPart]!,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  constants.endpointGetAttachmentPicture(
                                      widget.top!.AttachmentName,
                                      widget.top!.AttachmentPart),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.platform.AttachmentPiccatiny_Left > 0
            ? SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "Left Rail",
                            style: constants.attachmentHeading,
                          ),
                          widget.left != null
                              ? const Spacer()
                              : const SizedBox.shrink(),
                          widget.left != null
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      constants.currentPreset.manifest.remove(
                                          "${widget.platform.AttachmentPart} Left Rail");
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;

                                      widget.top = null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ))
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    widget.left == null
                        ? Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 1)),
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
                                                      getMountableAttachmentsProvider);
                                                  return dovetail.when(
                                                    data: (data) {
                                                      return Column(
                                                        children: [
                                                          ListView.separated(
                                                            separatorBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: 1,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            itemCount:
                                                                data.length,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    widget.left =
                                                                        data[
                                                                            index];
                                                                    constants
                                                                        .currentPreset
                                                                        .addAttachment(
                                                                            "${widget.platform.AttachmentPart} Left Rail",
                                                                            data[index]);
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;

                                                                  });
                                                                  // ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                                  // ref.read(weaponPreset.notifier).state.manifest.putIfAbsent("Dovetail Mount", () => ref.read(dovetailAttachmentProvider.notifier).state!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      SizedBox(
                                                                    width: 64,
                                                                    height: 64,
                                                                    child: Image
                                                                        .network(
                                                                      constants.endpointGetAttachmentPicture(
                                                                          data[index]
                                                                              .AttachmentName,
                                                                          data[index]
                                                                              .AttachmentPart),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    data[index]
                                                                        .AttachmentName,
                                                                    style: constants
                                                                        .blacksubheadings,
                                                                  ),
                                                                  subtitle: Text(
                                                                      data[index]
                                                                          .AttachmentPart),
                                                                  trailing:
                                                                      Text(
                                                                    "${data[index].AttachmentPrice}PKR",
                                                                    style: constants
                                                                        .attachmentTilePrice,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    error: (error, stackTrace) {
                                                      return constants
                                                          .defaultError;
                                                    },
                                                    loading: () {
                                                      return Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Column(
                                                            children: [
                                                              constants
                                                                  .smolLoader,
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Text(
                                                                "Loading Rail-Compatible Attachments",
                                                                style: constants
                                                                    .subtlebadnews,
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
                                        child: const Icon(Icons.add,
                                            color: Colors.red))
                                  ],
                                ),
                              ),
                              const Spacer()
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    constants.weaponInquiryCardAttachment[
                                        widget.left!.AttachmentPart]!,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  constants.endpointGetAttachmentPicture(
                                      widget.left!.AttachmentName,
                                      widget.left!.AttachmentPart),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.platform.AttachmentPiccatiny_Bottom > 0
            ? SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "Bottom Rail",
                            style: constants.attachmentHeading,
                          ),
                          widget.bottom != null
                              ? const Spacer()
                              : const SizedBox.shrink(),
                          widget.bottom != null
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      constants.currentPreset.manifest.remove(
                                          "${widget.platform.AttachmentPart} Bottom Rail");
                                      widget.bottom = null;
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;

                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ))
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    widget.bottom == null
                        ? Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 1)),
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
                                                      getMountableAttachmentsProvider);
                                                  return dovetail.when(
                                                    data: (data) {
                                                      return Column(
                                                        children: [
                                                          ListView.separated(
                                                            separatorBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: 1,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            itemCount:
                                                                data.length,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    widget.bottom =
                                                                        data[
                                                                            index];
                                                                    constants
                                                                        .currentPreset
                                                                        .addAttachment(
                                                                            "${widget.platform.AttachmentPart} Bottom Rail",
                                                                            data[index]);
                                                                  });
                                                                  // ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                                  // ref.read(weaponPreset.notifier).state.manifest.putIfAbsent("Dovetail Mount", () => ref.read(dovetailAttachmentProvider.notifier).state!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      SizedBox(
                                                                    width: 64,
                                                                    height: 64,
                                                                    child: Image
                                                                        .network(
                                                                      constants.endpointGetAttachmentPicture(
                                                                          data[index]
                                                                              .AttachmentName,
                                                                          data[index]
                                                                              .AttachmentPart),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    data[index]
                                                                        .AttachmentName,
                                                                    style: constants
                                                                        .blacksubheadings,
                                                                  ),
                                                                  subtitle: Text(
                                                                      data[index]
                                                                          .AttachmentPart),
                                                                  trailing:
                                                                      Text(
                                                                    "${data[index].AttachmentPrice}PKR",
                                                                    style: constants
                                                                        .attachmentTilePrice,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    error: (error, stackTrace) {
                                                      return constants
                                                          .defaultError;
                                                    },
                                                    loading: () {
                                                      return Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Column(
                                                            children: [
                                                              constants
                                                                  .smolLoader,
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Text(
                                                                "Loading Rail-Compatible Attachments",
                                                                style: constants
                                                                    .subtlebadnews,
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
                                        child: const Icon(Icons.add,
                                            color: Colors.red))
                                  ],
                                ),
                              ),
                              const Spacer()
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    constants.weaponInquiryCardAttachment[
                                        widget.bottom!.AttachmentPart]!,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  constants.endpointGetAttachmentPicture(
                                      widget.bottom!.AttachmentName,
                                      widget.bottom!.AttachmentPart),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.platform.AttachmentPiccatiny_Right > 0
            ? SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "Right Rail",
                            style: constants.attachmentHeading,
                          ),
                          widget.right != null
                              ? const Spacer()
                              : const SizedBox.shrink(),
                          widget.right != null
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      constants.currentPreset.manifest.remove(
                                          "${widget.platform.AttachmentPart} Right Rail");
                                      widget.right = null;
                                                        ref.read(weaponPreset.notifier).state = constants.currentPreset;

                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ))
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    widget.right == null
                        ? Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 1)),
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
                                                      getMountableAttachmentsProvider);
                                                  return dovetail.when(
                                                    data: (data) {
                                                      return Column(
                                                        children: [
                                                          ListView.separated(
                                                            separatorBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: 1,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            itemCount:
                                                                data.length,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    widget.right =
                                                                        data[
                                                                            index];
                                                                    constants
                                                                        .currentPreset
                                                                        .addAttachment(
                                                                            "${widget.platform.AttachmentPart} Right Rail",
                                                                            data[index]);
                                                                    ref
                                                                        .read(weaponPreset
                                                                            .notifier)
                                                                        .state = constants.currentPreset;
                                                                  });
                                                                  // ref.read(dovetailAttachmentProvider.notifier).state = data[index];
                                                                  // ref.read(weaponPreset.notifier).state.manifest.putIfAbsent("Dovetail Mount", () => ref.read(dovetailAttachmentProvider.notifier).state!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: ListTile(
                                                                  leading:
                                                                      SizedBox(
                                                                    width: 64,
                                                                    height: 64,
                                                                    child: Image
                                                                        .network(
                                                                      constants.endpointGetAttachmentPicture(
                                                                          data[index]
                                                                              .AttachmentName,
                                                                          data[index]
                                                                              .AttachmentPart),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  title: Text(
                                                                    data[index]
                                                                        .AttachmentName,
                                                                    style: constants
                                                                        .blacksubheadings,
                                                                  ),
                                                                  subtitle: Text(
                                                                      data[index]
                                                                          .AttachmentPart),
                                                                  trailing:
                                                                      Text(
                                                                    "${data[index].AttachmentPrice}PKR",
                                                                    style: constants
                                                                        .attachmentTilePrice,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    error: (error, stackTrace) {
                                                      return constants
                                                          .defaultError;
                                                    },
                                                    loading: () {
                                                      return Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Column(
                                                            children: [
                                                              constants
                                                                  .smolLoader,
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Text(
                                                                "Loading Rail-Compatible Attachments",
                                                                style: constants
                                                                    .subtlebadnews,
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
                                        child: const Icon(Icons.add,
                                            color: Colors.red))
                                  ],
                                ),
                              ),
                              const Spacer()
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    constants.weaponInquiryCardAttachment[
                                        widget.right!.AttachmentPart]!,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  constants.endpointGetAttachmentPicture(
                                      widget.right!.AttachmentName,
                                      widget.right!.AttachmentPart),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
