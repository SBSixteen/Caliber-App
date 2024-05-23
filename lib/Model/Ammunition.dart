// ignore_for_file: non_constant_identifier_names

class Ammunition{
  String AmmunitionCaliber;
  String AmmunitionVariant;
  String AmmunitionDescription;
  int AmmunitionSpeed;
  int AmmunitionPenn;
  int AmmunitionFrag;
  double AmmunitionPrice;

  Ammunition(
    this.AmmunitionCaliber,
    this.AmmunitionVariant,
    this.AmmunitionDescription,
    this.AmmunitionSpeed,
    this.AmmunitionPenn,
    this.AmmunitionFrag,
    this.AmmunitionPrice
  );

  factory Ammunition.fromJson(Map<dynamic, dynamic> json){
    return Ammunition(
      json["ammunitionCaliber"],
      json["ammunitionVariant"],
      json["ammunitionDescription"],
      json["ammunitionSpeed"],
      json["ammunitionPenn"],
      json["ammunitionFrag"],
      json["ammunitionPrice"],
    );
  }
}