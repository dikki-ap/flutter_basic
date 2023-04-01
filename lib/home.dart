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

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: appBar('TabBar on AppBar', [
            Tab(
              icon: Icon(Icons.thumb_up),
              text: 'Like',
            ),
            Tab(icon: Icon(Icons.comment), text: 'Comment'),
            Tab(
              child: Image(image: AssetImage('assets/img/fb_icon.png')),
            ),
            Tab(
              child: Image(image: AssetImage('assets/img/twitter_icon.png')),
            ),
          ]),
          backgroundColor: Colors.blue[50],

          // U need to add TabBarView if are using TabBar, u can redirect to another Page if u want
          body: TabBarView(children: const [
            Center(child: Text('Like')),
            Center(child: Text('Comment')),
            Center(child: Text('Facebook')),
            Center(child: Text('Twitter')),
          ])),
    );
  }
}
