import 'package:flutter/material.dart';
import 'Category.dart';
import 'dart:math';

class Wheel {
  late List<Category> list;
  late List<Category> common;
  late List<Category> uncommon;
  late List<Category> rare;
  late List<Category> epic;
  late List<Category> legendary;

  Wheel() {
    //list = List<Category>.empty(growable: true); //1 common (50), 1 uncommon (25), 1 rare (15), 1 epic (8), 1 legendary (2)
    list = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true); //1 common (50), 1 uncommon (25), 1 rare (15), 1 epic (8), 1 legendary (2)
    //legendary = List<Category>.empty(growable: true);
    //epic = List<Category>.empty(growable: true);
    //rare = List<Category>.empty(growable: true);
    //uncommon = List<Category>.empty(growable: true);
    //common = List<Category>.empty(growable: true);
    legendary = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
    epic = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
    rare = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
    uncommon = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
    common = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
  }

  void add(Category c) {
    if (c.getTier().getTierNum() == 1) {
      legendary.add(c);
    } else if (c.getTier().getTierNum() == 2) {
      epic.add(c);
    } else if (c.getTier().getTierNum() == 3) {
      rare.add(c);
    } else if (c.getTier().getTierNum() == 4) {
      uncommon.add(c);
    } else {
      common.add(c);
    }
  }

  //maybe add different kind of tier boxes (5 points = worst percent than 10 points?)
  void genNew() {
    legendary.removeAt(0);
    epic.removeAt(0);
    rare.removeAt(0);
    uncommon.removeAt(0);
    common.removeAt(0);

    list = List<Category>.filled(1, Category('temp', 1, true, ""), growable: true);
    var r = Random();

    int rCommon = r.nextInt(common.length);
    list.add(common.elementAt(rCommon));

    int rUncommon = r.nextInt(uncommon.length);
    list.add(uncommon.elementAt(rUncommon));

    int rRare = r.nextInt(rare.length);
    list.add(rare.elementAt(rRare));

    int rEpic = r.nextInt(epic.length);
    list.add(epic.elementAt(rEpic));

    int rLegendary = r.nextInt(legendary.length);
    list.add(legendary.elementAt(rLegendary));

    list.removeAt(0);
  }

  Category getPrize() {
    genNew();
    var r = Random();
    int num = r.nextInt(99);
    if (num >= 1 && num < 50)
      return list.elementAt(0);
    else if (num >= 50 && num < 75)
      return list.elementAt(1);
    else if (num >= 75 && num < 90)
      return list.elementAt(2);
    else if (num >= 90 && num < 98)
      return list.elementAt(3);
    else //if (num == 99 || num == 0)
      return list.elementAt(4);
  }

  List<Category> getList() {
    return list;
  }

  void setList(List<Category> newList) {
    list = newList;
  }
}

