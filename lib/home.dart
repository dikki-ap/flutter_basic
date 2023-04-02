// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/provider/application_color.dart';
import 'package:provider/provider.dart';

/*
  -- Provider State Management --
  If u want to use Provider State Management, u need to add library from pub.dev

  1. U need to create SharedState that implements ChangeNotifier
  ChangeNotifier functions to notify if there are changes that to the SharedState

  2. U need to wrap the ROOT Widget like Scaffold using "ChangeNotifierProvider" Widget and declare "create" property

  3. If u already create SharedState that implements ChangeNotifer and wrap the ROOT Widget,
  u need to wrap the Widget that will be changed using "Consumer" Widget
  "Consumer" Widget will be receive the info about changes from ChangeNotifierProvider

  4. The last one, u need to add "builder" property on each Consumer Widget
  "builder" property need function that need 3 params, but u can use just 2 params, and leave it the last one with "_"
*/

// U don't need StatefulWidget if are using Provider State Management
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap Scaffold using ChangeNotifierProvider
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) =>
          ApplicationColor(), // U need "create" property if are using ChangeNotifierProvider
      // builder: (context, widget) {
      //   widget = ApplicationColor();
      // },
      child: Scaffold(
        appBar: AppBar(
          // Wrap each Widget that will be changed with "Consumer" Widget, and declare "builder" property
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              'Provider State Management',
              style: TextStyle(
                  color: applicationColor
                      .getColor), // U can use applicationColor.getColor method to get the color depends from the Condition
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(8),
                    color: applicationColor.getColor,
                    duration: Duration(seconds: 1)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Text(
                        'Amber',
                        style: TextStyle(color: applicationColor.getColor),
                      ),
                    ),
                  ),
                  Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                          value: applicationColor.isLightBlue,
                          onChanged: (newValue) {
                            applicationColor.isLightBlue = newValue;
                          })),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Text(
                        'Light Blue',
                        style: TextStyle(color: applicationColor.getColor),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
