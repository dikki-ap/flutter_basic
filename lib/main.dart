// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random(); // Make a Random Object from "dart:math"

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('AnimatedContainer & GestureDetector'),
          ),
          body: Center(
            // Wrap AnimatedContainer with GestureDetector to add onTap Function
            // So when u tap the Container it will be generated Random size and color
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                color: Color.fromARGB(
                    255,
                    random.nextInt(256),
                    random.nextInt(256),
                    random.nextInt(
                        256)), // "nextInt()" make a random from 0 - max (0 is Inclusive and Max is Exclusive)
                width: 50.0 + random.nextInt(101),
                height: 50.0 + random.nextInt(101),
              ),
            ),
          )),
    );
  }
}
