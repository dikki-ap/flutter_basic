// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context)
        .size
        .height; // Device Height (Exclude AppBar and StatusBar)
    final appBarHeight = AppBar().preferredSize.height; // AppBar Height
    final statusBarHeight =
        MediaQuery.of(context).padding.top; // Status Bar Height

    final bodyHeight = deviceHeight - appBarHeight - statusBarHeight;

    return Scaffold(
        appBar: appBar('InkWell Custom Button'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Normal Button using ElevatedButton
              ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),

              // InkWell Custom Button
              Material(
                borderRadius: BorderRadius.circular(
                    24), // Make sure u have same borderRadius with Outer Style (Container)
                elevation: 5,
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                        colors: const [Colors.pink, Colors.purple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(
                        24), // Make sure u have same borderRadius with Outer Style (Container)
                    color: Colors
                        .transparent, // U need to use this if u already make a custom Container, so Material doesn't override Container Style
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          24), // Make sure u have same borderRadius with Outer Style (Container)
                      onTap: () {},
                      splashColor: Colors
                          .blue, // U can change splashColor when u hold the Button
                      child: Center(
                          child: Text(
                        'InkWell Button',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
