// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/colorful_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colorful Button with Transform Widget'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorfulButton(Colors.red, Colors.blue, Icons.adb),
          ColorfulButton(Colors.green, Colors.purple, Icons.thumb_up),
          ColorfulButton(Colors.teal, Colors.orange, Icons.comment),
          ColorfulButton(Colors.lightBlue, Colors.red, Icons.phone),
        ],
      )),
    );
  }
}
