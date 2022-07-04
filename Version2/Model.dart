import 'Wheel.dart';
import 'Category.dart';
import 'Controller.dart';
import 'dart:async';
import 'dart:io';

class Model {
  late Wheel wheel;
  late Controller controller;
  late Category choosenOne;

  Model() {
    wheel = new Wheel();
    controller = new Controller(this);
    loadPresets();
  }

  Controller getController() {
    return controller;
  }

  void loadPresets() {
    wheel = new Wheel();
    loadLine("5 : Spin Again : false : assets/images/spin.gif");
    loadLine("5 : Spin Again\nNext Week : false : assets/images/hampterspin.gif");
    loadLine("5 : 5 Points : false : assets/images/ugh.png");
    loadLine("5 : 1 Snack : true : assets/images/snacks.png");
    loadLine("5 : 50 Cents : true : assets/images/coinspin.gif");
    loadLine("4 : Ketchup Packet : false : assets/images/ketchup.png");
    loadLine("4 : 1 Dollar : true : assets/images/coinspin.gif");
    loadLine("4 : Giant Paperclip : false : assets/images/paperclip.png");
    loadLine("3 : 5 Extra Minutes : true : assets/images/5zoom.gif");
    loadLine("3 : Lose 5 Minutes : false : assets/images/cry.webp");
    loadLine("2 : 5 Points : false : assets/images/ugh.png");
    loadLine("2 : Pop-it : true : assets/images/popit.webp");
    loadLine("1 : 5 Dollars : true : assets/images/moneyy.webp");
    loadLine("1 : 800 Robux : true : assets/images/robux.png");
    loadLine("1 : Giftcard : true : assets/images/moneybag.gif");
    loadLine("1 : Lose 10 Minutes : false : assets/images/clown.png");
    loadLine("1 : 20 Points : true : assets/images/flosh.webp");

  }

  void loadLine(String s) {
    var info = s.split(" : ");
    int rank = int.parse(info[0]);
    bool isGud = true;
    if (info[2] == "false")
      isGud = false;
    wheel.add(new Category(info[1], rank, isGud, info[3]));
  }

  Wheel getWheel() {
    return wheel;
  }

  void setChoosen(Category choosenOne) {
    this.choosenOne = choosenOne;
  }

  Category getChoosen() {
    return choosenOne;
  }
}