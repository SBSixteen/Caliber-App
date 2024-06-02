import 'package:calibre/Model/Ammunition.dart';
import 'package:calibre/Model/Weapon.dart';
import 'package:calibre/Model/WeaponStructure.dart';
import 'package:calibre/Provider/Ammunition_Provider.dart';
import 'package:calibre/Provider/WeaponStructure_Provider.dart';
import 'package:calibre/Provider/Weapon_Provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var confirmedCalibers = [
    ".300 Blackout",
    ".338 Lapua Magnum",
    ".357 Magnum",
    ".366 TKM",
    ".45 ACP",
    "12.7x108mm",
    "12.7x55mm",
    "12x70mm",
    "23x75mm",
    "4.6x30mm HK",
    "5.45x39mm",
    "5.56x45mm NATO",
    "5.7x28mm FN",
    "6.8x51mm",
    "7.62x25T",
    "7.62x39mm",
    "7.62x51mm NATO",
    "7.62x54mmR",
    "9x18mm Makarov",
    "9x19mm Parabellum",
    "9x21mm Gyurza",
    "9x39mm"
  ];

  var dbCommit = await AmmunitionService().getCalibers();
  var weapon = await WeaponService().getWeaponFromName("AK-74M");

  var correctweapon = Weapon.fromJson({
    "weaponName": "AK-74M",
    "weaponCaliber": "5.45x39mm",
    "weaponMake": "Kalashnikov Concern",
    "weaponWeight": 3.605,
    "rof": 650,
    "efr": 650,
    "weaponDescription":
        "The AK-74M (Avtomat Kalashnikova 74 Modernizirovanny - \"Kalashnikov's Automatic rifle 74 Modernized\") 5.45x39mm assault rifle is a full-scale produced modernized version of the AK-74 that offers more versatility compared with its predecessor. Apart from several minor improvements, such as a lightened bolt and carrier assembly to reduce the impulse of the gas piston and bolt carrier during firing, the rifle features a new glass-filled polyamide stock that retains the shape of the original AK-74 fixed laminated wood stock, but side-folds to the left like the skeletonized AKS-74 buttstock, and also a dovetail side mount for installing various scopes. The AK-74M is a main service rifle of the Russian Federation.",
    "weaponType": "Assault Rifle",
    "weaponTypeShort": "AR",
    "weaponOrigin": "Soviet Union",
    "weaponDiscount": 1.008831144822972,
    "weaponPrice": 192517.1
  });

  var ammo = await AmmunitionService().getAmmunition("5.45x39mm", "PPBS");

  var correctammo = Ammunition.fromJson({
    "ammunitionCaliber": "5.45x39mm",
    "ammunitionVariant": "PPBS",
    "ammunitionDescription":
        "A 5.45x39mm PPBS gs (GRAU Index - 7N39) cartridge with a 4 gram armor-piercing bullet with a pointed tungsten carbide core with two-layer jacket, a lead interior and a bimetallic exterior, in a steel case. This experimental cartridge was developed by TsNIITochMash and TechKomplekt under the name of \"Igólnik\" (\"Needlecase\") based on the 5.45x39mm BS gs cartridge to increase its penetration capabilities, providing excellent results against the most modern specialized ballistic body protections, in addition to being capable of piercing light covers and light armored vehicles, however, due to its design, it has a high bounce probability off various surfaces.",
    "ammunitionSpeed": 905,
    "ammunitionPenn": 62,
    "ammunitionFrag": 37,
    "ammunitionPrice": 2176.93
  });

  List<String> wepStruct =
      await WeaponStructureService().getWeaponAttachmentPositions("AK-74M");
  List<String> correctwepStruct = [
    "Magazine",
    "Dust Cover",
    "Muzzle",
    "Handguard",
    "Platform",
    "Rear Sight",
    "Grip",
    "Stock"
  ];

  print(correctweapon.WeaponPrice);
  test("Check Calibers for Tab Controller Consistency", () {
    for (int i = 0; i < dbCommit.length; i++) {
      if (dbCommit[i] != confirmedCalibers[i]) {
        expect(false, true);
      }
    }

    expect(true, true);
  });

  test("Check Weapon for Model consistency", () {
    expect(correctweapon.WeaponName, weapon.WeaponName);
    expect(correctweapon.WeaponMake, weapon.WeaponMake);
    expect(correctweapon.WeaponCaliber, weapon.WeaponCaliber);
    expect(correctweapon.WeaponOrigin, weapon.WeaponOrigin);
    expect(correctweapon.WeaponPrice, weapon.WeaponPrice);
    expect(correctweapon.WeaponType, weapon.WeaponType);
    expect(correctweapon.rof, weapon.rof);
    expect(correctweapon.efr, weapon.efr);
    expect(correctweapon.WeaponWeight, weapon.WeaponWeight);
    expect(correctweapon.WeaponDescription, weapon.WeaponDescription);
  });

  test("Check Ammo for Model consistency", () {
    expect(correctammo.AmmunitionCaliber, ammo.AmmunitionCaliber);
    expect(correctammo.AmmunitionDescription, ammo.AmmunitionDescription);
    expect(correctammo.AmmunitionFrag, ammo.AmmunitionFrag);
    expect(correctammo.AmmunitionPenn, ammo.AmmunitionPenn);
    expect(correctammo.AmmunitionPrice, ammo.AmmunitionPrice);
    expect(correctammo.AmmunitionSpeed, ammo.AmmunitionSpeed);
    expect(correctammo.AmmunitionVariant, ammo.AmmunitionVariant);
  });

  test("Check for Weapon Structure", () {});
}
