// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/app_bar.dart';

class HomePage extends StatelessWidget {
  double getSmallDiamter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiamter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context)
        .size
        .height; // Device Height (Include AppBar and StatusBar)
    final appBarHeight = AppBar().preferredSize.height; // AppBar Height
    final statusBarHeight =
        MediaQuery.of(context).padding.top; // Status Bar Height

    final bodyHeight = deviceHeight - appBarHeight - statusBarHeight;

    return Scaffold(
        appBar: appBar('Hero Animation'),
        backgroundColor: Colors.blue[50],
        // Using ClipRRect to Wrap Container into RoundedRectangle
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            }));
          },
          // Wrap Image with Hero to change with HeroAnimation
          child: Hero(
            tag: 'jennie_picture',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 200,
                height: 200,
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://inikpop.com/wp-content/uploads/2018/12/jennie.jpg')),
              ),
            ),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Second Page'),
        backgroundColor: Colors.blue[50],
        // Using ClipRRect to Wrap Container into RoundedRectangle
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            // Wrap Image with Hero to change with HeroAnimation
            child: Hero(
              tag: 'jennie_picture',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://inikpop.com/wp-content/uploads/2018/12/jennie.jpg')),
                ),
              ),
            ),
          ),
        ));
  }
}
