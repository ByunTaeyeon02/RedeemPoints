import 'package:flutter/material.dart';
import 'Wheel.dart';
import 'Category.dart';
import 'Controller.dart';
import 'Model.dart';
import 'Tier.dart';

late Category prizeResult;
Model model = Model();
String fontName = 'FredokaOne';
Color baseColor = Color(0xFFE3F2FD);
Color fontColor = Colors.black;

void main() {
  //imageCache.clear();
  Category prizeResult = model.getWheel().getPrize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return MaterialApp(
      title: 'Price Redeem App',
      theme: ThemeData(
        fontFamily: fontName,
        primarySwatch: Colors.blue,
      ),
      home: const SelectPrize(title: 'Selection Page'),
    );
  }
}

class SelectPrize extends StatelessWidget {
  const SelectPrize({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding =
        ((screenWidth - (2 * (screenHeight / 5))) / 3).roundToDouble() - 1;
    return Scaffold(
      backgroundColor: baseColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/goldback.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: padding - (padding / 4)),
              buildRow(screenHeight, padding, context),
              SizedBox(height: padding - (padding / 4)),
              buildRow(screenHeight, padding, context),
              SizedBox(height: padding - (padding / 4)),
              buildRow(screenHeight, padding, context),
              SizedBox(height: padding - (padding / 4)),
              buildRow(screenHeight, padding, context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRow(double screenHeight, double padding, context) {
  imageCache.clear();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //SizedBox(width: padding),
      GestureDetector(
        onTap: () {
          imageCache.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TenPointsPrize(title: '10 Points Prize');
          }));
        }, // Image tapped
        child: Image.asset(
          'assets/images/shook.webp',
          height: screenHeight / 5,
          width: screenHeight / 5,
        ),
      ),
      SizedBox(width: padding - (padding / 4)),
      GestureDetector(
        onTap: () {
          imageCache.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TenPointsPrize(title: '10 Points Prize');
          }));
        }, // Image tapped
        child: Image.asset(
          'assets/images/shook.webp',
          height: screenHeight / 5,
          width: screenHeight / 5,
        ),
      ),

      //SizedBox(width: padding),
    ],
  );
}

class TenPointsPrize extends StatelessWidget {
  static const String routeName = '/prizePreopen';
  const TenPointsPrize({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: baseColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/goldback.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              imageCache.clear();
            }, // Image tapped
            child: Image.asset(
              'assets/images/shook.webp',
              fit: BoxFit.cover,
              height: screenHeight / 2.5,
              width: screenHeight / 2.5,
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.2, 0.80),
        child: ElevatedButton(
          onPressed: () {
            model = new Model();
            imageCache.clear();
            prizeResult = model.getWheel().getPrize();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Result(title: 'Prize Result');
            }));
          },
          child: Text('Open Prize', style: TextStyle(fontSize: screenHeight / 13)),
          style: ElevatedButton.styleFrom(
            primary: fontColor, //background
            onPrimary: Color(0xFFFFD740), //foreground
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {

  const Result({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: prizeResult.getTier().getColor(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight / 12),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: screenWidth / 7,
                color: fontColor,
                fontFamily: fontName,
              ),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(prizeResult.getTier().getRank()),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight / 12),
            Image.asset(
              prizeResult.getImageString(),
              //fit: BoxFit.cover,
              height: screenHeight / 2.5,
              width: screenHeight / 2.5,
            ),
            //IconButton(
              //icon: Image.asset(prizeResult.getImageString()),
              //iconSize: screenWidth / 1.25,
              //onPressed: () {},
            //),
            SizedBox(height: screenHeight / 12),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: screenWidth / 10,
                color: fontColor,
                fontFamily: fontName,
              ),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(prizeResult.getName()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: screenWidth / 6,
        width: screenWidth / 6,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: fontColor,
            onPressed: () {
              Navigator.pop(context);
              imageCache.clear();
            },
            child: Icon(
              Icons.autorenew,
              color: prizeResult.getTier().getColor(),
            ),
          ),
        ),
      ),
    );
  }
}


