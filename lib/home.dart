// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController for TextField Controller
  TextEditingController nameController =
      TextEditingController(text: 'Default Name');

  // initialCondition for Switch
  bool isOn = false;

  // initialValue for AnimatedSitcher "child"
  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.red, border: Border.all(color: Colors.black, width: 3)),
  );

  // U need to create a async Function because SharedPref need "await" keyword
  void saveData() async {
    // need "await" keyword because "getInstance()" is Future type
    SharedPreferences pref = await SharedPreferences.getInstance();

    // U can use "setXXX" method with "key" and "value"
    pref.setString("name", nameController.text);
    pref.setBool("isOn", isOn);
  }

  // LOAD DATA FUNCTION
  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    // U need to add "??" operator to check if it's null, and give it the default value when it's null
    return pref.getString("name") ?? "Default Name";
  }

  // LOAD DATA FUNCTION
  Future<bool> getON() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    // U need to add "??" operator to check if it's null, and give it the default value when it's null
    return pref.getBool("isOn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shared Preferences'),
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
              Column(
                children: [
                  AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    transitionBuilder: (child, animation) => RotationTransition(
                      turns: animation,
                      child: child,
                    ),
                    child: myWidget,
                  ),
                  TextField(controller: nameController)
                ],
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
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        saveData();
                      },
                      child: Text('Save')),
                  ElevatedButton(
                      onPressed: () {
                        getName().then((value) {
                          setState(() {
                            nameController.text = value;
                          });
                        });

                        getON().then((value) {
                          setState(() {
                            isOn = value;
                          });
                        });
                      },
                      child: Text('Load'))
                ],
              )
            ],
          ),
        ));
  }
}
