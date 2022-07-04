import 'package:flutter/material.dart';

class Tier {
  late int tierNum;
  late Color color;

  Tier(int rank) {
    tierNum = rank;

    if (rank == 1) {
      color = Colors.purple;
    } else if (rank == 2) {
      color = Colors.red;
    } else if (rank == 3) {
      color = Colors.orange;
    } else if (rank == 4) {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }
  }

  int getTierNum() {
    return tierNum;
  }

  String getRank() {
    if (tierNum == 1) {
      return "Legendary";
    } else if (tierNum == 2) {
      return "Epic";
    } else if (tierNum == 3) {
      return "Rare";
    } else if (tierNum == 4) {
      return "Uncommon";
    } else {
      return "Common";
    }
  }

  Color getColor() {
    return color;
  }
}
