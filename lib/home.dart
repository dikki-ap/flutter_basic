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
        appBar: appBar('Custom Card (Opacity)'),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [Colors.white, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: bodyHeight * 0.7,
                child: Card(
                  elevation: 10,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/img/bg_pattern.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        height: bodyHeight * 0.35, // 1/2 from Card Height
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4)),
                            image: DecorationImage(
                                image: AssetImage('assets/img/background.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            20, 50 + bodyHeight * 0.35, 20, 20),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Gradient Custom Background Wallpaper',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 24,
                                ),
                                maxLines: 2,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Posted on ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      '31 March 2022 ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.purple),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: const [
                                  Spacer(
                                    flex: 10,
                                  ),
                                  Icon(Icons.thumb_up, color: Colors.purple),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text('999'),
                                  Spacer(
                                    flex: 5,
                                  ),
                                  Icon(Icons.comment, color: Colors.purple),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text('898'),
                                  Spacer(
                                    flex: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
