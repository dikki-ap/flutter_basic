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
  List<Widget> dataWidgets = []; // Make a list that has Widget Type
  int counter = 1; // Counter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  // Using Anonymous Function to setState and Add Widget
                    onPressed: () {
                      setState(() {
                        dataWidgets.add(Text(
                          'Data - $counter',
                          style: TextStyle(fontSize: 36),
                        ));
                        counter++;
                      });
                    },
                    child: Text('Add Data')),
                ElevatedButton(
                  // Using Anonymous Function to setState and Remove Widget
                    onPressed: () {
                      setState(() {
                        dataWidgets.removeLast();
                        counter--;
                      });
                    },
                    child: Text('Remove Data'))
              ],
            ),
            Column(
              children: dataWidgets,
            )
          ],
        ),
      ),
    );
  }
}
