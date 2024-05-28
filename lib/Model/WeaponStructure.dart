import 'package:calibre/Model/Attachment.dart';

class WeaponStructure{

  Map<String, Attachment> manifest = {};

  WeaponStructure();

  void addAttachment(String position, Attachment attachment){

    if(manifest.containsKey(position)){
      manifest.update(position, (value) => attachment);
      return;
    }
    manifest.putIfAbsent(position, () => attachment);
  }

}