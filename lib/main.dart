// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Style'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'This is regular text',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.blue,
                  decorationThickness: 5,
                  decorationStyle: TextDecorationStyle.wavy),
            ),
            Text(
              'This is italic text',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 5,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          ],
        )),
      ),
    );
  }
}
