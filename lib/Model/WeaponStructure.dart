import 'package:calibre/Model/Attachment.dart';
import 'package:calibre/Model/Weapon.dart';

class WeaponStructure{

  Map<String, Attachment> manifest = {};
  Weapon? weapon;

  WeaponStructure();

  void addAttachment(String position, Attachment attachment){

    if(manifest.containsKey(position)){
      manifest.update(position, (value) => attachment);
      return;
    }
    manifest.putIfAbsent(position, () => attachment);
  }

  void setWeapon(Weapon wep){
    weapon = wep;
  }
}