// ignore_for_file: prefer_const_constructors

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
  int number = 0; // Declare number as int

  // void addNumber() {
  //   // Use setState to refresh page when button pressed, and update number value
  //   setState(() {
  //     number += 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anonymous Method on Stateful Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: TextStyle(
                    fontSize: 10 +
                        number
                            .toDouble()), // Making fontSize grow bigger when button pressed
              ),
              ElevatedButton(
                // U can use Anonymous Method when u just only make a function that used once
                onPressed: () {
                  setState(() {
                    number += 1;
                  });
                }, // Running addNumber() function when button pressed
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
