import 'package:flutter/material.dart';
import 'Tier.dart';

class Category {
  late String name;
  late Tier tier;
  late bool isGud;
  late String imageSrc;

  Category (String name, int rankNum, bool isGud, String imageSrc) {
    this.name = name;
    this.isGud = isGud;
    this.tier = new Tier(rankNum);
    this.imageSrc = imageSrc;
  }

  String getName() {
    return name;
  }

  Tier getTier() {
    return tier;
  }

  bool isItGud() {
    return isGud;
  }

  String getImageString() {
    return imageSrc;
  }
}
