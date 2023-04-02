// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/models/People.dart';
import 'package:flutter_basic/models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = false;
  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.red, border: Border.all(color: Colors.black, width: 3)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Switcher & Animated Switcher'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*
                -- Animated Switcher --
                need "duration" and "child" property
                u can add "transitionBuilder" to change the animation
                such as Rotation, Scale, etc.

                If u change the same widget, u need add "key" in the Widget
                but, if u change from widget to another widget u don't need "key"
              */
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
                child: myWidget,
              ),
              Switch(
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red[300],
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;

                      if (isOn) {
                        myWidget = Container(
                          key: Key(
                              "1"), // U need to add "key" because this is the same Widget
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.blue, width: 3)),
                        );
                      } else {
                        myWidget = Container(
                          key: Key(
                              "0"), // U need to add "key" because this is the same Widget
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                        );
                      }
                    });
                  })
            ],
          ),
        ));
  }
}
