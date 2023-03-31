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
    final statusBarHeight = MediaQuery.of(context).padding.top; // Status Bar Height

    final bodyHeight = deviceHeight - appBarHeight - statusBarHeight;

    return Scaffold(
        appBar: appBar('Media Query'),
        body: Column(
          children: [
            Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width /
                  3, // 1/3 from Device Length
              height: bodyHeight / 2, // 1/2 from Body Height
            ),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width /
                  3, // 1/3 from Device Length
              height: bodyHeight / 2, // 1/2 from Body Height
            ),
          ],
        ));
  }
}
